import csv
from pathlib import Path

from qgis.core import QgsProject

layer_paths = [[layer.name(), layer.source()] for layer in QgsProject.instance().mapLayers().values()]
csv_path = r"C:\temp\qgis_output.csv"

with Path(csv_path).open("w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    for paths in layer_paths:
        writer.writerow(paths)
