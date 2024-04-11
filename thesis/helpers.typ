// Cite first author and reference ("Author et al. [1]")
#let citeauthor = (key) => {
  // ASA: Abgaz et al.
  let author = cite(key, form: "author", style: "american-sociological-association")

  // IEEE: [1]
  let reference = cite(key, form: "normal", style: "ieee")

  return author + " " + reference
}

// Titleize a string
#let title(string) = {
  return string.replace(
    regex("[A-Za-z]+('[A-Za-z]+)?"),
    word => upper(word.text.first()) + lower(word.text.slice(1)),
  )
}

// Literature review
#let slr_categories = yaml("/bibliography/literature-review.yml").at("categories")
#let artifacts = slr_categories.at("artifacts")
#let algorithms = slr_categories.at("algorithms")
#let metrics = slr_categories.at("metrics")

#let total = (category) => category.values().sum().len()
#let count = (category, item) => category.at(item).len()
#let percentage = (category, item) => [#calc.round((100 * count(category, item) / total(category)), digits: 1)%]
