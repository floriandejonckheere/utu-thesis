#import "@preview/cetz:0.2.2": canvas, draw, angle

#v(2em)

#let vertex = (name, x, y, stroke: black, fill: white) => {
  draw.circle((x, y), radius: .35, stroke: stroke, fill: fill, name: name)
  draw.content((x, y), eval(name, mode: "math"))
}

#let edge = (start, end, name) => {
  let (a, b) = (start, end)

  draw.line((a, .35, b), (b, .35, a), name: name)
}

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2), stroke: black)

  content((1.5, -3.5), "Second iteration")

  vertex("", -.35, .35)
  vertex("v_26", 0, 0, fill: green.lighten(80%))

  vertex("", 3.35, .35)
  vertex("v_24", 3, 0, fill: yellow.lighten(80%))

  edge("v_26", "v_24", "e_1")
})

#v(2em)
