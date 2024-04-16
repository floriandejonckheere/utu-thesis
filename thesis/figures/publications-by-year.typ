#import "@preview/cetz:0.2.2": canvas, chart, draw

#let publications = yaml("/bibliography/literature-review.yml")

#let publications_by_year = (
  "2014": 0,
  "2015": 0,
  "2016": 0,
  "2017": 0,
  "2018": 0,
  "2019": 0,
  "2020": 0,
  "2021": 0,
  "2022": 0,
  "2023": 0,
  "2024": 0,
)

#for (platform) in publications.platforms.keys() {
  let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

  for (key) in publications.platforms.at(platform).primary {
    let year = str(pubs.at(key).date).split("-").first()

    publications_by_year.insert(year, publications_by_year.at(year) + 1)
  }
}

#canvas({
  chart.columnchart(
    size: (14, 3),
    y-tick-step: 2,
    publications_by_year.pairs(),
  )
})
