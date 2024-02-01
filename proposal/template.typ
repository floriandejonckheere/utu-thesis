#let template(
  // Document title
  title: "",

  // Document subtitle
  subtitle: "",

  // List of authors
  authors: (),

  // Date of publication
  date: none,

  // Institution logo (SVG)
  logo: none,

  // Abstract
  abstract: [],

  // Document contents
  body,
) = {
  // Basic properties
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title page
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 40%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)
  linebreak()
  text(1em, subtitle)

  // Author
  pad(
    top: 0.7em, right: 20%, grid(
      columns: (1fr,) * calc.min(3, authors.len()), gutter: 1em, ..authors.map(author => align(start)[
        *#author.name* \
        #link("mailto:" + author.email)[#author.email]
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()

  // Abstract
  v(1fr)
  align(
    left,
  )[
    #set par(justify: true)
    #heading(outlined: false, numbering: none, text(0.85em, smallcaps[Abstract]))
    #abstract
  ]
  v(1.618fr)
  pagebreak()

  // Main document
  set par(justify: true)

  body
}