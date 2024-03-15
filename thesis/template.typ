#import "@preview/acrostiche:0.3.1": *

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

  // Keywords
  keywords: (),

  // Acronyms
  acronyms: (),

  // Document contents
  body,
) = {
  // Basic properties
  set document(author: author, title: title)
  set page(margin: 7em)
  set par(leading: 1.1em, justify: true)
  set bibliography(full: true, title: [References])

  // Set page numbering to letters (but hide in footer)
  set page(numbering: "a", footer: [])

  show par: set block(spacing: 2em)
  show heading: set block(above: 1.4em, below: 1.5em)

  // TODO: count total number of pages and appendix pages
  let pages = 4
  let appendix_pages = 4

  // Initialize acronyms
  init-acronyms(acronyms)

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
      "The originality of this thesis has been checked in accordance with the University of Turku quality assurance system using the Turnitin OriginalityCheck service.",
      size: 0.75em,
      hyphenate: false
    )
  )
  pagebreak()

  // Abstract
  par(
    leading: 0.6em,
  )[
    #upper(institution) \
    #department
  ]

  smallcaps(author)
  ": "
  title

  par(
    leading: 0.6em,
  )[
    #subtitle, #pages p., #appendix_pages app. p. \
    #department \
    #date
  ]

  line(length: 100%)
  abstract

  linebreak()

  v(1.5em)
  strong("Keywords: ")
  keywords.join(", ")

  pagebreak()

  // Table of contents
  set heading(numbering: "1.", supplement: "Chapter")

  // Set page numbering to Roman numerals (and show in footer)
  set page(numbering: "i", footer: none)
  counter(page).update(1)

  show outline.entry.where(
    level: 1
  ): it => {
    v(0.5em)
    strong(it)
  }

  outline(indent: auto)

  pagebreak()

  // List of figures
  outline(
    title: [List of Figures],
    target: figure.where(kind: image),
  )

  pagebreak()

  // List of tables
  outline(
    title: [List of Tables],
    target: figure.where(kind: table),
  )

  pagebreak()

  // List of acronyms
  heading(outlined: false, numbering: none)[List of Acronyms]

  grid(
    columns: (1fr, 9fr),
    gutter: 1em,
    ..acronyms.keys().map(key => (strong(key), acronyms.at(key))).flatten()
  )

  pagebreak()

  // Main document
  set par(justify: true)

  // Set page number to Arabic numerals
  set page(numbering: "1")
  counter(page).update(1)

  show raw: set text(font: "New Computer Modern Mono")
  show par: set block(spacing: 0.55em)
  show heading: set block(above: 1.4em, below: 1em)

  body

  pagebreak()

  // Bibliography
  set par(first-line-indent: 0em)

  // Hide page number
  set page(footer: [])

  bibliography(bibliography-file, style: "ieee")
}
