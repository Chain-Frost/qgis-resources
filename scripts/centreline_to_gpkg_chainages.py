from collections.abc import Iterable
from pathlib import Path
import os
import shutil

import processing

from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (
    QgsCoordinateReferenceSystem,
    QgsFeature,
    QgsProject,
    QgsVectorLayer,
    QgsWkbTypes,
)


# ---------------------------------------------------------------------------
# Settings
# ---------------------------------------------------------------------------

INPUT_FILES: list[str] = [
    r"path\file.dxf",
    r"path\file.dxf",

]

SOURCE_STYLE_FILE = Path(
    r"P:\path\chainages_vertices.qml"
)

# DXF coordinates are already in GDA2020 / MGA Zone 50.
# This assigns the CRS; it does not transform coordinates.
SOURCE_CRS = "EPSG:7850"

# Chainage spacing in metres.
DISTANCE = 10.0

START_OFFSET = 0.0
END_OFFSET = 0.0

OVERWRITE_OUTPUTS = True

# The GeoPackage and matching QML are created but not added to the project.
ADD_TO_PROJECT = False


# ---------------------------------------------------------------------------
# Input handling
# ---------------------------------------------------------------------------

def resolve_input_files(
    inputs: str | Path | Iterable[str | Path],
) -> list[Path]:
    """Return a validated list of input DXF files."""
    if isinstance(inputs, (str, Path)):
        paths = [Path(inputs)]
    else:
        paths = [Path(path) for path in inputs]

    if not paths:
        raise ValueError("No input DXF files were provided.")

    for path in paths:
        if path.suffix.casefold() != ".dxf":
            raise ValueError(f"Input is not a DXF file: {path}")

        if not path.is_file():
            raise FileNotFoundError(f"DXF file does not exist: {path}")

    return paths


# ---------------------------------------------------------------------------
# Project and file handling
# ---------------------------------------------------------------------------

def normalised_path(path: str | Path) -> str:
    """Return a normalised Windows path for comparison."""
    return os.path.normcase(os.path.normpath(str(path)))


def remove_project_layers_using_file(file_path: Path) -> None:
    """Remove project layers that reference the specified file."""
    target_path = normalised_path(file_path)
    project = QgsProject.instance()

    layer_ids = [
        layer.id()
        for layer in project.mapLayers().values()
        if normalised_path(
            layer.source().split("|", maxsplit=1)[0]
        ) == target_path
    ]

    if layer_ids:
        project.removeMapLayers(layer_ids)
        QCoreApplication.processEvents()


def delete_existing_file(file_path: Path) -> None:
    """Delete an existing file, raising a useful error if it is locked."""
    if not file_path.exists():
        return

    try:
        file_path.unlink()
    except PermissionError as error:
        raise PermissionError(
            f"Cannot replace {file_path}. It may be open in QGIS or "
            "another application."
        ) from error


def delete_existing_outputs(
    output_gpkg: Path,
    output_qml: Path,
) -> None:
    """Remove existing GeoPackage, QML and SQLite temporary files."""
    existing_files = [
        output_gpkg,
        output_qml,
        Path(f"{output_gpkg}-wal"),
        Path(f"{output_gpkg}-shm"),
        Path(f"{output_gpkg}-journal"),
    ]

    if not OVERWRITE_OUTPUTS:
        conflicts = [
            path
            for path in existing_files
            if path.exists()
        ]

        if conflicts:
            raise FileExistsError(
                "Output already exists: "
                + ", ".join(str(path) for path in conflicts)
            )

        return

    remove_project_layers_using_file(output_gpkg)

    for path in existing_files:
        delete_existing_file(path)


# ---------------------------------------------------------------------------
# DXF loading
# ---------------------------------------------------------------------------

