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

  blob((0,1), [Problem identification #linebreak() and motivation]),
  edge("-|>"),
  blob((1,1), [Objectives of a solution]),
  edge("-|>"),
  blob((2,1), [Design and development]),
  edge("-|>"),
  blob((2,2), [Demonstration]),
  edge("-|>"),
  blob((1,2), [Evaluation]),
  edge("-|>"),
  blob((0,2), [Communication]),
)
