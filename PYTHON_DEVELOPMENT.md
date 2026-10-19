# Python development policy (QGIS 4)

This repository runs under **QGIS 4 on Windows with Python 3.12**.
Do not follow the parent ryan-tools package's newer Python runtime target.
All changes must remain valid Python 3.12 and use the PyQGIS 4 API; QGIS 3
backward compatibility is not a goal.

- Ruff 0.16.6: configured in root ruff.toml, aligned with ryan-tools rules
  where appropriate, with a Python 3.12 target.
- Pyright 1.1.414: **strict CI gates** cover the independent project
  parser (`pyright-ci.json`) and the maintained QGIS 4 utilities
  (`pyrightconfig.json`). The latter uses pinned
  the latest compatible `qgis-stubs>=1.0.0.dev0,<2` (including prereleases)
  with PyQt6 type definitions, resolving QGIS
  members in headless CI without loading actual QGIS binaries. The
  former basic headless baseline has been retired.
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
python -m pip install ruff==0.16.6 pyright==1.1.414 pytest==9.1.1 numpy rasterio pyproj
python -m pip install --pre "qgis-stubs>=1.0.0.dev0,<2"
python -m ruff check scripts raster-crs tests
python -m ruff format --check scripts raster-crs tests
python -m pyright -p pyright-ci.json
python -m pyright -p pyrightconfig.json
python -m pyright -p pyright-all.json
python -m pytest tests -q
```

## Strict PyQGIS typing on Windows

The default `pyrightconfig.json` checks maintained GeoPackage, spatial-index,
map-theme and project-parser code in **strict** mode. Its `extraPaths`
list includes example OSGeo4W locations
(`C:/OSGeo4W/apps/qgis/python` and `.../plugins`); adapt them to your
actual install. QGIS 4 uses Python 3.12 and Qt 6, independently of the
`ryan-tools` package's Python support.

In an OSGeo4W shell configured for your installed QGIS 4:

```powershell
python scripts/qgis_typing_environment.py
python -m pyright -p pyrightconfig.json
```

The environment helper reports actual QGIS/Qt/Python versions and binding
locations, failing for incompatible Python, QGIS or Qt versions. PyQGIS
wraps native C++ classes via SIP; Pyright uses the pinned QGIS 4/PyQt6
stub definitions, which must be checked against the actual bindings
when APIs evolve. Optional local stubs can be
placed in `.vscode/qgis-type-stubs`. Generated third-party stubs should
not be committed. **QGIS 4/Qt6 stubs** are installed using `python -m pip install --pre
"qgis-stubs>=1.0.0.dev0,<2"`, selecting the newest available 1.x QGIS
4-compatible prerelease or final release, rather than freezing a single
release. The minimum excludes QGIS 3/Qt5 releases (0.x). CI prints
the resolved version. Future upstream stub changes can expose type
differences and fail strict CI until reviewed; this is intentional.
These stubs are static analysis definitions, not a QGIS runtime. Test
them against the installed QGIS 4 version when API signatures change.

Hosted CI runs **strict Pyright** for the maintained QGIS 4 utilities
and project parser against the pinned QGIS 4 prerelease stubs. The
QGIS/Qt bindings themselves are not executed in this environment:
signatures or behaviours missing or incorrect in the prerelease
stubs may still produce false negatives. The local QGIS 4 desktop
checks below remain required before production use.

## Legacy Python audit

CI currently runs `pyright-all.json` over the older `scripts/`,
`raster-crs/`, and `CRS_info/params3.py` utilities. While
baseline findings are being addressed the **full repository scan is
informational**; the maintained scripts remain strict-gated. The
goal is to make a meaningful Pyright minimum standard mandatory for all
Python utilities, with no blanket missing-import suppressions and
real QGIS 4-specific validation for QGIS-dependent functions.

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
