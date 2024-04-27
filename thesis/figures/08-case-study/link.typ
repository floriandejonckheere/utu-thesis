#import "@preview/cetz:0.2.2"

#set text(font: "Fira Sans", size: 9pt)

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  set-style(
    content: (padding: .2),
    stroke: black
  )

  line((0, 0), (10, 0), stroke: (paint: gray, dash: "dashed"))

  content((0.5, 0.5), align(left, text(gray, "Cloud")))
  content((0.90, -0.5), align(left, text(gray, "On-premise")))

  rect(
    (4.5, 1), (5.5, 2),
    radius: 0.5,
    fill: blue.lighten(80%),
    stroke: (paint: blue.lighten(40%)),
    name: "nephroflow")
  content("nephroflow.north", text(blue.darken(20%), align(center, [NephroFlow\ Cloud#v(5em)])))

  rect(
    (4.5, -1), (5.5, -2),
    radius: 0.5,
    fill: orange.lighten(80%),
    stroke: (paint: orange.lighten(40%)),
    name: "link")
  content("link.south", text(orange.darken(20%), align(center, [#v(5em)NephroFlow\ Link])))

  content((4, 0.5), text(gray, align(center, [HTTPS])))

  rect(
    (4.25, -0.25), (5.75, 0.25),
    radius: 0.05,
    fill: red.lighten(80%),
    stroke: (paint: red.lighten(40%)),
    name: "firewall")
  content("firewall.north-east", text(red.darken(20%), align(center, [#h(5em)Firewall#v(2em)])))

  line((5.1, -0.9), (5.1, 0.9), stroke: gray, mark: (start: ">", fill: gray))
  line((4.9, -0.9), (4.9, 0.9), stroke: gray, mark: (end: ">", fill: gray))

  rect(
    (2, -1), (3, -2),
    radius: 0.5,
    fill: yellow.lighten(80%),
    stroke: (paint: yellow.lighten(40%)),
    name: "ehr")
  content("ehr.south", text(yellow.darken(20%), align(center, [#v(5em)Electronic Health\ Record])))

  content((3.8, -1), text(gray, align(center, [HL7])))

  line((3.1, -1.4), (4.4, -1.4), stroke: gray, mark: (start: ">", fill: gray))
  line((3.1, -1.6), (4.4, -1.6), stroke: gray, mark: (end: ">", fill: gray))

  rect(
    (7, -0.5), (7.5, -1),
    radius: 0.5,
    fill: green.lighten(80%),
    stroke: (paint: green.lighten(40%)),
    name: "dialysis_1")
  line((6.9, -0.85), (5.6, -1.35), stroke: green.lighten(40%), mark: (end: ">", fill: green.lighten(40%)))

  rect(
    (7, -1.25), (7.5, -1.75),
    radius: 0.5,
    fill: green.lighten(80%),
    stroke: (paint: green.lighten(40%)),
    name: "dialysis_2")
  line((6.9, -1.5), (5.6, -1.5), stroke: green.lighten(40%), mark: (end: ">", fill: green.lighten(40%)))

  rect(
    (7, -2), (7.5, -2.5),
    radius: 0.5,
    fill: green.lighten(80%),
    stroke: (paint: green.lighten(40%)),
    name: "dialysis_3")
  line((6.9, -2.15), (5.6, -1.65), stroke: green.lighten(40%), mark: (end: ">", fill: green.lighten(40%)))

  content("dialysis_2.east", text(green.darken(20%), align(center, [#h(8em)Dialysis\ #h(8em)machines])))
  content((6.5, -2.8), text(green.darken(20%), align(center, [TCP/serial])))
})

#v(2em)
