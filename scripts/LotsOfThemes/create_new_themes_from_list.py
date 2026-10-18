"""Create QGIS map themes and optional sequential atlas-index GeoPackage.

Run in the QGIS 4 Python console or another configured PyQGIS 4 environment.
The tool preserves the current project layer-tree visibility after generating themes.
Edit the defaults below before running, or call main() with explicit arguments.
"""

from __future__ import annotations

from pathlib import Path

WRAPPER_VERSION = "2026-10-19.1"
DEFAULT_BASE_THEME_NAME = "base"
DEFAULT_LAYER_LIST_FILE = Path("layer_list.txt")
DEFAULT_OVERWRITE_THEMES = True
DEFAULT_IGNORE_MISSING_LAYERS = True
DEFAULT_OUTPUT_CSV = Path("themes_output.csv")
DEFAULT_THEME_PREFIX = ""
DEFAULT_WORKING_DIRECTORY = Path(".")
DEFAULT_ATLAS_POINT_LAYER_NAME: str | None = None
DEFAULT_ATLAS_OUTPUT = Path("themes_atlas.gpkg")
DEFAULT_OVERWRITE_ATLAS = False

import csv
import re
from collections.abc import Iterable

from qgis.PyQt.QtCore import QVariant
from qgis.core import (
    QgsFeature,
    QgsField,
    QgsGeometry,
    QgsLayerTreeGroup,
    QgsLayerTreeLayer,
    QgsLayerTreeModel,
    QgsMapThemeCollection,
    QgsProject,
    QgsVectorFileWriter,
    QgsVectorLayer,
    QgsWkbTypes,
)


def _iter_nodes(group: QgsLayerTreeGroup) -> Iterable[QgsLayerTreeGroup | QgsLayerTreeLayer]:
    """Visit groups and layers so their checked state can be restored."""
    for child in group.children():
        if isinstance(child, (QgsLayerTreeGroup, QgsLayerTreeLayer)):
            yield child
            if isinstance(child, QgsLayerTreeGroup):
                yield from _iter_nodes(child)


def _find_layer(project: QgsProject, name: str) -> QgsVectorLayer | object:
    matches = project.mapLayersByName(name)
    if len(matches) != 1:
        raise ValueError(f"Expected exactly one layer named {name!r}, found {len(matches)}")
    return matches[0]


def _create_theme(
    project: QgsProject, base_layer_ids: set[str], target_id: str
) -> object:
    root = project.layerTreeRoot()
    nodes = list(_iter_nodes(root))
    original = [(node, node.itemVisibilityChecked()) for node in nodes]
    try:
        for node in nodes:
            if isinstance(node, QgsLayerTreeLayer):
                node.setItemVisibilityChecked(node.layerId() in base_layer_ids or node.layerId() == target_id)
            else:
                node.setItemVisibilityChecked(True)
        target = root.findLayer(target_id)
        if target is None:
            raise ValueError(f"Layer not present in project tree: {target_id}")
        parent = target.parent()
        while parent is not None and parent != root:
            parent.setItemVisibilityChecked(True)
            parent = parent.parent()
        return QgsMapThemeCollection.createThemeFromCurrentState(root, QgsLayerTreeModel(root))
    finally:
        for node, checked in original:
            node.setItemVisibilityChecked(checked)


def _name_metadata(name: str) -> dict[str, str | int]:
    """Extract metadata from the requested theme name, not from a fixed suffix."""
    parts = re.split(r"[_+]", name)
    aep = re.search(r"(?<![0-9])(\d{2}\.\d{1,2}p)(?=[_+]|$)", name, re.I)
    duration = re.search(r"(?:^|[_+])(\d{3,5}m)(?=[_+]|$)", name, re.I)
    result_types = ("d_HR_Max", "h_HR_Max", "V_Max", "d_Max", "h_Max", "dt_Min", "TMax_h", "DEM_Z_HR", "DEM_Z")
    result = next((kind for kind in result_types if kind.casefold() in name.casefold()), "Unknown")
    return {
        "AEP": aep.group(1).removesuffix("p") if aep else "N/A",
        "duration": duration.group(1).removesuffix("m") if duration else "N/A",
        "result_type": result,
        "DIFF": int("DIFF" in (part.upper() for part in parts)),
    }


def build_output_rows(themes: list[str]) -> list[dict[str, str | int]]:
    """Assign stable names for an atlas page/file per successfully created theme."""
    ordered = sorted(themes, key=str.casefold)
    if len({name.casefold() for name in ordered}) != len(ordered):
        raise ValueError("Duplicate theme names are not valid atlas identifiers")
    return [
        {"theme_name": name, "out_name": f"{index:05d}", **_name_metadata(name)}
        for index, name in enumerate(ordered)
    ]


def _write_csv(output: Path, rows: list[dict[str, str | int]]) -> None:
    columns = ["theme_name", "out_name", "AEP", "duration", "result_type", "DIFF"]
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns)
        writer.writeheader()
        writer.writerows(rows)


