from pathlib import Path

from qgis.core import QgsProject

for layer in QgsProject.instance().mapLayers().values():
    basename = Path(layer.source().split("|", maxsplit=1)[0]).stem
    layer.setName(basename)
