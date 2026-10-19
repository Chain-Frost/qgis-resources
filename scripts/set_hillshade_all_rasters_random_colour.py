from __future__ import annotations

import random

from qgis.core import QgsHillshadeRenderer, QgsProject, QgsRasterLayer
from qgis.PyQt.QtGui import QColor  # pyright: ignore[reportMissingModuleSource]


def _rand_nice_color() -> QColor:
    # Avoid muddy/dark colors: random hue, high saturation, high value
    return QColor.fromHsv(random.randint(0, 359), 200, 255)


def _make_hillshade_renderer(layer: QgsRasterLayer, band: int, z_factor: float, azimuth: float, altitude: float):
    """
    QgsHillshadeRenderer ctor signature varies across QGIS builds.
    Try common signatures.
    """
    provider = layer.dataProvider()
    if provider is None:
        msg = f"Raster provider is unavailable: {layer.name()}"
        raise RuntimeError(msg)
    renderer = QgsHillshadeRenderer(provider, band, azimuth, altitude)
    renderer.setZFactor(z_factor)
    return renderer


def set_all_rasters_to_hillshade_and_random_color(
    z_factor: float = 5.0,
    azimuth: float = 315.0,
    altitude: float = 45.0,
    colorize_strength: int = 70,  # 0..100
) -> None:
    project = QgsProject.instance()
    if project is None:
        msg = "No QGIS project is available"
        raise RuntimeError(msg)
    for lyr in project.mapLayers().values():
        if not isinstance(lyr, QgsRasterLayer):
            continue
        if not lyr.isValid():
            continue

        band = 1  # adjust if you need something else
        hs = _make_hillshade_renderer(lyr, band, z_factor, azimuth, altitude)
        lyr.setRenderer(hs)

        # Colorize the *rendered* output (works well with hillshade)
        c = _rand_nice_color()
        f = lyr.hueSaturationFilter()
        if f is None:
            print(f"SKIP no hue/saturation filter: {lyr.name()}")
            continue
        f.setColorizeOn(True)
        f.setColorizeColor(c)
        f.setColorizeStrength(int(max(0, min(100, colorize_strength))))

        lyr.triggerRepaint()


set_all_rasters_to_hillshade_and_random_color(z_factor=5.0, colorize_strength=70)
