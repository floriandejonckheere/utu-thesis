#import "@preview/cetz:0.2.2"

#let data = (
  ([Developer A], 148),
  ([Developer B], 109),
  ([Developer C], 27),
  ([Developer D], 15),
  ([Developer E], 12),
  ([Developer F], 8),
  ([Developer G], 7),
  ([Developer H], 5),
  ([Developer I], 1),
)

#let total = data.map(p => p.at(1)).sum()

#cetz.canvas({
  import cetz.chart
  import cetz.draw: *

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
