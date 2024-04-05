#import "@preview/cetz:0.2.2": canvas, draw, tree

#v(2em)

#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2), stroke: black)

  circle((0, 0), radius: .45, stroke: black, name: "v_1")
  content((0, 0), [$v_1$])

  circle((3, 1), radius: .45, stroke: black, name: "v_2")
  content((3, 1), [$v_2$])

  let (a, b) = ("v_1", "v_2")
  line((a, .45, b), (b, .45, a), name: "e_1")
  content(("e_1.start", 1, "e_1.end"), anchor: "south", padding: .5, [$w(e_1)$])

  circle((1, -3), radius: .45, stroke: black, name: "v_3")
  content((1, -3), [$v_3$])

  let (a, b) = ("v_1", "v_3")
  line((a, .45, b), (b, .45, a), name: "e_2")
  content(("e_2.start", 1, "e_2.end"), anchor: "east", padding: .5, [$w(e_2)$])

  let (a, b) = ("v_2", "v_3")
  line((a, .45, b), (b, .45, a), name: "e_3")
  content(("e_3.start", 1.5, "e_3.end"), anchor: "west", padding: .5, [$w(e_3)$])

  circle((5, -4), radius: .45, stroke: black, name: "v_4")
  content((5, -4), [$v_4$])

  let (a, b) = ("v_3", "v_4")
  line((a, .45, b), (b, .45, a), name: "e_4")
  content(("e_4.start", 1.5, "e_4.end"), anchor: "north", padding: .5, [$w(e_4)$])

  circle((9, -3), radius: .45, stroke: black, name: "v_5")
  content((9, -3), [$v_5$])

  let (a, b) = ("v_4", "v_5")
  line((a, .45, b), (b, .45, a), name: "e_5")
  content(("e_5.start", 1.5, "e_5.end"), anchor: "north", padding: .5, [$w(e_5)$])

  circle((7, -1), radius: .45, stroke: black, name: "v_6")
  content((7, -1), [$v_6$])

  let (a, b) = ("v_5", "v_6")
  line((a, .45, b), (b, .45, a), name: "e_6")
  content(("e_6.start", 1.4, "e_6.end"), anchor: "north", padding: .5, [$w(e_6)$])

  circle((10, 0), radius: .45, stroke: black, name: "v_7")
  content((10, 0), [$v_7$])

  let (a, b) = ("v_5", "v_7")
  line((a, .45, b), (b, .45, a), name: "e_7")
  content(("e_7.start", 1.2, "e_7.end"), anchor: "west", padding: .5, [$w(e_4)$])

  circle((8, -6), radius: .45, stroke: black, name: "v_8")
  content((8, -6), [$v_8$])

  let (a, b) = ("v_4", "v_8")
  line((a, .45, b), (b, .45, a), name: "e_8")
  content(("e_8.start", 1, "e_8.end"), anchor: "north", padding: .5, [$w(e_8)$])
})

#v(2em)
