from pathlib import Path

from qgis.core import QgsProject

project = QgsProject.instance()
if project is None:
    msg = "No QGIS project is available"
    raise RuntimeError(msg)

for layer in project.mapLayers().values():
    basename = Path(layer.source().split("|", maxsplit=1)[0]).stem
    layer.setName(basename)