def _atlas_geometry(layer: QgsVectorLayer) -> QgsGeometry:
    if not layer.isValid() or QgsWkbTypes.geometryType(layer.wkbType()) != QgsWkbTypes.PointGeometry:
        raise ValueError("Atlas source must be a valid QGIS point layer")
    features = layer.getFeatures()
    feature = next(iter(features), None)
    if feature is None or not feature.hasGeometry():
        raise ValueError("Atlas source point layer has no valid point feature")
    geometry = feature.geometry()
    if geometry.isMultipart():
        points = geometry.asMultiPoint()
        if not points:
            raise ValueError("Atlas source multipoint is empty")
        return QgsGeometry.fromPointXY(points[0])
    return QgsGeometry.fromPointXY(geometry.asPoint())


def _write_atlas(
    project: QgsProject, point_layer_name: str, output: Path,
    rows: list[dict[str, str | int]], *, overwrite: bool
) -> None:
    """Create one point feature per theme, using the first source point geometry."""
    layer = _find_layer(project, point_layer_name)
    if not isinstance(layer, QgsVectorLayer):
        raise TypeError("Atlas point source must be a vector layer")
    if output.exists() and not overwrite:
        raise FileExistsError(f"Atlas output exists: {output}")
    geometry = _atlas_geometry(layer)
    temporary = QgsVectorLayer("Point", "theme_index", "memory")
    temporary.setCrs(layer.crs())
    provider = temporary.dataProvider()
    provider.addAttributes(
        [QgsField("theme_name", QVariant.String), QgsField("out_name", QVariant.String)]
    )
    temporary.updateFields()
    features: list[QgsFeature] = []
    for row in rows:
        feature = QgsFeature(temporary.fields())
        feature.setGeometry(QgsGeometry(geometry))
        feature.setAttributes([row["theme_name"], row["out_name"]])
        features.append(feature)
    success, _ = provider.addFeatures(features)
    if not success:
        raise RuntimeError("Could not prepare atlas index features")
    output.parent.mkdir(parents=True, exist_ok=True)
    options = QgsVectorFileWriter.SaveVectorOptions()
    options.driverName = "GPKG"
    options.layerName = "theme_index"
    if output.exists() and overwrite:
        output.unlink()
    result = QgsVectorFileWriter.writeAsVectorFormatV3(
        temporary, str(output), project.transformContext(), options
    )
    if result[0] != QgsVectorFileWriter.NoError:
        raise RuntimeError(f"Atlas export failed: {result}")
    print(f"Atlas index: {output}, {len(rows)} feature(s)")


def main(
    base_theme_name: str = DEFAULT_BASE_THEME_NAME,
    layer_list_file: Path = DEFAULT_LAYER_LIST_FILE,
    overwrite_existing: bool = DEFAULT_OVERWRITE_THEMES,
    ignore_errors: bool = DEFAULT_IGNORE_MISSING_LAYERS,
    theme_prefix: str = DEFAULT_THEME_PREFIX,
    working_directory: Path = DEFAULT_WORKING_DIRECTORY,
    output_csv_file: Path = DEFAULT_OUTPUT_CSV,
    atlas_point_layer_name: str | None = DEFAULT_ATLAS_POINT_LAYER_NAME,
    atlas_output_file: Path = DEFAULT_ATLAS_OUTPUT,
    overwrite_atlas: bool = DEFAULT_OVERWRITE_ATLAS,
) -> list[str]:
    """Create themes from one base theme; optionally generate atlas-point index."""
    project = QgsProject.instance()
    root = Path(working_directory).absolute()
    list_path = (root / layer_list_file).absolute()
    with list_path.open(encoding="utf-8") as stream:
        requested = list(dict.fromkeys(line.strip() for line in stream if line.strip()))
    collection = project.mapThemeCollection()
    if not collection.hasMapTheme(base_theme_name):
        raise ValueError(f"Missing base map theme: {base_theme_name}")
    base_layer_ids = set(collection.mapThemeVisibleLayerIds(base_theme_name))
    created: list[str] = []
    failures: list[str] = []
    for name in requested:
        theme_name = theme_prefix + name
        try:
            layer = _find_layer(project, name)
            if collection.hasMapTheme(theme_name) and not overwrite_existing:
                raise FileExistsError(f"Theme already exists: {theme_name}")
            record = _create_theme(project, base_layer_ids, layer.id())
            if collection.hasMapTheme(theme_name):
                collection.removeMapTheme(theme_name)
            collection.insert(theme_name, record)
            created.append(theme_name)
        except (ValueError, FileExistsError, RuntimeError) as error:
            if not ignore_errors:
                raise
            failures.append(f"{name}: {error}")
    rows = build_output_rows(created)
    _write_csv((root / output_csv_file).absolute(), rows)
    if atlas_point_layer_name is not None:
        _write_atlas(
            project, atlas_point_layer_name, (root / atlas_output_file).absolute(),
            rows, overwrite=overwrite_atlas
        )
    print(f"Created {len(created)} theme(s), skipped {len(failures)}; script {WRAPPER_VERSION}")
    for failure in failures:
        print(f"SKIPPED: {failure}")
    return created


if __name__ == "__main__":
    main()
