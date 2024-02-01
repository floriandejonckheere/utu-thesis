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
  logo-file: none,

  // Bibliography
  bibliography-file: none,

  // Abstract
  abstract: [],

  // Document contents
  body,
) = {
  // Basic properties
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center, margin: 7em)
  set par(leading: 1.1em, justify: true)
  set text(font: "New Computer Modern", size: 11pt)
  set bibliography(full: true, style: "apa", title: [References])

  show par: set block(spacing: 2em)
  show heading: set block(above: 1.4em, below: 1.5em)

  // Title page
  v(0.6fr)
  if logo-file != none {
    align(right, image(logo-file, width: 40%))
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
  show raw: set text(font: "New Computer Modern Mono")
  show par: set block(spacing: 0.55em)
  show heading: set block(above: 1.4em, below: 1em)

  body

  // Bibliography
  show bibliography: pad.with(x: 0.5pt)
  set par(first-line-indent: 0em)
  bibliography(bibliography-file)
}