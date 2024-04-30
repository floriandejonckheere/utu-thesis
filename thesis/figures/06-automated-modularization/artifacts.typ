#import "@preview/cetz:0.2.2"

#let artifacts = yaml("/bibliography/literature-review.yml").at("categories").at("artifacts")
#let total = artifacts.values().sum().len()

#let data = (
  ([Codebase#h(2em)], artifacts.at("codebase").len()),
  ([#h(4em)Execution data], artifacts.at("execution").len()),
  ([#h(8em)Requirements documents\ #h(11em)and models], artifacts.at("requirements").len()),
  ([#h(5em)Design documents], artifacts.at("design").len()),
)

#cetz.canvas(length: .75cm, {
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
    inner-label: (content: (value, label) => [#text(size: 10pt, white, str(calc.round(100 * value / total, digits: 0)) + "%")], radius: 110%),
    outer-label: (content: (value, label) => [#label], radius: 130%))
})
