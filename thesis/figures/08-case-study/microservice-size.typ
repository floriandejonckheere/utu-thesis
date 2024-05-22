#import "@preview/cetz:0.2.2": canvas, chart, draw

#let microservice_size_chart = (key) => [
  #let data = yaml("/data/" + key + ".yml").at("clusters").at("size").sorted().rev().enumerate(start: 1).map(x => (str(x.at(0)), x.at(1)))

  #let total = data.map(p => p.at(1)).sum()

  #canvas(length: .75cm, {
    let colors = (
      cmyk(0%, 75%, 79%, 0%),
      cmyk(0%,54%, 52%, 11%),
      cmyk(0%,36%, 28%, 24%),
      cmyk(0%,20%, 5%, 36%),
      cmyk(17%,22%, 0%, 32%),
      cmyk(42%,30%, 0%, 24%),
      cmyk(85%,40%, 0%, 15%),
      cmyk(78%,25%, 0%, 22%),
      cmyk(71%,11%, 0%, 29%),
      cmyk(65%,0%, 2%, 35%),
      cmyk(70%,0%, 17%, 30%),
      cmyk(65%,0%, 33%, 25%),
      cmyk(62%,0%, 55%, 20%),
      cmyk(41%,0%, 58%, 18%),
      cmyk(27%,0%, 62%, 17%),
      cmyk(16%,0%, 65%, 16%),
      cmyk(6%,0%, 70%, 15%),
      cmyk(0%,4%, 79%, 10%),
    )

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
