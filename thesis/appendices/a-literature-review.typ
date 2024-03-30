#import "@preview/acrostiche:0.3.1": *

= #acr("SLR") publications <slr_publications>

#set heading(numbering: none)

#let publications = yaml("/bibliography/literature-review.yml")

== Primary studies

#show figure: set block(breakable: true)
#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (right, left),
    [], [*Publication*],
    ..for (i, key) in publications.platforms.values().map((p) => p.primary).flatten().enumerate() {
      (
        [#(i + 1)],
        cite(label(key), form: "full"),
      )
    }
  ),
  caption: [Selected publications (primary studies)]
) <slr_primary_publications>

#pagebreak()

== Secondary studies

#show figure: set block(breakable: true)
#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (right, left),
    [], [*Publication*],
    ..for (i, key) in publications.platforms.values().map((p) => p.secondary).flatten().enumerate() {
      (
        [#(i + 1)],
        cite(label(key), form: "full"),
      )
    }
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>
