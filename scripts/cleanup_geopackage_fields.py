"""Remove selected GeoPackage attributes using QGIS edit transactions.

QGIS 4 / Python 3.12. Run inside the QGIS Python console.
Only selected layers are modified. Dry-run mode is enabled by default.
VACUUM is intentionally separate and must be run after the layer is closed.
"""

from __future__ import annotations

from pathlib import Path
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from collections.abc import Iterable

    from qgis.core import QgsVectorLayer

SCRIPT_VERSION = "2026-10-19.1"
DEFAULT_FIELD_NAMES: tuple[str, ...] = ("PaperSpace", "SubClasses", "Linetype", "EntityHandle", "Text")
DEFAULT_DRY_RUN = True
DEFAULT_ALLOW_PARTIAL_FIELDS = True


def _geopackage_path(layer: QgsVectorLayer) -> Path | None:
    """Accept file-backed GeoPackages rather than arbitrary OGR sources."""
    if layer.providerType().casefold() != "ogr":
        return None
    source = str(layer.source()).split("|", maxsplit=1)[0]
    if not source.casefold().endswith(".gpkg"):
        return None
    return Path(source).absolute()


def clean_fields(
    layers: Iterable[QgsVectorLayer],
    *,
    fields_to_delete: tuple[str, ...] = DEFAULT_FIELD_NAMES,
    dry_run: bool = DEFAULT_DRY_RUN,
    allow_partial_fields: bool = DEFAULT_ALLOW_PARTIAL_FIELDS,
) -> tuple[int, int, int]:
    """Return (changed-or-planned, skipped, failed), isolating edit failures."""
    requested = tuple(dict.fromkeys(name for name in fields_to_delete if name))
    if not requested:
        message = "At least one nonempty field name is required"
        raise ValueError(message)
    changed = skipped = failed = 0
    for layer in layers:
        if not layer.isValid():
            print(f"SKIP invalid: {layer.name()}")
            skipped += 1
            continue
        path = _geopackage_path(layer)
        if path is None:
            print(f"SKIP non-GeoPackage: {layer.name()}")
            skipped += 1
            continue
        if layer.isEditable():
            print(f"SKIP already editing: {layer.name()}")
            skipped += 1
            continue
        available = {field.name(): index for index, field in enumerate(layer.fields())}
        matching = [name for name in requested if name in available]
        missing = [name for name in requested if name not in available]
        if not matching or (missing and not allow_partial_fields):
            print(f"SKIP {layer.name()}: matched={matching}, missing={missing}")
            skipped += 1
            continue
        print(f"{'PLAN' if dry_run else 'EDIT'} {layer.name()}: {path}, fields={matching}, missing={missing}")
        if dry_run:
            changed += 1
            continue
        if not layer.startEditing():
            print(f"FAIL edit start: {layer.name()}")
            failed += 1
            continue
        try:
            success = True
            for name in sorted(matching, key=lambda item: available[item], reverse=True):
                if not layer.deleteAttribute(available[name]):
                    success = False
                    break
            if not success:
                layer.rollBack()
                print(f"FAIL delete attributes: {layer.name()}")
                failed += 1
                continue
            if not layer.commitChanges():
                error = "; ".join(layer.commitErrors())
                layer.rollBack()
                print(f"FAIL commit {layer.name()}: {error}")
                failed += 1
                continue
            layer.updateFields()
            changed += 1
        except Exception:
            if layer.isEditable():
                layer.rollBack()
            raise
    print(f"Summary: {'planned' if dry_run else 'changed'}={changed}, skipped={skipped}, failed={failed}")
    return changed, skipped, failed


def main() -> None:
    """Run against the current QGIS layer-tree selection."""
    from qgis.core import QgsVectorLayer

    selected = [layer for layer in iface.layerTreeView().selectedLayers() if isinstance(layer, QgsVectorLayer)]  # noqa: F821
    clean_fields(
        selected,
        fields_to_delete=DEFAULT_FIELD_NAMES,
        dry_run=DEFAULT_DRY_RUN,
        allow_partial_fields=DEFAULT_ALLOW_PARTIAL_FIELDS,
    )


if __name__ == "__main__":
    main()
