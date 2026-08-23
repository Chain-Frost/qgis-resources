from pathlib import Path
import re

from qgis.core import (
    QgsMapLayerStyle,
    QgsProject,
    QgsVectorFileWriter,
    QgsVectorLayer,
)

OUTPUT_DIR = Path(r"E:\path\data")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)


def safe_filename(name: str) -> str:
    """Return a Windows-safe filename."""
    return re.sub(r'[<>:"/\\|?*]', "_", name).strip()


project = QgsProject.instance()
root = project.layerTreeRoot()

layers = iface.layerTreeView().selectedLayers()

for source_layer in layers:
    if not source_layer.isValid():
        print(f"SKIPPED invalid layer: {source_layer.name()}")
        continue

    # Locate source layer in the layer tree before doing anything.
    source_node = root.findLayer(source_layer.id())

    if source_node is None:
        print(f"SKIPPED - cannot find layer tree node: {source_layer.name()}")
        continue

    parent_group = source_node.parent()

    # Capture the complete current QGIS style.
    source_style = QgsMapLayerStyle()
    source_style.readFromLayer(source_layer)

    # Output filename.
    output_path = OUTPUT_DIR / f"{safe_filename(source_layer.name())}.gpkg"

    options = QgsVectorFileWriter.SaveVectorOptions()
    options.driverName = "GPKG"
    options.layerName = source_layer.name()
    options.fileEncoding = "UTF-8"

    result = QgsVectorFileWriter.writeAsVectorFormatV3(
        source_layer,
        str(output_path),
        project.transformContext(),
        options,
    )

    if result[0] != QgsVectorFileWriter.NoError:
        print(f"FAILED export: {source_layer.name()}")
        print(result)
        continue

    # Load the newly-created GPKG.
    new_layer = QgsVectorLayer(
        str(output_path),
        source_layer.name(),
        "ogr",
    )

    if not new_layer.isValid():
        print(f"FAILED loading exported layer: {output_path}")
        continue

    # Apply the complete source style.
    source_style.writeToLayer(new_layer)
    new_layer.triggerRepaint()

    # Add to the project without automatically putting it at the root.
    project.addMapLayer(new_layer, False)

    # Insert immediately below the source layer in its existing group.
    source_index = parent_group.children().index(source_node)
    parent_group.insertLayer(source_index + 1, new_layer)

    print(f"EXPORTED: {source_layer.name()}\n" f"  -> {output_path}\n" f"  -> Added to same group with source style")

print("Finished.")
