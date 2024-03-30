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

  rectangle((0,0), (3,1)),
  blob((0,0), [Source code], tint: green),
  edge("-|>"),
  blob((1,0), [Static analysis]),
  edge((1,0), (2,0), "-|>"),
  blob((1,1), [Evolutionary analysis], tint: yellow),
  edge((1,1), (2,1), (2,0), "-|>"),
  blob((2,0), [Weighted graph]),
  edge("-|>"),
  blob((3,0), [Proposed #linebreak() microservices], tint: green),
)
