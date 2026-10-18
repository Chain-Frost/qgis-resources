"""Create spatial indexes through QGIS's native OGR provider.

QGIS 4 / Python 3.12, no hardcoded ogrinfo.exe, drive remapping or shell.
Defaults to project shapefiles. Optionally enable GeoPackages explicitly.
"""

from __future__ import annotations

from pathlib import Path
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from collections.abc import Iterable

    from qgis.core import QgsVectorLayer

SCRIPT_VERSION = "2026-10-19.1"
DEFAULT_EXTENSIONS: tuple[str, ...] = (".shp",)
DEFAULT_DRY_RUN = False
DEFAULT_ALL_PROJECT_LAYERS = True


def _file_source(layer: QgsVectorLayer, extensions: tuple[str, ...]) -> Path | None:
    """Extract a file-backed OGR path, not a network provider connection."""
    if layer.providerType().casefold() != "ogr":
        return None
    source = str(layer.source()).split("|", maxsplit=1)[0]
    path = Path(source)
    if path.suffix.casefold() not in {extension.casefold() for extension in extensions}:
        return None
    return path.absolute()


def index_layers(
    layers: Iterable[QgsVectorLayer],
    *,
    extensions: tuple[str, ...] = DEFAULT_EXTENSIONS,
    dry_run: bool = DEFAULT_DRY_RUN,
) -> tuple[int, int, int]:
    """Return (indexed-or-planned, skipped, failed); skip existing shapefile QIX."""
    from qgis.core import QgsVectorDataProvider

    created = skipped = failed = 0
    for layer in layers:
        if not layer.isValid():
            print(f"SKIP invalid: {layer.name()}")
            skipped += 1
            continue
        path = _file_source(layer, extensions)
        if path is None:
            skipped += 1
            continue
        provider = layer.dataProvider()
        if provider is None or not provider.capabilities() & QgsVectorDataProvider.CreateSpatialIndex:
            print(f"SKIP no index capability: {layer.name()}")
            skipped += 1
            continue
        if path.suffix.casefold() == ".shp" and path.with_suffix(".qix").exists():
            print(f"SKIP existing index: {path.with_suffix('.qix')}")
            skipped += 1
            continue
        print(f"{'PLAN' if dry_run else 'INDEX'} {layer.name()}: {path}")
        if dry_run or provider.createSpatialIndex():
            created += 1
        else:
            print(f"FAIL indexing {layer.name()}")
            failed += 1
    print(f"Summary: {'planned' if dry_run else 'created'}={created}, skipped={skipped}, failed={failed}")
    return created, skipped, failed


def main() -> None:
    """Use all project layers or only the current QGIS selection."""
    from qgis.core import QgsProject, QgsVectorLayer
    from qgis.utils import iface as qgis_iface

    if not DEFAULT_ALL_PROJECT_LAYERS and qgis_iface is None:
        message = "QGIS GUI session is required for selecting layers"
        raise RuntimeError(message)
    source = (
        QgsProject.instance().mapLayers().values()
        if DEFAULT_ALL_PROJECT_LAYERS
        else qgis_iface.layerTreeView().selectedLayers()
    )
    index_layers(
        (layer for layer in source if isinstance(layer, QgsVectorLayer)),
        extensions=DEFAULT_EXTENSIONS,
        dry_run=DEFAULT_DRY_RUN,
    )


if __name__ == "__main__":
    main()
