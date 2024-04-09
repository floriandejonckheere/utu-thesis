#import "@preview/cetz:0.2.2": canvas, draw

#v(2em)

#let vertex = (name, x, y, stroke: black) => {
  draw.circle((x, y), radius: .35, stroke: stroke, name: name)
  draw.content((x, y), eval(name, mode: "math"))
}

#let edge = (start, end, name, content: false, anchor: "north", padding: .5) => {
  let (a, b) = (start, end)

  draw.line((a, .35, b), (b, .35, a), name: name)

  if (content) {
    draw.content(
      (name + ".start", 1, name + ".end"),
      anchor: anchor,
      padding: padding,
      eval("w(" + name + ")", mode: "math"),
    )
  }
}

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2), stroke: black)

  content((3.5, -7.5), "Original network")

  vertex("v_0", 110/35, -50/35)
  vertex("v_1", 75/35, -20/35)
  vertex("v_2", 35/35, -50/35)
  vertex("v_3", 180/35, -35/35)
  vertex("v_4", 45/35, -95/35)
  vertex("v_5", 100/35, -95/35)
  vertex("v_6", 225/35, -110/35)
  vertex("v_7", 210/35, -70/35)
  vertex("v_8", 90/35, -130/35)
  vertex("v_9", 125/35, -160/35)
  vertex("v_10", 125/35, -200/35)
  vertex("v_11", 185/35, -155/35)
  vertex("v_12", 80/35, -215/35)
  vertex("v_13", 185/35, -205/35)
  vertex("v_14", 45/35, -190/35)
  vertex("v_15", 50/35, -145/35)

  edge("v_1", "v_2", "e_1")
  edge("v_1", "v_4", "e_2")
  edge("v_1", "v_7", "e_3")
  edge("v_2", "v_0", "e_4")
  edge("v_2", "v_6", "e_5")
  edge("v_2", "v_5", "e_6")
  edge("v_2", "v_4", "e_7")
  edge("v_3", "v_0", "e_8")
  edge("v_3", "v_7", "e_9")
  edge("v_4", "v_0", "e_10")
  edge("v_4", "v_10", "e_11")
  edge("v_5", "v_0", "e_12")
  edge("v_5", "v_7", "e_13")
  edge("v_5", "v_11", "e_14")
  edge("v_6", "v_7", "e_15")
  edge("v_6", "v_11", "e_16")
  edge("v_8", "v_9", "e_17")
  edge("v_8", "v_10", "e_18")
  edge("v_8", "v_11", "e_19")
  edge("v_8", "v_15", "e_20")
  edge("v_9", "v_12", "e_21")
  edge("v_9", "v_14", "e_22")
  edge("v_10", "v_11", "e_23")
  edge("v_10", "v_12", "e_24")
  edge("v_10", "v_13", "e_25")
  edge("v_10", "v_14", "e_26")
  edge("v_11", "v_13", "e_27")
})

#v(2em)
