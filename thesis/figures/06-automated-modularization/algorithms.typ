#import "@preview/cetz:0.2.2"

#let algorithms = yaml("/bibliography/literature-review.yml").at("categories").at("algorithms")
#let total = algorithms.values().sum().len()

#let data = (
  ([Clustering#linebreak()algorithms#v(8em)], algorithms.at("clustering").len()),
  ([Other algorithms], algorithms.at("other").len()),
  ([#h(5em)Evolutionary\ #h(5em)algorithms#v(2em)], algorithms.at("evolutionary").len()),
  ([#h(6em)Graph algorithms], algorithms.at("graph").len()),
)

#cetz.canvas(length: .75cm, {
  import cetz.chart
  import cetz.draw: *

  let colors = (
    cmyk(0%, 75%, 79%, 0%),
    cmyk(23%, 26%, 0%, 28%),
    cmyk(65%, 0%, 2%, 35%),
    cmyk(34%, 0%, 60%, 18%),
  )

  chart.piechart(
    data,
    clockwise: false,
    value-key: 1,
    label-key: 0,
    radius: 3,
    slice-style: colors,
    inner-radius: 1,
    inner-label: (content: (value, label) => [#text(size: 10pt, white, str(calc.round(100 * value / total, digits: 0)) + "%")], radius: 110%),
    outer-label: (content: (value, label) => [#label], radius: 120%))
})
