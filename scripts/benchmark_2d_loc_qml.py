"""Benchmark 2d_loc QML application and map redraw inside the QGIS 4 Python console.

Run on a saved project with the target 2d_loc polygon layer selected. The
previous layer style is restored in a finally block. Results are diagnostic;
this script does not claim that a fast or slow redraw explains QML load time.
"""

from __future__ import annotations

from pathlib import Path
from time import perf_counter

from qgis.PyQt.QtCore import QEventLoop, QTimer
from qgis.core import Qgis, QgsFillSymbol, QgsMapLayerStyle, QgsSingleSymbolRenderer, QgsVectorLayer
from qgis.gui import QgsMapCanvas
from qgis.utils import iface

STYLE_PATH = Path(__file__).absolute().parents[1] / "styles" / "TUFLOW" / "2d_loc_qa_check.qml"
REFRESH_TIMEOUT_SECONDS = 120


def _measure_refresh(canvas: QgsMapCanvas, label: str) -> tuple[float, bool]:
    """Wait for the next completed canvas refresh and measure elapsed time."""
    loop = QEventLoop()
    timer = QTimer()
    timer.setSingleShot(True)
    completed = False

    def on_finished() -> None:
        nonlocal completed
        completed = True
        loop.quit()

    canvas.mapCanvasRefreshed.connect(on_finished)
    timer.timeout.connect(loop.quit)
    started = perf_counter()
    try:
        timer.start(REFRESH_TIMEOUT_SECONDS * 1000)
        canvas.refresh()
        loop.exec()
        elapsed = perf_counter() - started
    finally:
        timer.stop()
        canvas.mapCanvasRefreshed.disconnect(on_finished)

    status = "OK" if completed else "TIMEOUT"
    print(f"{label}: {elapsed:.2f} s [{status}]", flush=True)
    return elapsed, completed


def main() -> None:
    """Compare QML loading, full redraw, labeling and geometry-generator costs."""
    if iface is None:
        msg = "Run this script inside the QGIS desktop Python console."
        raise RuntimeError(msg)

    layer = iface.activeLayer()
    if not isinstance(layer, QgsVectorLayer) or not layer.isValid():
        msg = "Select a valid 2d_loc polygon vector layer before running."
        raise RuntimeError(msg)

    canvas = iface.mapCanvas()
    if canvas is None:
        msg = "QGIS map canvas is unavailable."
        raise RuntimeError(msg)

    if not STYLE_PATH.is_file():
        msg = f"Style not found: {STYLE_PATH}"
        raise FileNotFoundError(msg)

    previous_style = QgsMapLayerStyle()
    previous_style.readFromLayer(layer)
    if not previous_style.isValid():
        msg = "Unable to capture the current style; benchmark cancelled to avoid altering the project."
        raise RuntimeError(msg)

    print(f"QGIS: {Qgis.QGIS_VERSION}", flush=True)
    print(f"Layer: {layer.name()} | Provider: {layer.providerType()} | CRS: {layer.crs().authid()}", flush=True)
    print(f"Source: {layer.source()}", flush=True)
    print(f"QML: {STYLE_PATH}", flush=True)
    print("Keep map extent and layer visibility unchanged during the benchmark.", flush=True)

    try:
        started = perf_counter()
        message, success = layer.loadNamedStyle(str(STYLE_PATH))
        elapsed = perf_counter() - started
        print(f"Apply QML (loadNamedStyle): {elapsed:.2f} s | success={success}", flush=True)
        if not success:
            msg = f"Failed to apply QML: {message}"
            raise RuntimeError(msg)

        _measure_refresh(canvas, "Full style: first redraw")
        _measure_refresh(canvas, "Full style: second redraw")

        layer.setLabelsEnabled(False)
        _measure_refresh(canvas, "Geometry generators only (labels disabled)")

        layer.setLabelsEnabled(True)
        symbol = QgsFillSymbol.createSimple(
            {"color": "255,255,255,0", "outline_color": "128,128,128,255", "outline_width": "0.2"}
        )
        if symbol is None:
            msg = "Failed to construct the simple diagnostic renderer."
            raise RuntimeError(msg)
        layer.setRenderer(QgsSingleSymbolRenderer(symbol))
        _measure_refresh(canvas, "Labels only (simple renderer)")

        layer.setLabelsEnabled(False)
        _measure_refresh(canvas, "Simple renderer, no labels")
    finally:
        print("Restoring original layer style...", flush=True)
        previous_style.writeToLayer(layer)
        canvas.refresh()
        print("Original style restored. Save the project only if intended.", flush=True)


if __name__ == "__main__":
    main()
