from qgis.core import QgsProject

# Get the current project instance
project = QgsProject.instance()
if project is None:
    msg = "No QGIS project is available"
    raise RuntimeError(msg)

# Access the map theme collection
themes = project.mapThemeCollection()
if themes is None:
    msg = "No map-theme collection is available"
    raise RuntimeError(msg)

# Get the list of all theme IDs
theme_ids = themes.mapThemes()

# Remove each theme by its ID
for theme_id in theme_ids:
    themes.removeMapTheme(theme_id)

print("All themes have been removed from the project.")
