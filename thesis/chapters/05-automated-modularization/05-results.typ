#import "@preview/cetz:0.2.2"

=== Results and discussion

#let data = (
  ([Requirements documents#linebreak()and models], 5),
  ([Design documents], 5),
  ([Code], 23),
  ([Execution data], 8),
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
      inner-label: (content: (value, label) => [#text(white, str(value))], radius: 110%),
      outer-label: (content: "%", radius: 120%))
  }),
  caption: [SDLC artifact categories]
) <slr_artifacts_chart>
