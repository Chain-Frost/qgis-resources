# 2d_loc QA style: QGIS 4 performance investigation

## Field report

The style in `styles/TUFLOW/2d_loc_qa_check.qml`, optimised by merged
[PR #3](https://github.com/Chain-Frost/qgis-resources/pull/3), took **30–60 seconds
to apply in QGIS** on 21 October 2026. QGIS appeared to hang but ultimately
completed. The delay has **not** been reproduced in a controlled benchmark.

The original PR was statically reviewed but did not include a measured QGIS
desktop load-and-render benchmark. Do not treat its merge as field validation.
The style contains eight symbol geometry generators and five rule-based labels
with generated label positions; a timing report by itself cannot establish
which component is responsible.

## Reproduce and isolate the delay

Use QGIS 4 with its supplied Python 3.12 environment. Save the project first;
run on a **copy** or on a layer whose style may be temporarily replaced.

1. Record QGIS exact version/build, operating system, rendering max-core setting,
   source path/provider (local versus network), feature count and approximate
   vertices per feature. Keep a copy of the test layer and its original style.
2. Select the `2d_loc` polygon layer, keep map extent fixed, and turn off
   unrelated layers. In the QGIS Python Console, run:

   ```python
   from pathlib import Path

   script = Path(r"X:\path\to\qgis-resources\scripts\benchmark_2d_loc_qml.py")
   exec(
       compile(script.read_text(encoding="utf-8"), str(script), "exec"),
       {"__name__": "__main__", "__file__": str(script)},
   )
   ```

3. Retain **all output**. The benchmark times `loadNamedStyle` separately
   from the first and second canvas redraw; it then measures the style with
   labels disabled, the labels with a simple renderer, and a simple unlabelled
   renderer. This helps distinguish style-loading, geometry-generator,
   labelling, and general map-render costs.
4. Repeat on the *same* data and viewport with the QGIS rendering maximum
   cores set to **1** and with its original setting. This is a diagnostic
   comparison, not a proposed permanent configuration.
5. Where practical, repeat with a copy of the source on a local drive to
   separate network latency from expression/rendering costs. Note whether the
   **initial application** or subsequent pan/zoom/refresh is slow.

**Caveats:** This script runs inside QGIS desktop, not ordinary Python 3.14.
It changes the selected layer's style temporarily and restores it in a
`finally` block. It does not modify the QML file or save the project. A hard
QGIS crash cannot trigger Python cleanup. The 120-second redraw watchdog
cannot interrupt QGIS work blocking its main thread. Save the project before
running; inspect the original style after it completes.

## Work required before a production replacement

- Establish baseline QML load time, first redraw, warm redraw, and pan/zoom
  responsiveness on the affected real-world layer.
- Compare geometry generators and labels separately using the benchmark
  before rewriting expensive expressions. Prefer reducing duplicated
  calculations while retaining invalid-geometry QA.
- Test ordinary four-corner rectangles and malformed rings, including rings
  with additional vertices, so fallback traversal does not invent or omit
  polygon edges.
- Preserve axis-alignment highlighting, rectangle geometry tests, clockwise
  ordering, lower-left-origin checks, vertex labels and the QA summary.
- Compare the **visual output** of the candidate and merged original in QGIS
  at matching extents. Static XML checks alone are insufficient.
- Record results in this document or the new PR discussion, including the
  exact QGIS build and feature counts. Agree acceptable responsiveness
  before replacing the production QML.

## Results table

| QGIS build | Source/features | Cores | QML load | First redraw | Warm redraw | Labels off | Simple renderer | Conclusion |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| *Pending controlled test* | *Pending* | *Pending* | *Pending* | *Pending* | *Pending* | *Pending* | *Pending* | *Pending* |

The previously reported **30–60 seconds** is an observed user-interface
delay when applying the style, **not** a measured `loadNamedStyle` duration.
