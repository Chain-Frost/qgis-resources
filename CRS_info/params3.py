"""Example Roy Hill local-grid similarity transformation parameters.

This historical coordinate-system calculation requires the separate
`simil` package at runtime. The input control points are illustrative
and must not be reused for a different mine grid without verification.
"""

from __future__ import annotations

import numpy as np
import simil  # pyright: ignore[reportMissingImports] -- external similarity-transform example dependency


def main() -> None:
    """Calculate and report the affine coefficients from the supplied control points."""
    np.set_printoptions(precision=3, suppress=True)
    source_points = np.array([[658000.00095, 7745999.99981, 0], [664051.772667158, 7752586.05015018, 0]])
    target_points = np.array([[0, 0, 0], [8000, 4000, 0]])
    scalar, rotation, translation = simil.process(source_points, target_points)

    print(f"\n m scalar = \n{scalar}")
    print(f"\n R matrix = \n{rotation}")
    print(f"\n T vector = \n{translation}")
    for name, value in (
        ("A0", translation[0]),
        ("A1", scalar * rotation[0][0]),
        ("A2", scalar * rotation[0][1]),
        ("B0", translation[1]),
        ("B1", scalar * rotation[1][0]),
        ("B2", scalar * rotation[1][1]),
    ):
        print(f"\n {name} = {value}")


if __name__ == "__main__":
    main()
