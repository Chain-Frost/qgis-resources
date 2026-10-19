from pathlib import Path

from qgis.core import QgsProject

group_name = "results"  # Replace with your group name
output_file = "layer_list.txt"


def export_layer_list(group_name: str, output_file: str | Path) -> None:
    project = QgsProject.instance()
    if project is None:
        msg = "No QGIS project is available"
        raise RuntimeError(msg)
    root = project.layerTreeRoot()
    if root is None:
        msg = "QGIS project has no layer-tree root"
        raise RuntimeError(msg)
    group = root.findGroup(group_name)

    if not group:
        msg = f"Group '{group_name}' not found."
        raise ValueError(msg)

    layers = group.findLayers()
    layer_names = sorted(layer.layer().name() for layer in layers if layer.layer() is not None)

    destination = Path(output_file)
    destination.parent.mkdir(parents=True, exist_ok=True)
    with destination.open("w", encoding="utf-8") as file:
        file.writelines(name + "\n" for name in layer_names)


export_layer_list(group_name, output_file)
print("Complete")
