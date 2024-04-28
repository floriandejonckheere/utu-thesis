#import "@preview/cetz:0.2.2": canvas, chart, draw

#let statistics_chart = (key, ytickstep) => [
  #let data = (
    (<scn_structural_logical>, yaml("/data/structural_logical.yml")),
    (<scn_structural_contributor>, yaml("/data/structural_contributor.yml")),
    (<scn_logical_contributor>, yaml("/data/logical_contributor.yml")),
    (<scn_structural_logical_contributor>, yaml("/data/structural_logical_contributor.yml")),
  )

  #(
    let rows = data
      .enumerate(start: 1)
      .map(x => (
        label: link(x.at(1).at(0))[[S#x.at(0)]],
        x: x.at(0),
        min: x.at(1).at(1).at(key).min,
        max: x.at(1).at(1).at(key).max,
        q1: x.at(1).at(1).at(key).q1,
        q2: x.at(1).at(1).at(key).q2,
        q3: x.at(1).at(1).at(key).q3,
      )
    )
  )

  #let ymin = calc.min(..rows.map(x => x.min))
  #let ymax = calc.max(..rows.map(x => x.max))

  #canvas(length: .75cm, {
    chart.boxwhisker(
      size: (6, 4),
      label-key: "label",
      y-min: (ymin - (ytickstep / 2)),
      y-max: (ymax + (ytickstep / 2)),
      y-tick-step: ytickstep,
      (..rows),
    )
  })
]
