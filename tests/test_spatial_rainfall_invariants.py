"""Protect proven spatial-rainfall edge-case logic without a native QGIS runtime.

These tests verify algorithm choices and pure helpers only. They cannot
replace historical project-level polygon/TUFLOW regression comparisons.
"""

from __future__ import annotations

import ast
import importlib.util
import sys
from pathlib import Path
from types import ModuleType
from typing import Any

import pytest


@pytest.fixture
def rainfall_script(monkeypatch: pytest.MonkeyPatch) -> Any:
    qgis = ModuleType("qgis")
    qgis.__path__ = []  # type: ignore[attr-defined]
    processing = ModuleType("qgis.processing")
    core = ModuleType("qgis.core")

    class FakePoint:
        def __init__(self, x: Any, y: float | None = None) -> None:
            self.x_value = float(x.x()) if y is None else float(x)
            self.y_value = float(x.y()) if y is None else float(y)

        def x(self) -> float:
            return self.x_value

        def y(self) -> float:
            return self.y_value

    class FakeVectorLayer:
        pass

    class FakeProject:
        @staticmethod
        def instance() -> None:
            return None

    class FakeProcessingException(Exception):
        pass

    names = (
        "QgsCoordinateReferenceSystem",
        "QgsCoordinateTransform",
        "QgsDistanceArea",
        "QgsFeature",
        "QgsFeatureSink",
        "QgsGeometry",
        "QgsProcessing",
        "QgsProcessingAlgorithm",
        "QgsProcessingContext",
        "QgsProcessingFeedback",
        "QgsProcessingMultiStepFeedback",
        "QgsProcessingParameterFeatureSink",
        "QgsProcessingParameterRasterLayer",
        "QgsProcessingParameterVectorLayer",
        "QgsWkbTypes",
    )
    for name in names:
        setattr(core, name, type(name, (), {}))
    core.QgsProcessing.TEMPORARY_OUTPUT = "memory:"  # type: ignore[attr-defined]
    core.QgsPointXY = FakePoint  # type: ignore[attr-defined]
    core.QgsVectorLayer = FakeVectorLayer  # type: ignore[attr-defined]
    core.QgsProject = FakeProject  # type: ignore[attr-defined]
    core.QgsProcessingException = FakeProcessingException  # type: ignore[attr-defined]

    qgis.processing = processing  # type: ignore[attr-defined]
    monkeypatch.setitem(sys.modules, "qgis", qgis)
    monkeypatch.setitem(sys.modules, "qgis.processing", processing)
    monkeypatch.setitem(sys.modules, "qgis.core", core)

    source = Path(__file__).absolute().parents[1] / "scripts" / "Spatial_Rainfall_Pattern.py"
    spec = importlib.util.spec_from_file_location("_spatial_rainfall_guard_test", source)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def test_snapping_and_ring_closure_are_preserved(rainfall_script: Any) -> None:
    algorithm = rainfall_script.Spatial_rainfall_pattern()
    assert algorithm.PRECISION_GRID_M == 0.001
    assert algorithm.FINAL_BUFFER_M == -0.1
    point = algorithm._snap_xy(1.2344, 9.8766, algorithm.PRECISION_GRID_M)
    assert (point.x(), point.y()) == pytest.approx((1.234, 9.877))

    ring = [
        rainfall_script.QgsPointXY(0, 0),
        rainfall_script.QgsPointXY(2, 0),
        rainfall_script.QgsPointXY(2, 2),
        rainfall_script.QgsPointXY(0, 2),
    ]
    algorithm._close_if_needed(ring)
    assert len(ring) == 5
    assert ring[-1].x() == ring[0].x()
    assert ring[-1].y() == ring[0].y()
    algorithm._close_if_needed(ring)
    assert len(ring) == 5  # already closed must not duplicate a vertex


def test_processing_output_preserves_original_object(rainfall_script: Any) -> None:
    algorithm = rainfall_script.Spatial_rainfall_pattern()
    result = object()
    assert algorithm._output({"OUTPUT": result}) is result
    with pytest.raises(rainfall_script.QgsProcessingException, match="OUTPUT"):
        algorithm._output(None)
    with pytest.raises(rainfall_script.QgsProcessingException, match="OUTPUT"):
        algorithm._output({})
    with pytest.raises(rainfall_script.QgsProcessingException, match="OUTPUT"):
        algorithm._output({"OUTPUT": None})


def test_fixgeometries_retains_original_zero_buffer_fallback(
    rainfall_script: Any, monkeypatch: pytest.MonkeyPatch
) -> None:
    algorithm = rainfall_script.Spatial_rainfall_pattern()
    calls: list[tuple[str, dict[str, Any]]] = []

    def run(algorithm_id: str, parameters: dict[str, Any], **kwargs: Any) -> dict[str, Any]:
        calls.append((algorithm_id, parameters))
        if algorithm_id == "native:fixgeometries":
            msg = "Known invalid polygon"
            raise rainfall_script.QgsProcessingException(msg)
        return {"OUTPUT": "repaired_same_layer"}

    monkeypatch.setattr(rainfall_script.processing, "run", run, raising=False)
    assert algorithm._repair_geoms_no_makevalid("input_layer", object(), object()) == "repaired_same_layer"
    assert [name for name, _ in calls] == ["native:fixgeometries", "native:buffer"]
    assert calls[1][1]["DISTANCE"] == 0.0
    assert calls[1][1]["DISSOLVE"] is False


def test_critical_topology_pipeline_stays_in_order() -> None:
    source = (Path(__file__).absolute().parents[1] / "scripts" / "Spatial_Rainfall_Pattern.py").read_text(
        encoding="utf-8"
    )
    tree = ast.parse(source)
    algorithms: list[str] = []
    for node in sorted(ast.walk(tree), key=lambda item: getattr(item, "lineno", -1)):
        if not isinstance(node, ast.Call) or not isinstance(node.func, ast.Attribute):
            continue
        if node.func.attr != "run" or not isinstance(node.func.value, ast.Name):
            continue
        if node.func.value.id != "processing" or not node.args:
            continue
        first = node.args[0]
        if isinstance(first, ast.Constant) and isinstance(first.value, str):
            algorithms.append(first.value)
    expected = (
        "native:polygonstolines",
        "native:dissolve",
        "native:polygonize",
        "native:addautoincrementalfield",
        "native:pointonsurface",
        "native:joinbynearest",
        "native:joinattributestable",
        "native:deleteduplicategeometries",
        "native:multiparttosingleparts",
        "native:fixgeometries",
        "native:buffer",
        "native:multiparttosingleparts",
        "native:fixgeometries",
        "native:extractbyexpression",
    )
    # Preserve the ordering of topology and cleanup operations, including the
    # nested nearest-neighbour join; other operations may be interleaved.
    start = 0
    for algorithm_id in expected:
        start = algorithms.index(algorithm_id, start) + 1
