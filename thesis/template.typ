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

  // TODO: count total number of pages and appendix pages
  let pages = 4
  let appendix_pages = 4

  // TODO: automatically extract acronyms
  let acronyms = (
    API: "Application Programming Interface",
    UI: "User Interface",
  )

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
  par(
    leading: 0.5em,
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
  "Keywords: "
  keywords.join(", ")

  pagebreak()

  // Table of contents
  set heading(numbering: "1.")

  set page(numbering: "i")
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
  set page(numbering: "1")
  counter(page).update(1)

  show raw: set text(font: "New Computer Modern Mono")
  show par: set block(spacing: 0.55em)
  show heading: set block(above: 1.4em, below: 1em)

  body

  pagebreak()

  // Bibliography
  show bibliography: pad.with(x: 0.5pt)
  set par(first-line-indent: 0em)
  bibliography(bibliography-file)
}