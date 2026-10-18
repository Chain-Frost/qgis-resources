"""Headless behaviour tests for GeoPackage cleanup and spatial indexing."""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

import pytest


@pytest.fixture
def tools(monkeypatch: pytest.MonkeyPatch) -> tuple[ModuleType, ModuleType]:
    """Load scripts without native PyQGIS, mocking only provider constants."""
    qgis = ModuleType("qgis")
    qgis.__path__ = []  # type: ignore[attr-defined]
    core = ModuleType("qgis.core")
    provider = type("QgsVectorDataProvider", (), {"CreateSpatialIndex": 8})
    core.QgsVectorDataProvider = provider  # type: ignore[attr-defined]
    monkeypatch.setitem(sys.modules, "qgis", qgis)
    monkeypatch.setitem(sys.modules, "qgis.core", core)
    folder = Path(__file__).absolute().parents[1]
    modules = []
    for filename in ("cleanup_geopackage_fields.py", "create_spatial_indexes.py"):
        source = folder / filename
        spec = importlib.util.spec_from_file_location(filename.removesuffix(".py"), source)
        assert spec is not None and spec.loader is not None
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        modules.append(module)
    return modules[0], modules[1]


class FakeField:
    def __init__(self, name: str) -> None:
        self._name = name

    def name(self) -> str:
        return self._name


class FakeProvider:
    def __init__(self, *, capabilities: int = 8, works: bool = True) -> None:
        self._capabilities = capabilities
        self.works = works
        self.index_calls = 0

    def capabilities(self) -> int:
        return self._capabilities

    def createSpatialIndex(self) -> bool:
        self.index_calls += 1
        return self.works


class FakeLayer:
    def __init__(
        self,
        path: Path,
        *,
        field_names: list[str] | None = None,
        commit_ok: bool = True,
        provider: FakeProvider | None = None,
    ) -> None:
        self.path = path
        self.field_names = field_names or []
        self.commit_ok = commit_ok
        self.provider = provider or FakeProvider()
        self.editable = False
        self.deleted: list[int] = []
        self.rollbacks = 0
        self.commits = 0

    def name(self) -> str:
        return self.path.stem

    def source(self) -> str:
        return str(self.path) + "|layername=foo"

    def providerType(self) -> str:
        return "ogr"

    def isValid(self) -> bool:
        return True

    def isEditable(self) -> bool:
        return self.editable

    def fields(self) -> list[FakeField]:
        return [FakeField(name) for name in self.field_names]

    def startEditing(self) -> bool:
        self.editable = True
        return True

    def deleteAttribute(self, index: int) -> bool:
        self.deleted.append(index)
        self.field_names.pop(index)
        return True

    def commitChanges(self) -> bool:
        self.commits += 1
        if self.commit_ok:
            self.editable = False
        return self.commit_ok

    def commitErrors(self) -> list[str]:
        return ["mock commit failure"]

    def rollBack(self) -> None:
        self.rollbacks += 1
        self.editable = False

    def updateFields(self) -> None:
        return None

    def dataProvider(self) -> FakeProvider:
        return self.provider


def test_cleanup_is_dry_run_by_default(tools: tuple[Any, Any], tmp_path: Path) -> None:
    cleanup, _ = tools
    layer = FakeLayer(tmp_path / "a.gpkg", field_names=["Keep", "Text", "EntityHandle"])
    assert cleanup.clean_fields([layer]) == (1, 0, 0)
    assert layer.field_names == ["Keep", "Text", "EntityHandle"]
    assert layer.commits == 0


def test_cleanup_removes_fields_in_reverse_index_order(tools: tuple[Any, Any], tmp_path: Path) -> None:
    cleanup, _ = tools
    layer = FakeLayer(tmp_path / "a.gpkg", field_names=["Text", "Keep", "EntityHandle"])
    assert cleanup.clean_fields([layer], dry_run=False) == (1, 0, 0)
    assert layer.deleted == [2, 0]
    assert layer.field_names == ["Keep"]
    assert layer.commits == 1


def test_cleanup_rejects_other_formats_and_handles_commit_error(
    tools: tuple[Any, Any],
    tmp_path: Path,
) -> None:
    cleanup, _ = tools
    shp = FakeLayer(tmp_path / "a.shp", field_names=["Text"])
    gpkg = FakeLayer(tmp_path / "a.gpkg", field_names=["Text"], commit_ok=False)
    assert cleanup.clean_fields([shp, gpkg], dry_run=False) == (0, 1, 1)
    assert gpkg.rollbacks == 1


def test_cleanup_requires_fields(tools: tuple[Any, Any]) -> None:
    cleanup, _ = tools
    with pytest.raises(ValueError, match="At least one"):
        cleanup.clean_fields([], fields_to_delete=())


def test_index_native_provider_and_existing_qix(tools: tuple[Any, Any], tmp_path: Path) -> None:
    _, indexer = tools
    new = FakeLayer(tmp_path / "new.shp")
    existing = FakeLayer(tmp_path / "old.shp")
    (tmp_path / "old.qix").touch()
    assert indexer.index_layers([new, existing]) == (1, 1, 0)
    assert new.provider.index_calls == 1
    assert existing.provider.index_calls == 0


def test_index_provider_failure_and_unsupported(tools: tuple[Any, Any], tmp_path: Path) -> None:
    _, indexer = tools
    failed = FakeLayer(tmp_path / "a.shp", provider=FakeProvider(works=False))
    no_capability = FakeLayer(tmp_path / "b.shp", provider=FakeProvider(capabilities=0))
    gpkg = FakeLayer(tmp_path / "c.gpkg")
    assert indexer.index_layers([failed, no_capability, gpkg]) == (0, 2, 1)


def test_index_dry_run_does_not_call_provider(tools: tuple[Any, Any], tmp_path: Path) -> None:
    _, indexer = tools
    layer = FakeLayer(tmp_path / "a.shp")
    assert indexer.index_layers([layer], dry_run=True) == (1, 0, 0)
    assert layer.provider.index_calls == 0
