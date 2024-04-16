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

        let names = pubs.at(key).at("author").map(a => a.split(", ").at(1).first() + ". " + a.split(", ").at(0))

        (
          [*P#index*],
          [#cite(label(key))],
          [
            #text(pubs.at(key).at("title"), style: "italic"),
            #if (names.len() == 1) {
              names.at(0)
            } else if (names.len() == 2) {
              names.at(0) + " and " + names.at(1)
            } else if (names.len() == 3) {
              names.at(0) + ", " + names.at(1) + " and " + names.at(2)
            } else {
              names.at(0) + " et al."
            }
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

        let names = pubs.at(key).at("author").map(a => a.split(", ").at(1).first() + ". " + a.split(", ").at(0))

        (
          [*P#index*],
          [#cite(label(key))],
          [
            #text(pubs.at(key).at("title"), style: "italic"),
            #if (names.len() == 1) {
              names.at(0)
            } else if (names.len() == 2) {
              names.at(0) + " and " + names.at(1)
            } else if (names.len() == 3) {
              names.at(0) + ", " + names.at(1) + " and " + names.at(2)
            } else {
              names.at(0) + " et al."
            }
          ],
        )
      }
    }
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>
