#import "@preview/cetz:0.2.2": canvas, chart, draw

#let data = (
  yaml("/data/structural-logical-contributor.yml"),
)

#let rows = data.map(it => it.at("coupling")).enumerate(start: 1).map(x => (x: x.at(0), min: x.at(1).min, max: x.at(1).max, q1: x.at(1).q1, q2: x.at(1).q2, q3: x.at(1).q3))

#canvas({
  chart.boxwhisker(
    size: (4, 2),
    label-key: none,
    y-min: 0,
    y-max: 70,
    y-tick-step: 20,
    (..rows),
  )
})
