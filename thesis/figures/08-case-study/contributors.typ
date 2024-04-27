#import "@preview/cetz:0.2.2": canvas, chart, draw

#let data = (
  ([Developer A], 139),
  ([Developer B], 83),
  ([Developer C], 15),
  ([Developer D], 14),
  ([Developer E], 8),
  ([Developer F], 7),
  ([Developer G], 6),
  ([Developer H], 5),
  ([Developer I], 1),
  ([Developer J], 1),
)

#let total = data.map(p => p.at(1)).sum()

#canvas({
  let colors = gradient.linear(red, blue, green, yellow)

  chart.piechart(
    data,
    clockwise: false,
    value-key: 1,
    label-key: 0,
    radius: 3,
    slice-style: colors,
    inner-radius: 1,
    inner-label: (content: (value, label) => if value > 12 [#text(white, str(calc.round(100 * value / total, digits: 0)) + "%")] else [], radius: 110%),
    outer-label: (content: (value, label) => if value <= 12 and value > 1 [#text(size: 10pt, str(calc.round(100 * value / total, digits: 0)) + "%")] else [], radius: 120%))
})
