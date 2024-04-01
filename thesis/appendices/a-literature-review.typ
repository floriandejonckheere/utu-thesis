#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": citeauthor

= #acr("SLR") publications <slr_publications>

#set heading(numbering: none)

#let publications = yaml("/bibliography/literature-review.yml")

== Primary studies

#let index = 0

#show figure: set block(breakable: true)
#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (right, left),
    [], [*Publication*],
    ..for (platform) in publications.platforms.keys() {
      let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

      for (key) in publications.platforms.at(platform).primary {
      index += 1

        (
          [#index],
          [
            #text(pubs.at(key).at("title"), style: "italic"),
            #citeauthor(label(key))
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
#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (right, left),
    [], [*Publication*],
    ..for (platform) in publications.platforms.keys() {
      let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

      for (key) in publications.platforms.at(platform).secondary {
      index += 1

        (
          [#index],
          [
            #text(pubs.at(key).at("title"), style: "italic"),
            #citeauthor(label(key))
          ],
        )
      }
    }
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>
