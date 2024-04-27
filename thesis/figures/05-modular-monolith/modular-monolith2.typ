#import "@preview/cetz:0.2.2"

#set text(font: "Fira Sans", size: 9pt)

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  set-style(
    content: (padding: .2),
    stroke: black
  )

  // Monolith
  rect(
    (0, 0), (4, 3),
    radius: 0.1,
    fill: orange.lighten(90%),
    stroke: (paint: orange.lighten(60%)),
    name: "monolith")
  content("monolith.south", text: gray, align(center, [#v(2em)Monolith]))

  // Modular monolith
  rect(
    (4.5, 0), (8.5, 3),
    radius: 0.1,
    fill: orange.lighten(90%),
    stroke: (paint: orange.lighten(60%)),
    name: "modular_monolith")
  content("modular_monolith.south", text: gray, align(center, [#v(4em)Modular\ monolith]))

  rect(
    (4.75, 0.25), (6, 1),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "modular_monolith_1")
  rect(
    (7, 0.25), (8.25, 1),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "modular_monolith_2")
  rect(
    (4.75, 2), (6, 2.75),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "modular_monolith_3")
  rect(
    (7, 2), (8.25, 2.75),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "modular_monolith_4")
  line("modular_monolith_2.west", "modular_monolith_1.east", mark: (end: ">", fill: black))
  line("modular_monolith_2.north", "modular_monolith_4.south", mark: (end: ">", fill: black))
  line("modular_monolith_4.west", "modular_monolith_3.east", mark: (end: ">", fill: black))
  line("modular_monolith_1.north", "modular_monolith_3.south", mark: (end: ">", fill: black))
  line("modular_monolith_4.south-west", "modular_monolith_1.north-east", mark: (end: ">", fill: black))

  // Microservices
  rect(
    (9, 0), (13, 4),
    radius: 0.1,
    stroke: none,
    name: "microservices")
  content("microservices.south", text: gray, align(center, [#v(2em)Microservices]))

  rect(
    (9.25, 0.25), (10.5, 1),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "microservices_1")
  rect(
    (11.25, 0.25), (12.5, 1),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "microservices_2")
  rect(
    (9.25, 2), (10.5, 2.75),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "microservices_3")
  rect(
    (11.25, 2), (12.5, 2.75),
    radius: 0.05,
    fill: orange.lighten(70%),
    stroke: (paint: orange.lighten(30%)),
    name: "microservices_4")
  line("microservices_2.west", "microservices_1.east", mark: (end: ">", fill: black))
  line("microservices_2.north", "microservices_4.south", mark: (end: ">", fill: black))
  line("microservices_4.west", "microservices_3.east", mark: (end: ">", fill: black))
  line("microservices_1.north", "microservices_3.south", mark: (end: ">", fill: black))
  line("microservices_4.south-west", "microservices_1.north-east", mark: (end: ">", fill: black))
})

#v(2em)
