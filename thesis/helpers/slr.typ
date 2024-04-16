// Helpers for systematic literature review
#let slr_categories = yaml("/bibliography/literature-review.yml").at("categories")
#let artifacts = slr_categories.at("artifacts")
#let algorithms = slr_categories.at("algorithms")
#let metrics = slr_categories.at("metrics")

#let total = (category) => category.values().sum().len()
#let count = (category, item) => category.at(item).len()
#let percentage = (category, item) => [#calc.round((100 * count(category, item) / total(category)), digits: 1)%]
