#import "@preview/cetz:0.2.2"

#v(2em)

#set text(font: "Fira Sans", size: 9pt)

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  set-style(
    content: (padding: .2),
    stroke: black
  )

  rect(
    (0, 0), (3.5, -1.25),
    radius: 0.1,
    fill: green.lighten(60%),
    stroke: 1pt + green.darken(20%),
    name: "source_code")
  content("source_code", align(center, [Source code\ repository]))

  rect(
    (0, -2), (3.5, -2.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "static_analysis")
  content("static_analysis", align(center, [Static analysis]))

  rect(
    (0, -3), (3.5, -3.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "evolutionary_analysis")
  content("evolutionary_analysis", align(center, [Evolutionary analysis]))

  line("source_code", "static_analysis", mark: (end: ">", fill: black))

  rect(
    (5, -3), (8.5, -3.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "dependency_graph")
  content("dependency_graph", align(center, [Dependency graph]))

  line("evolutionary_analysis", "dependency_graph", mark: (end: ">", fill: black))

  rect(
    (0, -4.75), (3.5, -5.5),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "clustering_algorithm")
  content("clustering_algorithm", align(center, [Clustering algorithm]))

  line("evolutionary_analysis", "clustering_algorithm", mark: (end: ">", fill: black))

  rect(
    (0, -6.5), (3.5, -7.25),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "quality_metrics")
  content("quality_metrics", align(center, [Quality metrics]))

  line("clustering_algorithm", "quality_metrics", mark: (end: ">", fill: black))

  rect(
    (0, -8.25), (3.5, -9.5),
    radius: 0.1,
    fill: green.lighten(60%),
    stroke: 1pt + green.darken(20%),
    name: "proposed_microservices")
  content("proposed_microservices", align(center, [Proposed\ microservices]))

  line("quality_metrics", "proposed_microservices", mark: (end: ">", fill: black))

  // Groups
  rect(
    (-3, -1.75), (3.75, -4),
    radius: 0.1,
    stroke: (paint: gray, dash: "dashed"),
    name: "information_extraction")
  content("information_extraction.west", text: gray, align(center, [#h(8em)Information\ #h(8em)extraction]))

  rect(
    (-3, -4.5), (3.75, -5.75),
    radius: 0.1,
    stroke: (paint: gray, dash: "dashed"),
    name: "decomposition")
  content("decomposition.west", text: gray, align(center, [#h(8em)Decomposition]))

  rect(
    (-3, -6.25), (3.75, -7.5),
    radius: 0.1,
    stroke: (paint: gray, dash: "dashed"),
    name: "evaluation")
  content("evaluation.west", text: gray, align(center, [#h(8em)Evaluation]))

  rect(
    (4.5, -1.75), (9, -4),
    radius: 0.1,
    stroke: (paint: gray, dash: "dashed"),
    name: "visualization")
  content("visualization.north", text: gray, align(center, [\ Visualization]))

})

#v(2em)
