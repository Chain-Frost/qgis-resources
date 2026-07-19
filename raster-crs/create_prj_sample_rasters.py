"""Create 1 m, single-pixel GeoTIFFs from one or more PRJ files."""

# Rasterio does not publish type information for these APIs.
# pyright: reportMissingTypeStubs=false, reportUnknownArgumentType=false
# pyright: reportUnknownMemberType=false, reportUnknownVariableType=false

from argparse import ArgumentParser
from collections.abc import Iterable
from pathlib import Path

import numpy as np
import rasterio
from rasterio.crs import CRS
from rasterio.transform import from_origin

type PathInput = str | Path

# Set this to either one PRJ path or a list of PRJ paths.
PRJ_PATHS: PathInput | list[PathInput] = [r"C:\path\Local_Grid.prj"]

DEFAULT_OUTPUT_DIR: Path = Path(__file__).parent / "crs_samples"
PIXEL_SIZE = 1.0


def _normalise_paths(prj_paths: PathInput | Iterable[PathInput]) -> list[Path]:
    """Return PRJ inputs as a list, treating a single string as one path."""
    if isinstance(prj_paths, (str, Path)):
        return [Path(prj_paths)]
    return [Path(path) for path in prj_paths]


def create_sample(prj_path: PathInput, output_dir: Path = DEFAULT_OUTPUT_DIR) -> Path:
    """Create a one-pixel GeoTIFF containing the CRS from ``prj_path``."""
    source_path = Path(prj_path)
    if source_path.suffix.casefold() != ".prj":
        raise ValueError(f"Expected a .prj file: {source_path}")
    if not source_path.is_file():
        raise FileNotFoundError(f"PRJ file does not exist: {source_path}")

    crs = CRS.from_wkt(source_path.read_text(encoding="utf-8-sig"))
    output_dir.mkdir(parents=True, exist_ok=True)
    output_path: Path = output_dir / f"crs_{source_path.stem}.tif"

    transform = from_origin(
        -PIXEL_SIZE / 2,
        PIXEL_SIZE / 2,
        PIXEL_SIZE,
        PIXEL_SIZE,
    )
    with rasterio.open(
        output_path,
        mode="w",
        driver="GTiff",
        width=1,
        height=1,
        count=1,
        dtype="float32",
        crs=crs,
        transform=transform,
        compress="deflate",
    ) as dataset:
        dataset.write(np.zeros((1, 1, 1), dtype=np.float32))

    return output_path


def create_samples(
    prj_paths: PathInput | Iterable[PathInput],
    output_dir: Path = DEFAULT_OUTPUT_DIR,
) -> list[Path]:
    """Create sample rasters for either one PRJ path or an iterable of paths."""
    paths: list[Path] = _normalise_paths(prj_paths=prj_paths)
    if not paths:
        raise ValueError("At least one PRJ path is required")
    return [create_sample(prj_path=path, output_dir=output_dir) for path in paths]


def parse_args() -> tuple[PathInput | Iterable[PathInput], Path]:
    """Parse command-line arguments."""
    parser = ArgumentParser(description=__doc__)
    parser.add_argument(
        "prj_paths",
        nargs="*",
        type=Path,
        help="Optional paths to .prj files; these override PRJ_PATHS in the script",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT_DIR,
        help=f"Output directory (default: {DEFAULT_OUTPUT_DIR})",
    )
    arguments = parser.parse_args()
    return arguments.prj_paths or PRJ_PATHS, arguments.output_dir


def main() -> None:
    """Create and report each requested sample raster."""
    prj_paths, output_dir = parse_args()
    for output_path in create_samples(prj_paths=prj_paths, output_dir=output_dir):
        print(output_path)


if __name__ == "__main__":
    main()
