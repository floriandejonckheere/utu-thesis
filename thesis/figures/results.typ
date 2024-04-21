#import "@preview/cetz:0.2.2": canvas, chart, draw

#let results_chart = (key) => [
  #let data = (
    (<scn_structural>, yaml("/data/structural.yml")),
    (<scn_logical>, yaml("/data/logical.yml")),
    (<scn_contributor>, yaml("/data/contributor.yml")),
    (<scn_structural_logical>, yaml("/data/structural-logical.yml")),
    (<scn_structural_contributor>, yaml("/data/structural-contributor.yml")),
    (<scn_logical_contributor>, yaml("/data/logical-contributor.yml")),
    (<scn_structural_logical_contributor>, yaml("/data/structural-logical-contributor.yml")),
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
  #let ytickstep = (ymax - ymin) / 5

  #canvas({
    chart.boxwhisker(
      size: (6, 3),
      label-key: "label",
      y-min: (ymin - ytickstep),
      y-max: (ymax + ytickstep),
      y-tick-step: ytickstep,
      (..rows),
    )
  })
]
