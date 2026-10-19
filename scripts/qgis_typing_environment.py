"""Display the installed PyQGIS/PyQt environment for local strict Pyright checks."""

from __future__ import annotations

import sys
from pathlib import Path


def main() -> int:
    """Verify QGIS 4, Qt 6 and Python 3.12 and report import locations."""
    if sys.version_info[:2] != (3, 12):
        print(f"Expected Python 3.12; found {sys.version.split()[0]}")
        return 1

    try:
        from qgis import __path__ as qgis_paths
        from qgis.core import Qgis
        from qgis.PyQt.QtCore import PYQT_VERSION_STR, QT_VERSION_STR
    except ImportError as error:
        print(f"PyQGIS import failed: {error}")
        return 1

    print(f"Interpreter: {sys.executable}")
    print(f"QGIS: {Qgis.QGIS_VERSION}")
    print(f"Python: {sys.version.split()[0]}")
    print(f"Qt: {QT_VERSION_STR}, PyQt: {PYQT_VERSION_STR}")
    for folder in qgis_paths:
        print(f"QGIS module location: {Path(folder).absolute()}")

    if not Qgis.QGIS_VERSION.startswith("4.") or not QT_VERSION_STR.startswith("6."):
        print("Required environment: QGIS 4 with Qt 6.")
        return 1
    print("Run python -m pyright -p pyrightconfig.json with matching QGIS/PyQt type information.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
