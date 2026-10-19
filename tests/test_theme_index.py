"""Headless tests of pure theme-index calculations without requiring QGIS."""

from __future__ import annotations

import importlib.util
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

import pytest


@pytest.fixture
def theme_script(monkeypatch: pytest.MonkeyPatch) -> Any:
    qgis = ModuleType("qgis")
    qgis.__path__ = []  # type: ignore[attr-defined]
    qt = ModuleType("qgis.PyQt")
    qt.__path__ = []  # type: ignore[attr-defined]
    qtcore = ModuleType("qgis.PyQt.QtCore")
    core = ModuleType("qgis.core")
    qtcore.QVariant = type("QVariant", (), {"String": "string"})  # type: ignore[attr-defined]
    class_names = [
        "QgsFeature",
        "QgsField",
        "QgsGeometry",
        "QgsLayerTreeGroup",
        "QgsLayerTreeLayer",
        "QgsLayerTreeModel",
        "QgsMapLayer",
        "QgsMapThemeCollection",
        "QgsPointXY",
        "QgsProject",
        "QgsVectorFileWriter",
        "QgsVectorLayer",
        "QgsWkbTypes",
    ]
    for name in class_names:
        setattr(core, name, type(name, (), {}))
    for name, module in [
        ("qgis", qgis),
        ("qgis.PyQt", qt),
        ("qgis.PyQt.QtCore", qtcore),
        ("qgis.core", core),
    ]:
        monkeypatch.setitem(sys.modules, name, module)
    source = Path(__file__).resolve().parents[1] / "scripts" / "LotsOfThemes" / "create_new_themes_from_list.py"
    spec = importlib.util.spec_from_file_location("_qgis_theme_test", source)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_output_rows_are_sorted_and_sequential(theme_script: Any) -> None:
    rows = theme_script.build_output_rows(
        [
            "Z_05.0p_0120m_V_Max",
            "A_01.0p_0360m_d_HR_Max_DIFF",
        ]
    )
    assert [row["theme_name"] for row in rows] == [
        "A_01.0p_0360m_d_HR_Max_DIFF",
        "Z_05.0p_0120m_V_Max",
    ]
    assert [row["out_name"] for row in rows] == ["00000", "00001"]
    assert rows[0]["AEP"] == "01.0"
    assert rows[0]["duration"] == "0360"
    assert rows[0]["result_type"] == "d_HR_Max"
    assert rows[0]["DIFF"] == 1


def test_empty_and_duplicate_themes(theme_script: Any) -> None:
    assert theme_script.build_output_rows([]) == []
    with pytest.raises(ValueError, match="Duplicate theme"):
        theme_script.build_output_rows(["Alpha", "alpha"])


def test_aep_requires_complete_token_boundary(theme_script: Any) -> None:
    embedded = theme_script.build_output_rows(["storm01.0p_V_Max"])
    valid = theme_script.build_output_rows(["storm_01.0p_V_Max"])
    assert embedded[0]["AEP"] == "N/A"
    assert valid[0]["AEP"] == "01.0"
