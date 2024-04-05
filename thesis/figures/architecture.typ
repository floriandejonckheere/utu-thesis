#import "@preview/fletcher:0.4.2" as fletcher: node, edge

#set text(font: "Fira Sans", size: 9pt)

#let blob(pos, label, tint: yellow, ..args) = node(
  pos,
  align(center, label),
  width: 40mm,
  fill: tint.lighten(60%),
  stroke: 1pt + tint.darken(20%),
  corner-radius: 2pt,
  ..args,
)

#fletcher.diagram(
  spacing: 20pt,
  cell-size: (20mm, 10mm),
  edge-stroke: 1pt,
  edge-corner-radius: 5pt,
  mark-scale: 80%,

  blob((0,0), [Source code#linebreak()repository], tint: green),
  edge("-|>"),
  blob((0,1.5), [Static analysis]),
  blob((0,2), [Evolutionary analysis], tint: yellow),
  edge((0,2), (0,3), "-|>"),
  edge("-|>"),
  blob((1.5, 2), [Dependency graph]),
  blob((0,3), [Clustering algorithm], tint: yellow),
  edge("-|>"),
  blob((0,4), [Quality metrics], tint: yellow),
  edge("-|>"),
  blob((0,5.5), [Proposed #linebreak() microservices], tint: green),
)

#v(2em)
