# Tests

All Python tests for `qgis-resources` belong under this top-level directory.

- `test_theme_index.py`: theme name parsing and atlas index metadata.
- `test_spatial_rainfall_invariants.py`: mocked guards for previously
  field-proven snapping, ring closure, fallback repair and topology order.
- `test_qgis_data_operations.py`: GeoPackage field cleanup and spatial index logic.

Tests requiring a QGIS runtime should use appropriately marked fixtures and
run in a QGIS 4 / Python 3.12 validation environment. The present tests stub
PyQGIS and do not replace desktop integration testing.

From the repository root:

```powershell
python -m pytest tests -q
python -m ruff check scripts raster-crs tests
python -m ruff format --check scripts raster-crs tests
```

Do not create per-script `tests/` folders; extend this test tree instead.