def load_dxf_line_layer(dxf_path: Path) -> QgsVectorLayer:
    """
    Load line geometry directly from a DXF and assign EPSG:7850.

    The DXF does not need to already be loaded in the QGIS project.
    """
    layer_name = dxf_path.stem

    candidate_uris = (
        f"{dxf_path}|layername=entities|geometrytype=LineString",
        f"{dxf_path}|layername=entities|geometrytype=MultiLineString",
        f"{dxf_path}|geometrytype=LineString",
        str(dxf_path),
    )

    assigned_crs = QgsCoordinateReferenceSystem(SOURCE_CRS)

    if not assigned_crs.isValid():
        raise RuntimeError(
            f"Configured source CRS is invalid: {SOURCE_CRS}"
        )

    errors: list[str] = []

    for uri in candidate_uris:
        layer = QgsVectorLayer(uri, layer_name, "ogr")

        if not layer.isValid():
            errors.append(f"Invalid layer: {uri}")
            continue

        geometry_type = QgsWkbTypes.geometryType(layer.wkbType())

        if geometry_type not in (
            QgsWkbTypes.LineGeometry,
            QgsWkbTypes.UnknownGeometry,
        ):
            errors.append(
                f"Not a line layer: {uri} "
                f"({QgsWkbTypes.displayString(layer.wkbType())})"
            )
            continue

        # Assign the known CRS regardless of what the DXF provider reports.
        layer.setCrs(assigned_crs)

        return layer

    raise RuntimeError(
        f"Could not load a usable line layer from {dxf_path.name}:\n"
        + "\n".join(errors)
    )


# ---------------------------------------------------------------------------
# Longest-line selection
# ---------------------------------------------------------------------------

def extract_longest_line(
    source_layer: QgsVectorLayer,
    source_name: str,
) -> tuple[QgsVectorLayer, float, int]:
    """
    Create a temporary memory layer containing only the longest line feature.
    """
    longest_feature: QgsFeature | None = None
    longest_length = -1.0
    valid_line_count = 0

    for feature in source_layer.getFeatures():
        geometry = feature.geometry()

        if geometry is None or geometry.isNull() or geometry.isEmpty():
            continue

        if QgsWkbTypes.geometryType(
            geometry.wkbType()
        ) != QgsWkbTypes.LineGeometry:
            continue

        length = geometry.length()

        if length <= 0:
            continue

        valid_line_count += 1

        if length > longest_length:
            longest_feature = QgsFeature(feature)
            longest_length = length

    if longest_feature is None:
        raise RuntimeError(
            f"No valid line features were found in {source_name}."
        )

    crs = source_layer.crs()

    if not crs.isValid():
        raise RuntimeError(
            f"The source layer for {source_name} has no valid CRS."
        )

    geometry_name = QgsWkbTypes.displayString(
        source_layer.wkbType()
    )

    memory_layer = QgsVectorLayer(
        f"{geometry_name}?crs={crs.authid()}",
        f"{Path(source_name).stem}_longest_line",
        "memory",
    )

    if not memory_layer.isValid():
        raise RuntimeError(
            f"Could not create a temporary longest-line layer for "
            f"{source_name}."
        )

    provider = memory_layer.dataProvider()
    provider.addAttributes(source_layer.fields())
    memory_layer.updateFields()

    output_feature = QgsFeature(memory_layer.fields())
    output_feature.setGeometry(longest_feature.geometry())
    output_feature.setAttributes(longest_feature.attributes())

    added, _ = provider.addFeatures([output_feature])

    if not added:
        raise RuntimeError(
            f"Could not copy the longest line from {source_name} into "
            "the temporary layer."
        )

    memory_layer.updateExtents()

    print(f"    Line features found: {valid_line_count}")
    print(f"    Longest feature ID:  {longest_feature.id()}")
    print(f"    Longest line length: {longest_length:,.3f} m")

    return (
        memory_layer,
        longest_length,
        longest_feature.id(),
    )


# ---------------------------------------------------------------------------
# Processing
# ---------------------------------------------------------------------------

