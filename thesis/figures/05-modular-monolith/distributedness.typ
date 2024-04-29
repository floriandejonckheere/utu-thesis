#import "@preview/cetz:0.2.2"

#set text(font: "Fira Sans", size: 7pt)

#cetz.canvas(length: 0.45cm, {
  import cetz.draw: *

  set-style(
    content: (padding: .2),
    stroke: black
  )

  rect(
    (0, 0), (5, 5),
    fill: red.lighten(90%),
    stroke: none,
    name: "traditional_monolith")
  content("traditional_monolith", align(center, [Traditional\ monolith]))

  rect(
    (5, 0), (10, 5),
    fill: green.lighten(90%),
    stroke: none,
    name: "modular_monolith")
  content("modular_monolith", align(center, [Modular\ monolith]))

  rect(
    (0, 5), (5, 10),
    fill: blue.lighten(90%),
    stroke: none,
    name: "distributed_monolith")
  content("distributed_monolith", align(center, [Distributed\ monolith]))

  rect(
    (5, 5), (10, 10),
    fill: yellow.lighten(90%),
    stroke: none,
    name: "microservice")
  content("microservice", align(center, [Microservice]))

  // X axis
  line((-0.5, 5), (10.5, 5), mark: (start: ">", end: ">", fill: black))
  content((-1.5, 5), align(center, [Logical\ monolith]))
  content((11.5, 5), align(center, [Logical\ modular]))

  // Y axis
  line((5, -0.5), (5, 10.5), mark: (start: ">", end: ">", fill: black))
  content((5, -1.5), align(center, [Physical\ monolith]))
  content((5, 11.5), align(center, [Physical\ distributed]))
})

#v(2em)
