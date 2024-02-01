// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "", subtitle: "", abstract: [], authors: (), date: none, logo: none, body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title page.
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

  // Author information.
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

  // Abstract page.
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

  // Main body.
  set par(justify: true)

  body
}