"""Export the vector layers in a QGIS map theme to individual shapefiles.

QGIS 4 console utility; edit the default values before running. Existing
outputs are not replaced without explicit permission.
"""

from pathlib import Path

from qgis.core import QgsProject, QgsVectorFileWriter, QgsVectorLayer

OUTPUT_DIRECTORY = Path(r"C:\temp")
SUFFIX = "_export"
THEME_NAME = "layers"
OVERWRITE_EXISTING = False


def export_theme_vectors() -> tuple[int, int]:
    """Write only vector layers using the QGIS 4 vector writer API."""
    project = QgsProject.instance()
    if project is None:
        msg = "No QGIS project is available"
        raise RuntimeError(msg)
    themes = project.mapThemeCollection()
    if themes is None or not themes.hasMapTheme(THEME_NAME):
        msg = f"Map theme does not exist: {THEME_NAME}"
        raise ValueError(msg)
    OUTPUT_DIRECTORY.mkdir(parents=True, exist_ok=True)
    exported = skipped = 0
    for layer in themes.mapThemeVisibleLayers(THEME_NAME):
        if not isinstance(layer, QgsVectorLayer) or not layer.isValid():
            skipped += 1
            continue
        destination = OUTPUT_DIRECTORY / f"{layer.name()}{SUFFIX}.shp"
        if destination.exists() and not OVERWRITE_EXISTING:
            print(f"SKIP existing shapefile: {destination}")
            skipped += 1
            continue
        options = QgsVectorFileWriter.SaveVectorOptions()
        options.driverName = "ESRI Shapefile"
        options.fileEncoding = "UTF-8"
        result = QgsVectorFileWriter.writeAsVectorFormatV3(
            layer, str(destination), project.transformContext(), options
        )
        if result[0] != QgsVectorFileWriter.NoError:
            msg = f"Could not export {layer.name()}: {result}"
            raise RuntimeError(msg)
        exported += 1
    print(f"Exported {exported} vector layer(s); skipped {skipped}.")
    return exported, skipped


export_theme_vectors()
