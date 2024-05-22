#import "@preview/cetz:0.2.2"

#let metrics = yaml("/bibliography/literature-review.yml").at("categories").at("metrics")
#let total = metrics.values().sum().len()

#let data = (
  ([Cohesion], metrics.at("cohesion").len()),
  ([Coupling], metrics.at("coupling").len()),
  ([Other], metrics.at("other").len()),
  ([#v(1em)#h(3em)Modularity], metrics.at("modularity").len()),
  ([#v(1em)#h(7em)Network overhead], metrics.at("overhead").len()),
  ([#v(2em)#h(4em)Complexity], metrics.at("complexity").len()),
  ([#v(2.75em)#h(3em)None], metrics.at("none").len()),
  ([#v(2em)#h(9em)Resource usage], metrics.at("resource").len()),
)

#cetz.canvas({
  import cetz.chart
  import cetz.draw: *

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
    inner-label: (content: (value, label) => [#text(white, str(calc.round(100 * value / total, digits: 0)) + "%")], radius: 110%),
    outer-label: (content: (value, label) => [#label], radius: 130%))
})
