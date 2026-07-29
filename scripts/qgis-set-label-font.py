from qgis.core import (
    QgsPalLayerSettings,
    QgsProject,
    QgsProperty,
    QgsVectorLayer,
)
from qgis.PyQt.QtGui import QFontDatabase


FONT_FAMILY = "Calibri"

# Set to True to remove any data-defined font-family expressions.
# Otherwise those expressions may override Calibri for individual labels.
REMOVE_DATA_DEFINED_FAMILY_OVERRIDES = True


# Confirm that the font is installed and obtain its exact registered name.
installed_fonts = {
    family.casefold(): family
    for family in QFontDatabase.families()
}

font_key = FONT_FAMILY.casefold()

if font_key not in installed_fonts:
    raise RuntimeError(
        f"Font '{FONT_FAMILY}' is not installed or is not visible to QGIS."
    )

resolved_font_family = installed_fonts[font_key]

project = QgsProject.instance()

updated_layers: list[str] = []
skipped_layers: list[str] = []
errors: list[str] = []


for layer in project.mapLayers().values():
    if not isinstance(layer, QgsVectorLayer):
        continue

    current_labeling = layer.labeling()

    if current_labeling is None:
        continue

    try:
        # Critical: work on an independent copy.
        replacement_labeling = current_labeling.clone()

        if replacement_labeling is None:
            skipped_layers.append(layer.name())
            continue

        provider_ids = list(replacement_labeling.subProviders())

        # Simple labelling normally uses the default empty provider ID.
        if not provider_ids:
            provider_ids = [""]

        settings_changed = 0

        for provider_id in provider_ids:
            settings = replacement_labeling.settings(provider_id)

            if settings is None:
                continue

            text_format = settings.format()
            font = text_format.font()

            # Preserve weight, italic, underline and other QFont properties.
            font.setFamily(resolved_font_family)

            text_format.setFont(font)

            # Also store the preferred family for project serialisation
            # and font restoration.
            text_format.setFamilies([resolved_font_family])

            settings.setFormat(text_format)

            if REMOVE_DATA_DEFINED_FAMILY_OVERRIDES:
                properties = settings.dataDefinedProperties()

                # An invalid QgsProperty removes the existing override.
                properties.setProperty(
                    QgsPalLayerSettings.Property.Family,
                    QgsProperty(),
                )

                settings.setDataDefinedProperties(properties)

            replacement_labeling.setSettings(
                settings,
                provider_id,
            )

            settings_changed += 1

        if settings_changed == 0:
            skipped_layers.append(layer.name())
            continue

        # QGIS takes ownership of the independent cloned object.
        layer.setLabeling(replacement_labeling)
        layer.triggerRepaint()

        updated_layers.append(layer.name())

    except Exception as exc:
        errors.append(f"{layer.name()}: {exc}")


if updated_layers:
    project.setDirty(True)

iface.mapCanvas().refresh()


print(
    f"Updated {len(updated_layers)} layer(s) "
    f"to {resolved_font_family}."
)

for layer_name in updated_layers:
    print(f"  Updated: {layer_name}")

for layer_name in skipped_layers:
    print(f"  Skipped: {layer_name}")

for error in errors:
    print(f"  Error: {error}")