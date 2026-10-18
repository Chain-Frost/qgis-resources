# QGIS map-theme generation

The maintained script is [create_new_themes_from_list.py](create_new_themes_from_list.py).
It replaces the former version-suffixed utility and incorporates the useful
theme/atlas-generation behaviour previously found in the bespoke
AddLayersToTheme scripts. Those old scripts should not be copied.

Run in **QGIS 4** with the project open, the base map theme configured, and a
UTF-8 layer-list text file containing one unique **layer name** per line.
Review the editable DEFAULT_* settings near the top of the script. By default:

- Clone the base theme's visible layers and activate each requested layer in turn.
- Restore all layer-tree visibility checkboxes after recording each theme.
- Write a sorted CSV with theme names, five-digit sequential out_name IDs, and
  parsed AEP, duration, result type and DIFF columns.
- Skip the atlas GeoPackage unless DEFAULT_ATLAS_POINT_LAYER_NAME is set.

To create an atlas index, set DEFAULT_ATLAS_POINT_LAYER_NAME to the name of a
unique point layer loaded in the QGIS project. One point feature per new theme
is written to DEFAULT_ATLAS_OUTPUT, with theme_name and out_name fields.
The first feature in the input point layer is the shared viewport location.
Do not assume that one location is appropriate for a multi-viewport atlas;
use separate workflows when feature-specific extents are required.

By default the atlas output **will not overwrite** an existing file. Set
DEFAULT_OVERWRITE_ATLAS=True explicitly if replacement is intended. The new
GeoPackage is written to a temporary file and moved into place only after
successful export.

## Validation required before production adoption

A small headless test covers pure theme-name/row calculations, using a stub
PyQGIS module. Real QGIS 4 desktop validation is still necessary:

1. Load a project with a known base theme, a nested group and distinct raster
   layers. Verify generated theme visibility and that user-selected layer
   checkboxes are restored after generation.
2. Check missing and duplicate layer-name handling, existing theme collisions,
   output CSV formatting and stable five-digit sequence IDs.
3. Set an atlas input point layer, generate a GeoPackage, and check feature
   count, geometry, CRS, theme_name and out_name values in QGIS.
4. Verify failure handling for missing/empty/nonpoint atlas layers and
   overwriting an existing atlas file. Inspect atlas layout preview manually.
5. Run Ruff lint/format using the same repository settings as ryan-tools where
   feasible, plus Pyright with the installed QGIS 4 bindings/stubs.

This script does not directly edit QGZ XML, invoke legacy Shapefile libraries,
or modify the user project until it creates explicit map themes.
