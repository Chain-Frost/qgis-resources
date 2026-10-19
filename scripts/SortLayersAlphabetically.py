from collections import OrderedDict

from qgis.core import QgsProject

root = QgsProject.instance().layerTreeRoot()


def LayerNamesEnumDict(listCh):
    return {listCh[q[0]].name() + str(q[0]): q[1] for q in enumerate(listCh)}


mLNED = LayerNamesEnumDict(root.children())
mLNEDkeys = OrderedDict(sorted(LayerNamesEnumDict(root.children()).items())).keys()

mLNEDsorted = [mLNED[k].clone() for k in mLNEDkeys]
root.insertChildNodes(0, mLNEDsorted)
for n in mLNED.values():
    root.removeChildNode(n)
