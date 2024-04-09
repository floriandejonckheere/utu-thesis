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

  content((1, -3.5), "Community aggregation")

  vertex("", -.35, .35)

  vertex("v_14", 0, 0, fill: green.lighten(80%))

  vertex("", 2.35, .35)
  vertex("v_4", 2, 0, fill: blue.lighten(80%))

  vertex("", -.35, -2.35)
  vertex("v_16", 0, -2, fill: red.lighten(80%))

  vertex("", 2.35, -2.35)
  vertex("v_2", 2, -2, fill: yellow.lighten(80%))

  edge("v_14", "v_4", "e_1")
  edge("v_14", "v_16", "e_2")
  edge("v_14", "v_2", "e_3")
  edge("v_4", "v_2", "e_4")
  edge("v_2", "v_16", "e_5")
})

#v(2em)
