#import "@preview/fletcher:0.4.2" as fletcher: node, edge

#set text(font: "Fira Sans", size: 9pt)

#let blob(pos, label, tint: yellow, ..args) = node(
  pos,
  align(center, label),
  width: 55mm,
  fill: tint.lighten(60%),
  stroke: 1pt + tint.darken(20%),
  corner-radius: 2pt,
  ..args,
)

#fletcher.diagram(
  spacing: 10pt,
  cell-size: (10mm, 15mm),
  edge-stroke: 1pt,
  edge-corner-radius: 5pt,
  mark-scale: 70%,

  blob((0,1), [Problem identification #linebreak() and motivation]),
  edge("-|>"),
  blob((0,2), [Objectives of a solution]),
  edge("-|>"),
  blob((0,3), [Design and development]),
  edge("-|>"),
  blob((0,4), [Demonstration]),
  edge("-|>"),
  blob((0,5), [Evaluation]),
  edge("-|>"),
  blob((0,6), [Communication]),
)
