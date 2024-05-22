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

#canvas(length: .75cm, {
  let colors = (
    cmyk(0%, 75%, 79%, 0%),
    cmyk(0%, 32%, 23%, 26%),
    cmyk(29%, 26%, 0%, 28%),
    cmyk(80%, 29%, 0%, 20%),
    cmyk(65%, 0%, 2%, 35%),
    cmyk(64%, 0%, 38%, 24%),
    cmyk(34%, 0%, 60%, 18%),
    cmyk(8%, 0%, 68%, 15%),
  )

  chart.piechart(
    data,
    clockwise: false,
    value-key: 1,
    label-key: 0,
    radius: 3,
    slice-style: colors,
    inner-radius: 1,
    inner-label: (content: (value, label) => if value > 12 [#text(size: 10pt, white, str(calc.round(100 * value / total, digits: 0)) + "%")] else [], radius: 100%),
    outer-label: (content: (value, label) => if value <= 12 and value > 1 [#text(size: 9pt, str(calc.round(100 * value / total, digits: 0)) + "%")] else [], radius: 120%))
})
