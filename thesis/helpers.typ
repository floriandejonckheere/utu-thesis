// Helpers for systematic literature review
#let total = (category) => category.values().sum().len()
#let count = (category, item) => category.at(item).len()
#let percentage = (category, item) => [#calc.round((100 * count(category, item) / total(category)), digits: 1)%]

#let slr = yaml("/bibliography/literature-review.yml")
#let artifacts = slr.at("categories").at("artifacts")
#let algorithms = slr.at("categories").at("algorithms")
#let metrics = slr.at("categories").at("metrics")

#let bibliography = (
  "01-introduction",
  "02-methodology",
  "03-background",
  "04-related-work",
  "05-modular-monolith",
  "06-automated-modularization",
  "07-proposed-solution",
  "08-case-study",
  "09-conclusion",
).map(c => yaml("/bibliography/" + c + ".yml")).fold({}, (a, b) => a + b)

#let slr_bibliography = yaml("/bibliography/literature-review/acm.yml") + yaml("/bibliography/literature-review/ieee.yml") + yaml("/bibliography/literature-review/snowballing.yml")

// Create a reference to a paper
#let slr_reference = ((t, l) => [
  #show figure.where(kind: "paper"): set block(breakable: false)
  #figure(
    box(width: 100%)[#align(left)[#t]],
    kind: "paper",
    supplement: none,
    numbering: (..nums) => "[P" + nums.pos().map(str).join("") + "]",
  )
  #label(l)
])

// Find a reference in the bibliography
#let entry = (key) => {
  if (slr_bibliography.at(str(key), default: none) != none) {
    slr_bibliography.at(str(key))
  } else {
    bibliography.at(str(key))
  }
}

// Cite a paper (author)
#let cite_author = (key) => {
  let names = entry(key).at("author").map(a => a.split(", ").at(0))

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

// Cite a paper (author and reference)
#let cite_full = (key) => {
  let names = entry(key).at("author").map(a => a.split(", ").at(0))

  if (names.len() == 1) {
    names.at(0) + " " + ref(key)
  } else if (names.len() == 2) {
    names.at(0) + " and " + names.at(1) + " " + ref(key)
  } else {
    names.at(0) + " et al. " + ref(key)
  }
}

// Create a reference to a scenario
#let scn_reference = ((t, l) => [
  #show figure.where(kind: "scenario"): set block(breakable: false)
  #figure(
    box(width: 100%)[#align(left)[#text(weight: "thin", t)]],
    kind: "scenario",
    supplement: "Scenario",
    numbering: (..nums) => "[S" + nums.pos().map(str).join("") + "]",
  )
  #label(l)
])
