"""Copy common CSV layer attributes into a GeoPackage layer using a QGIS edit session.

The default names identify the source and destination. This script changes
existing feature attributes; use a backup before applying it to production data.
"""

from qgis.core import QgsProject, QgsVectorLayer

SRC_NAME = "1d_nwk-GNH"  # CSV layer
DST_NAME = "1d_nwk_GNH_from_DXF_01_L"  # GPKG layer
KEY_FIELD = "ID"


def find_vector_layer(project: QgsProject, name: str) -> QgsVectorLayer:
    """Resolve one valid vector layer rather than blindly indexing results."""
    matches = project.mapLayersByName(name)
    if len(matches) != 1 or not isinstance(matches[0], QgsVectorLayer) or not matches[0].isValid():
        msg = f"Expected exactly one valid vector layer named {name!r}"
        raise ValueError(msg)
    return matches[0]


def copy_common_attributes() -> tuple[int, int]:
    """Copy values keyed by ID and roll back an incomplete edit transaction."""
    project = QgsProject.instance()
    if project is None:
        msg = "No QGIS project is available"
        raise RuntimeError(msg)
    source = find_vector_layer(project, SRC_NAME)
    destination = find_vector_layer(project, DST_NAME)
    src_fields = {field.name() for field in source.fields()}
    dst_fields = {field.name() for field in destination.fields()}
    if KEY_FIELD not in src_fields or KEY_FIELD not in dst_fields:
        msg = f"Field {KEY_FIELD!r} must exist in both layers"
        raise ValueError(msg)
    common_fields = sorted((src_fields & dst_fields) - {"fid", "FID", KEY_FIELD})
    lookup: dict[object, dict[str, object]] = {}
    for feature in source.getFeatures():
        key = feature[KEY_FIELD]
        if key is None:
            continue
        if key in lookup:
            msg = f"Duplicate source key: {key!r}"
            raise ValueError(msg)
        lookup[key] = {name: feature[name] for name in common_fields}

    if destination.isEditable():
        msg = "Destination already has an edit session; refusing to modify it"
        raise RuntimeError(msg)
    if not destination.startEditing():
        msg = f"Could not start editing {destination.name()}"
        raise RuntimeError(msg)

    updated = missing = 0
    try:
        fields = destination.fields()
        indices = {name: fields.indexFromName(name) for name in common_fields}
        for feature in destination.getFeatures():
            values = lookup.get(feature[KEY_FIELD])
            if values is None:
                missing += 1
                continue
            for name, value in values.items():
                if indices[name] < 0 or not destination.changeAttributeValue(feature.id(), indices[name], value):
                    msg = f"Cannot update {name} for feature {feature.id()}"
                    raise RuntimeError(msg)
            updated += 1
        if not destination.commitChanges():
            msg = "; ".join(destination.commitErrors()) or "QGIS rejected the attribute update"
            raise RuntimeError(msg)
    except Exception:
        if destination.isEditable():
            destination.rollBack()
        raise
    print(f"Updated features: {updated}")
    print(f"Unmatched IDs: {missing}")
    print(f"Fields updated ({len(common_fields)}): {common_fields}")
    return updated, missing


copy_common_attributes()
