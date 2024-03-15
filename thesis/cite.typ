// Cite first author and reference ("Author et al. [1]")
#let citeauthor = (key) => {
  let author = cite(key, form: "author", style: "apa")
  let reference = cite(key, form: "normal", style: "ieee")

  return author + " " + reference
}
