#import "@preview/cetz:0.2.2"

#set text(font: "Fira Sans", size: 9pt)

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  set-style(
    content: (padding: .2),
    stroke: black
  )

  rect(
    (-2, 1), (-0.75, -5),
    radius: 0.1,
    fill: gray.lighten(95%),
    stroke: (paint: gray.lighten(60%), dash: "dashed"),
    name: "broker")
  content("broker", text: gray, angle: 90deg, align(center, [Shared components]))

  // Broker
  rect(
    (-0.25, -4), (12.25, -5),
    radius: 0.1,
    fill: gray.lighten(95%),
    stroke: (paint: gray.lighten(60%), dash: "dashed"),
    name: "broker")
  content("broker", text: gray, align(center, [Message broker]))

  // Inventory
  rect(
    (-0.25, 1), (3.75, -3),
    radius: 0.1,
    fill: blue.lighten(90%),
    stroke: (paint: blue.lighten(60%)),
    name: "inventory")
  content("inventory.north", text: gray, align(center, [#v(3em)Inventory]))

  rect(
    (0, 0), (3.5, -0.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "inventory_presentation")
  content("inventory_presentation", align(center, [Presentation]))

  rect(
    (0, -1), (3.5, -1.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "inventory_business")
  content("inventory_business", align(center, [Business logic]))

  rect(
    (0, -2), (3.5, -2.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "inventory_data")
  content("inventory_data", align(center, [Data access]))

  line((1.75, -3), (1.75, -4), mark: (start: ">", end: ">", fill: black))

  // Billing
  rect(
    (4, 1), (8, -3),
    radius: 0.1,
    fill: blue.lighten(90%),
    stroke: (paint: blue.lighten(60%)),
    name: "billing")
  content("billing.north", text: gray, align(center, [#v(3em)Billing]))

  rect(
    (4.25, 0), (7.75, -0.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "billing_presentation")
  content("billing_presentation", align(center, [Presentation]))

  rect(
    (4.25, -1), (7.75, -1.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "billing_business")
  content("billing_business", align(center, [Business logic]))

  rect(
    (4.25, -2), (7.75, -2.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "billing_data")
  content("billing_data", align(center, [Data access]))

  line((6, -3), (6, -4), mark: (start: ">", end: ">", fill: black))

  // Payment
  rect(
    (8.25, 1), (12.25, -3),
    radius: 0.1,
    fill: blue.lighten(90%),
    stroke: (paint: blue.lighten(60%)),
    name: "payment")
  content("payment.north", text: gray, align(center, [#v(3em)payment]))

  rect(
    (8.5, 0), (12, -0.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "payment_presentation")
  content("payment_presentation", align(center, [Presentation]))

  rect(
    (8.5, -1), (12, -1.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "payment_business")
  content("payment_business", align(center, [Business logic]))

  rect(
    (8.5, -2), (12, -2.75),
    radius: 0.1,
    fill: yellow.lighten(60%),
    stroke: 1pt + yellow.darken(20%),
    name: "payment_data")
  content("payment_data", align(center, [Data access]))

  line((10, -3), (10, -4), mark: (start: ">", end: ">", fill: black))
})

#v(2em)
