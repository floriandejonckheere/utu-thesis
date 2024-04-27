#import "@preview/cetz:0.2.2": canvas, chart, draw, palette

#let data = (
  ([#ref(<scn_structural_logical>, supplement: none)], 8.311, 156.85735489999934, 3.607),
  ([#ref(<scn_structural_contributor>, supplement: none)], 8.311, 71.93678768199607, 3.404),
  ([#ref(<scn_logical_contributor>, supplement: none)], 8.311, 148.14274523600034, 4.908),
  ([#ref(<scn_structural_logical_contributor>, supplement: none)], 8.311, 127.67580917900341, 3.732),
)

#canvas({
  draw.set-style(legend: (fill: white))
  chart.columnchart(
    data,
    mode: "stacked",
    size: (auto, 4),
    bar-width: 0.2,
    label-key: 0,
    value-key: (1, 2, 3),
    labels: ([Extraction], [Decomposition], [Evaluation]),
    legend: "legend.south",
  )
})
