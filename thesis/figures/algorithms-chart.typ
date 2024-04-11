#import "@preview/cetz:0.2.2"

#let algorithms = yaml("/bibliography/literature-review.yml").at("categories").at("algorithms")
#let total = algorithms.values().sum().len()

#let data = (
  ([#h(6em)Evolutionary algorithms#v(2em)], algorithms.at("evolutionary").len()),
  ([#h(6em)Graph algorithms], algorithms.at("graph").len()),
  ([Other algorithms], algorithms.at("other").len()),
  ([Clustering#linebreak()algorithms#h(4em)], algorithms.at("clustering").len()),
)

#figure(
  cetz.canvas({
    import cetz.chart
    import cetz.draw: *

    let colors = gradient.linear(red, blue, green, yellow)

    chart.piechart(
      data,
      value-key: 1,
      label-key: 0,
      radius: 3,
      slice-style: colors,
      inner-radius: 1,
      inner-label: (content: (value, label) => [#text(white, str(calc.round(100 * value / total, digits: 0)) + "%")], radius: 110%),
      outer-label: (content: (value, label) => [#label], radius: 120%))
  }),
  caption: [SDLC algorithm categories]
) <slr_algorithms_chart>
