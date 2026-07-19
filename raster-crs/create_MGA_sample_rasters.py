"""Create 1 m, single-pixel GeoTIFFs for selected Australian MGA CRSs."""

# Rasterio does not publish type information for these APIs.
# pyright: reportMissingTypeStubs=false
# pyright: reportUnknownMemberType=false, reportUnknownVariableType=false

from pathlib import Path

import numpy as np
import rasterio
from pyproj import Transformer
from rasterio.transform import from_origin

OUTPUT_DIR = Path(__file__).parent / "crs_samples"
LATITUDE = -26.0
EASTING = 500_000.0
PIXEL_SIZE = 1.0


def create_sample(epsg: int, datum: str, zone: int) -> Path:
    # At a UTM/MGA zone's central meridian, longitude is 6 * zone - 183.
    longitude = 6 * zone - 183
    transformer = Transformer.from_crs(4326, epsg, always_xy=True)
    projected_easting, northing = transformer.transform(longitude, LATITUDE)

    if abs(projected_easting - EASTING) > 0.001:
        raise ValueError(
            f"EPSG:{epsg} produced unexpected easting {projected_easting:.3f} m"
        )

    path = OUTPUT_DIR / f"crs_{datum}_MGA_zone{zone}_EPSG{epsg}.tif"
    transform = from_origin(
        EASTING - PIXEL_SIZE / 2,
        northing + PIXEL_SIZE / 2,
        PIXEL_SIZE,
        PIXEL_SIZE,
    )

    with rasterio.open(
        path,
        "w",
        driver="GTiff",
        width=1,
        height=1,
        count=1,
        dtype="float32",
        crs=f"EPSG:{epsg}",
        transform=transform,
        compress="deflate",
    ) as dataset:
        dataset.write(np.zeros((1, 1, 1), dtype=np.float32))

    return path


def main() -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    definitions = [(epsg, "GDA94", epsg - 28300) for epsg in range(28349, 28357)] + [
        (epsg, "GDA2020", epsg - 7800) for epsg in range(7849, 7857)
    ]

    for epsg, datum, zone in definitions:
        print(create_sample(epsg, datum, zone))


if __name__ == "__main__":
    main()
