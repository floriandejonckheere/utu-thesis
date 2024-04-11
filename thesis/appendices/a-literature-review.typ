#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= #acr("SLR") publications <slr_publications>

#set heading(numbering: none)

#let publications = yaml("/bibliography/literature-review.yml")

== Primary studies

#let index = 0

#show figure: set block(breakable: true)
#show figure: set text(size: 9pt)
#figure(
  table(
    columns: (auto, auto, auto),
    inset: 5pt,
    stroke: (x: none),
    align: (right, left, left),
    [], [*ID*], [*Publication*],
    ..for (platform) in publications.platforms.keys() {
      let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

      for (key) in publications.platforms.at(platform).primary {
      index += 1

        (
          [*P#index*],
          [#cite(label(key))],
          [
            #text(pubs.at(key).at("title"), style: "italic"),
            #cite(label(key), form: "author")
          ],
        )
      }
    }
  ),
  caption: [Selected publications (primary studies)]
) <slr_primary_publications>

#pagebreak()

== Secondary studies

#let index = 0

#show figure: set block(breakable: true)
#show figure: set text(size: 9pt)
#figure(
  table(
    columns: (auto, auto, auto),
    inset: 5pt,
    stroke: (x: none),
    align: (right, left, left),
    [], [*ID*], [*Publication*],
    ..for (platform) in publications.platforms.keys() {
      let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

      for (key) in publications.platforms.at(platform).secondary {
      index += 1

        (
          [*P#index*],
          [#cite(label(key))],
          [
            #text(pubs.at(key).at("title"), style: "italic"),
            #cite(label(key), form: "author")
          ],
        )
      }
    }
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>
