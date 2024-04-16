// Helpers for systematic literature review
#let slr_categories = yaml("/bibliography/literature-review.yml").at("categories")
#let artifacts = slr_categories.at("artifacts")
#let algorithms = slr_categories.at("algorithms")
#let metrics = slr_categories.at("metrics")

#let total = (category) => category.values().sum().len()
#let count = (category, item) => category.at(item).len()
#let percentage = (category, item) => [#calc.round((100 * count(category, item) / total(category)), digits: 1)%]

#let publications = yaml("/bibliography/literature-review.yml")

// Cite a paper
#let slr_cite_full = (platform, key) => {
  let names = platform.at(key).at("author").map(a => a.split(", ").at(1).first() + ". " + a.split(", ").at(0))

  if (names.len() == 1) {
    names.at(0)
  } else if (names.len() == 2) {
    names.at(0) + " and " + names.at(1)
  } else if (names.len() == 3) {
    names.at(0) + ", " + names.at(1) + " and " + names.at(2)
  } else {
    names.at(0) + " et al."
  }

}
