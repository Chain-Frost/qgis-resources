from collections import OrderedDict

from qgis.core import QgsProject

project = QgsProject.instance()
if project is None:
    msg = "No QGIS project is available"
    raise RuntimeError(msg)
root = project.layerTreeRoot()
if root is None:
    msg = "QGIS layer-tree root is unavailable"
    raise RuntimeError(msg)


def LayerNamesEnumDict(listCh):
    return {listCh[q[0]].name() + str(q[0]): q[1] for q in enumerate(listCh)}


mLNED = LayerNamesEnumDict(root.children())
mLNEDkeys = OrderedDict(sorted(LayerNamesEnumDict(root.children()).items())).keys()

mLNEDsorted = []
for key in mLNEDkeys:
    cloned = mLNED[key].clone()
    if cloned is None:
        msg = f"Could not clone the QGIS layer-tree node {key}"
        raise RuntimeError(msg)
    mLNEDsorted.append(cloned)
root.insertChildNodes(0, mLNEDsorted)
for n in mLNED.values():
    root.removeChildNode(n)
