# Python development policy (QGIS 4)

This repository runs under **QGIS 4 on Windows with Python 3.12**.
Do not follow the parent ryan-tools package's newer Python runtime target.
All changes must remain valid Python 3.12 and use the PyQGIS 4 API; QGIS 3
backward compatibility is not a goal.

- Ruff 0.16.6: configured in root ruff.toml, aligned with ryan-tools rules
  where appropriate, with a Python 3.12 target.
- Pyright 1.1.414: configured in pyrightconfig.json for Python 3.12 on
  Windows. Headless CI excludes missing native PyQGIS bindings; run
  Pyright locally against the installed QGIS 4 Python environment for API
  accuracy. The initial tracked-code type-checking policy is basic.
- Pytest: all tests live under the top-level `tests/` directory; pure logic is tested with minimal QGIS mocks in Windows CI.
  These tests do **not** verify native processing, GeoPackage writes, QGIS
  editing-provider behaviour, or real map themes. Manual QGIS 4 validation
  is necessary before approving those workflows.
- All tracked Python files under `scripts/`, `raster-crs/` and `tests/`, including
  legacy one-off utilities, are now Ruff-lint and Ruff-format clean.
  Both checks run as required gates in Windows/Python 3.12 CI. This
  mechanical cleanup does not imply functional validation or ongoing
  support for every legacy QGIS-console script.

Locally, from a QGIS-enabled shell (or another Python 3.12 environment):

```powershell
python -m pip install ruff==0.16.6 pyright==1.1.414 pytest==9.1.1
python -m ruff check scripts raster-crs tests
python -m ruff format --check scripts raster-crs tests
python -m pyright -p pyrightconfig.json
python -m pytest tests -q
```

## Migrated operations

### GeoPackage attribute cleanup
[cleanup_geopackage_fields.py](scripts/cleanup_geopackage_fields.py) replaces
the useful selected-layer workflow of the former `delete-geopacakge-columns-v1.py`.
Defaults: the old CAD-import attribute names, selected vector layers only,
**dry-run enabled**. Review printed matching/missing field names; set
`DEFAULT_DRY_RUN = False` to actually remove attributes. Changes use QGIS
editing and commit/rollback per layer; the script does **not** run SQLite
VACUUM against a GeoPackage still open in QGIS.

### Native spatial indexing
[create_spatial_indexes.py](scripts/create_spatial_indexes.py) replaces
the old `make_spatial_index.py` shell calls with the supported provider API.
Defaults to project shapefiles, skips a pre-existing .qix, checks index
capabilities, then creates the spatial index. The script never calls
ogrinfo.exe, runs shell commands, or converts UNC paths to mapped letters.
Enable additional extensions or selection-only processing by changing the
editable defaults. Use dry-run to see planned work.

## Required real QGIS 4 desktop validation

1. For GeoPackage cleanup, select multiple OGR layers, test a temporary
   copy of an actual GPKG with CAD-style attributes, confirm dry-run,
   field deletion, QGIS commit persistence and a reload. Test non-GPKG
   and partially missing field cases; avoid production data until verified.
2. For spatial indexing, test temporary shapefiles with/without .qix;
   verify provider capability, creation, and repeat-run skip behaviour.
   Check cases with loaded read-only layers. Validate a GeoPackage only
   if its extension is deliberately enabled.
3. For theme generation, follow [the specific test plan](scripts/LotsOfThemes/README.md).

Do not delete historical `unsorted/QGIS` source as part of this PR; that
belongs to a separate source-cleanup change after real-world validation.
