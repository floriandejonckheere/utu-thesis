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

  // Unit
  unit: "",

  // author
  author: "",

  // Date of publication
  date: none,

  // Institution logo (SVG)
  logo-file: none,

  // Bibliography
  bibliographies: none,

  // Abstract
  abstract: [],

  // Keywords
  keywords: (),

  // Acronyms
  acronyms: (),

  // Chapters
  chapters: (),

  // Appendix
  appendix: (),

  // Document contents
  body,
) = {
  // Basic properties
  set document(author: author, title: title)
  set page(margin: 35mm)
  set block(spacing: 1.5em)
  set par(leading: 1.2em)
  set text(size: 12pt, font: "New Computer Modern", lang: "en", region: "FI", hyphenate: false)
  set math.equation(numbering: "(1)")

  // Add some space above and below paragraphs
  show par: set block(below: 2em)

  // Add some space above and below headings
  show heading: set block(above: 2em, below: 1.5em)
  show heading: set par(justify: false)
  show heading.where(
    level: 1
  ): it => {
      v(3em)
      text(1.5em)[
        #if it.numbering != none [
          #box(width: 1.5em)[
            #counter(heading).display()
          ]
        ]
        #it.body
      ]
      v(2em)
  }
  show heading.where(
    level: 2
  ): it => {
      v(1em)
      text(1.2em, it)
  }

  // Hide numbering for deeply nested sections
  show heading.where(level: 4): it => [#block(it.body)]

  // Set gap between figure and caption
  set figure(gap: 1em)
  // Set space above and below figures and tables
  show figure: set block(above: 3em, below: 3em)

  // Don't justify table content
  show table: set par(justify: false)

  set bibliography(full: true, title: [References])

  // Set page numbering to letters (but hide in footer)
  set page(numbering: "a", footer: [])

  // Count total pages
  let total_pages = locate(loc => {
    // Get the page counter at the first bibliography page, then subtract one
    counter(page)
      .at(query(bibliography, loc).first().location())
      .first() - 1
  })

  // Count total appendix pages
  let appendix_pages = locate(loc => {
    // Get the sum of the page counters at the end of the appendix pages (where the <end_of_appendix> metadata is located)
    query(<end_of_appendix>, loc)
      .map(l => counter(page).at(l.location()).sum())
      .sum()
  })

  // Initialize acronyms
  init-acronyms(acronyms)

  // Title page
  if logo-file != none {
    align(left, image(logo-file, width: 7cm))
  }
  v(3fr)

  align(right, text(1.9em, title))
  v(5fr)

  align(
    right,
  )[
    #par(leading: 0.6em)[
      #text(1em, smallcaps(institution)) \
      #text(0.9em, department) \
      #text(0.9em, subtitle) \
      #text(0.9em, unit) \
      #text(0.9em, date) \
      #text(0.9em, author) \
    ]
  ]

  v(2fr)
  align(
    center,
    par(leading: 0.6em, justify: true)[
      #text(
        "The originality of this thesis has been checked in accordance with the University of Turku quality assurance system using the Turnitin OriginalityCheck service.",
        size: 0.7em,
        hyphenate: false
      )
    ]
  )
  pagebreak()

  // Abstract
  par(
    leading: 0.6em,
  )[
    #upper(institution) \
    #department
    #v(0.6em)
    #smallcaps(author): #title
    #v(0.6em)
    #subtitle, #total_pages p., #appendix_pages app. p. \
    #unit \
    #date
  ]

  line(length: 100%)
  par(
    leading: 0.6em,
    justify: true,
  )[
    #abstract
  ]

  linebreak()

  par(
    leading: 0.6em,
    justify: false,
  )[
    #v(1.5em)
    *Keywords*: #keywords.join(", ")
  ]

  pagebreak()

  // Table of contents
  set heading(numbering: "1.1", supplement: "Chapter")

  // Set page numbering to Roman numerals (and show in footer)
  set page(numbering: "i", footer: none)
  counter(page).update(1)

  show outline.entry.where(
    level: 1
  ): it => {
    v(0.5em)
    strong(it)
  }

  outline(indent: auto, depth: 3)

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

  // List of algorithms
  outline(
    title: [List of Algorithms],
    target: figure.where(kind: "algorithm"),
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

  // Main document
  for chapter in chapters {
    include "chapters/" + chapter + ".typ"

    pagebreak()
  }

  // Bibliography

  // Hide page number
  set page(footer: [])

  bibliography(bibliographies.map(b => "bibliography/" + b + ".yml"), style: "ieee")

  // Appendix
  set heading(numbering: "A", supplement: "Appendix", outlined: false)
  counter(heading).update(0)

  // Show page number
  set page(numbering: none, footer: [
    #align(center,
      counter(heading).display() + "-" + counter(page).display()
    )
  ])

  for app in appendix {
    pagebreak()

    // Reset appendix counter
    counter(page).update(1)

    include "appendices/" + app + ".typ"

    [#metadata("") <end_of_appendix>]
  }
}
