# QGIS resources

QGIS styles, print layouts, processing models, supporting workbooks, and utility scripts extracted from
[`Chain-Frost/ryan-tools`](https://github.com/Chain-Frost/ryan-tools).

The repository retains the original file history and commit attribution from `ryan-tools`. It is normally
checked out at `qgis-resources/` as a submodule of that repository.

## Layout

- `styles/`: QML styles, QPT layouts, and supporting spatial assets.
- `processing-models/`: QGIS processing models and the workbooks required to prepare their inputs.
- `scripts/`: scripts intended to run from the QGIS Python console or a configured PyQGIS environment.

Workbooks are managed with Git LFS. Install Git LFS before cloning directly:

```powershell
git lfs install
git clone https://github.com/Chain-Frost/qgis-resources.git
```

When working through `ryan-tools`, initialise the checkout with:

```powershell
git submodule update --init qgis-resources
```
