# 2d_loc QML styles

| File | Purpose |
| --- | --- |
| `2d_loc_qa_check.qml` | Default/classic `2d_loc` style, restored from the version of `2d_loc_v2.qml` immediately before the 30 August 2026 major redesign. |
| `2d_loc_qa_check_fancy.qml` | Opt-in expanded QA style with geometry checks, vertex annotations, and rule-based labels. |

The **default** style contains the historical content from commit
[`29486d7`](https://github.com/Chain-Frost/qgis-resources/commit/29486d74ec1dca6b83a6e720fe861cfff7fff849).
The **fancy** style preserves the version merged via
[PR #3](https://github.com/Chain-Frost/qgis-resources/pull/3) as it existed on
`main` before the rollback, without modifications.

**Performance status:** The fancy variant took approximately 30–60 seconds to
apply in a QGIS field test, and its performance is under investigation in
[PR #6](https://github.com/Chain-Frost/qgis-resources/pull/6).
Neither variant has been performance benchmarked by this rollback PR. Use the
default variant for the established appearance; apply the fancy variant only
when you specifically need its additional QA annotations.