def process_dxf(
    dxf_path: Path,
) -> tuple[Path, Path, float, int, int]:
    """
    Generate chainages along only the longest line in the DXF.
    """
    output_name = f"{dxf_path.stem}_chainages"

    output_gpkg = dxf_path.with_name(
        f"{output_name}.gpkg"
    )

    output_qml = dxf_path.with_name(
        f"{output_name}.qml"
    )

    delete_existing_outputs(
        output_gpkg=output_gpkg,
        output_qml=output_qml,
    )

    source_layer = load_dxf_line_layer(dxf_path)

    (
        longest_line_layer,
        longest_length,
        longest_feature_id,
    ) = extract_longest_line(
        source_layer=source_layer,
        source_name=dxf_path.name,
    )

    result = processing.run(
        "native:pointsalonglines",
        {
            "INPUT": longest_line_layer,
            "DISTANCE": DISTANCE,
            "START_OFFSET": START_OFFSET,
            "END_OFFSET": END_OFFSET,
            "OUTPUT": str(output_gpkg),
        },
    )

    if not output_gpkg.is_file():
        raise RuntimeError(
            f"Processing completed but the GeoPackage was not created: "
            f"{output_gpkg}"
        )

    # Copy the QML beside the GeoPackage using the same basename.
    shutil.copy2(
        SOURCE_STYLE_FILE,
        output_qml,
    )

    if not output_qml.is_file():
        raise RuntimeError(
            f"The output QML was not created: {output_qml}"
        )

    # Open the result to verify its CRS and feature count.
    result_path = str(result["OUTPUT"])

    output_layer = QgsVectorLayer(
        result_path,
        output_name,
        "ogr",
    )

    if not output_layer.isValid():
        output_layer = QgsVectorLayer(
            str(output_gpkg),
            output_name,
            "ogr",
        )

    if not output_layer.isValid():
        raise RuntimeError(
            f"The GeoPackage was created but could not be opened: "
            f"{output_gpkg}"
        )

    output_feature_count = output_layer.featureCount()

    if output_feature_count == 0:
        raise RuntimeError(
            f"The GeoPackage was created but contains no chainage points: "
            f"{output_gpkg}"
        )

    if output_layer.crs().authid() != SOURCE_CRS:
        raise RuntimeError(
            f"The output CRS is {output_layer.crs().authid()}, "
            f"but {SOURCE_CRS} was expected."
        )

    if ADD_TO_PROJECT:
        style_message, style_loaded = output_layer.loadNamedStyle(
            str(output_qml)
        )

        if not style_loaded:
            raise RuntimeError(
                f"The layer was created, but the adjacent QML could not "
                f"be loaded: {style_message}"
            )

        QgsProject.instance().addMapLayer(output_layer)
        output_layer.triggerRepaint()
        QCoreApplication.processEvents()

    return (
        output_gpkg,
        output_qml,
        longest_length,
        longest_feature_id,
        output_feature_count,
    )


# ---------------------------------------------------------------------------
# Run
# ---------------------------------------------------------------------------

if not SOURCE_STYLE_FILE.is_file():
    raise FileNotFoundError(
        f"Source QML style does not exist: {SOURCE_STYLE_FILE}"
    )

dxf_files = resolve_input_files(INPUT_FILES)

completed: list[
    tuple[str, Path, Path, float, int, int]
] = []

failed: list[tuple[str, str]] = []

for dxf_file in dxf_files:
    try:
        print()
        print(f"Processing: {dxf_file.name}")

        (
            output_gpkg,
            output_qml,
            longest_length,
            longest_feature_id,
            output_feature_count,
        ) = process_dxf(dxf_file)

        completed.append(
            (
                dxf_file.name,
                output_gpkg,
                output_qml,
                longest_length,
                longest_feature_id,
                output_feature_count,
            )
        )

        print(f"    GeoPackage:      {output_gpkg}")
        print(f"    QML:             {output_qml}")
        print(f"    Output CRS:      {SOURCE_CRS}")
        print(f"    Chainage points: {output_feature_count}")
        print("    Status:          completed")

    except Exception as error:
        failed.append((dxf_file.name, str(error)))

        print(f"FAILED: {dxf_file.name}")
        print(f"        {error}")

print()
print("-" * 70)
print(f"Completed: {len(completed)}")
print(f"Failed:    {len(failed)}")

if completed:
    print("\nSelected centreline features:")

    for (
        source_name,
        _,
        _,
        line_length,
        feature_id,
        point_count,
    ) in completed:
        print(
            f"  {source_name}: "
            f"feature {feature_id}, "
            f"length {line_length:,.3f} m, "
            f"{point_count} chainage points"
        )

if failed:
    print("\nFailures:")

    for source_name, message in failed:
        print(f"  {source_name}")
        print(f"    {message}")