# TUFLOW QGIS processing models

This folder contains QGIS Processing models for preparing common TUFLOW inputs, including `1d_nwk`, `2d_bc`, `2d_sx`,
`2d_loc` and `2d_zsh` layers. Model names and parameters vary, so inspect the selected `.model3` file in QGIS before
running it and save outputs into the intended project location.

## Culvert supporting workbook

[`supporting-workbooks/TUFLOW culverts.xlsx`](supporting-workbooks/TUFLOW%20culverts.xlsx) is a formula-driven workbook
for converting culvert exports into tables consumed by relevant QGIS models. It is stored with Git LFS; if Excel reports
an invalid or tiny file, run `git lfs pull` in this submodule before opening it.

The workbook currently supports two input routes:

- paste a 12D culvert report into `12D-Culverts.rpt` (and road report content into `12D-Road.rpt` where required);
- paste or import an existing network table into `1d_nwk-import`.

Intermediate sheets such as `PointsTidy - 12D`, `PointsTidy -from 1dnwk`, `PointsTidy - master` and `ProcessAngle`
normalise endpoints, names, dimensions, inverts and orientation. The generated output tables are `1d_nwk`, `2d_bc` and
`2d_zsh`.

Suggested workflow:

1. Copy the workbook into the project workspace so the shared template remains unchanged.
2. Replace the sample input rows in the appropriate input sheet without changing its expected headers or formulas.
3. Choose the input source and review any editable culvert-name mappings in `PointsTidy - master`.
4. Recalculate the workbook in Excel and inspect the generated output sheets for formula errors, duplicates and
   unexpected inverts or dimensions.
5. Save each required output sheet as a CSV, then use the matching `*_from_csv_table*.model3` model in QGIS to create
   the spatial layer.
6. Check geometry, CRS, field types, endpoint orientation and TUFLOW naming before using the result in a model.

The workbook contains worked sample rows, not authoritative project data. Do not treat its sample CRS, names, roughness
or dimensions as defaults for a new project. Formula behavior should be validated in desktop Excel; reading the file in
Python or a non-Excel application is not an equivalent recalculation check.
