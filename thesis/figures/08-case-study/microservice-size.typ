#import "@preview/cetz:0.2.2": canvas, chart, draw

#let microservice_size_chart = (key) => [
  #let data = yaml("/data/" + key + ".yml").at("clusters").at("size").sorted().rev().enumerate(start: 1).map(x => (str(x.at(0)), x.at(1)))

  #let total = data.map(p => p.at(1)).sum()

  #canvas(length: .75cm, {
    let colors = gradient.linear(red, blue, green, yellow)

    chart.piechart(
      data,
      clockwise: false,
      value-key: 1,
      label-key: 0,
      radius: 3,
      slice-style: colors,
      inner-radius: 1,
      inner-label: (content: (value, label) => if value > 2 [#text(white, str(value))] else [], radius: 100%),
//      outer-label: (content: none),
      outer-label: (content: (value, label) => if value < 3 [#text(size: 8pt, str(value))] else [], radius: 110%)
    )
  })
]
