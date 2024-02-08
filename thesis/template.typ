#let template(
  // Document title
  title: "",

  // Document subtitle
  subtitle: "",

  // Institution
  institution: "",

  // Department
  department: "",

  // author
  author: "",

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
  set document(author: author, title: title)
  set page(margin: 7em)
  set par(leading: 1.1em, justify: true)
  set bibliography(full: true, style: "apa", title: [References])

  show par: set block(spacing: 2em)
  show heading: set block(above: 1.4em, below: 1.5em)

  // Title page
  v(0.6fr)
  if logo-file != none {
    align(right, image(logo-file, width: 40%))
  }
  v(3fr)

  align(center, text(2.5em, title))
  v(5fr)

  align(
    right,
  )[
    #text(1.2em, smallcaps(institution))
    #linebreak()
    #text(1.1em, department)
    #linebreak()
    #text(1.1em, subtitle)
    #linebreak()
    #text(1.1em, date)
    #linebreak()
    #text(1.1em, author)
  ]

  v(1.4fr)
  align(
    center,
    text(
      0.75em,
      "The originality of this thesis has been checked in accordance with the University of Turku quality assurance\ system using the Turnitin OriginalityCheck service.",
    )
  )
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
  set page(numbering: "1", number-align: center)
  counter(page).update(1)

  show raw: set text(font: "New Computer Modern Mono")
  show par: set block(spacing: 0.55em)
  show heading: set block(above: 1.4em, below: 1em)

  body

  // Bibliography
  show bibliography: pad.with(x: 0.5pt)
  set par(first-line-indent: 0em)
  bibliography(bibliography-file)
}