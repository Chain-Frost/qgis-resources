"""Write the current QGIS project layer sources to a CSV file."""

import csv
from pathlib import Path

from qgis.core import QgsProject

OUTPUT_CSV = Path(r"C:\temp\qgis_output.csv")


def export_layer_sources(output: Path = OUTPUT_CSV) -> int:
    """Export layer names and provider sources, guarding missing projects."""
    project = QgsProject.instance()
    if project is None:
        msg = "No QGIS project is available"
        raise RuntimeError(msg)
    output.parent.mkdir(parents=True, exist_ok=True)
    layers = list(project.mapLayers().values())
    with output.open("w", newline="", encoding="utf-8") as stream:
        writer = csv.writer(stream)
        writer.writerows((layer.name(), layer.source()) for layer in layers)
    print(f"Exported {len(layers)} layers to {output}")
    return len(layers)


export_layer_sources()
