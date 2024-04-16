#import "@preview/acrostiche:0.3.1": *

#import "/helpers/cite.typ": *
#import "/helpers/slr.typ": *

= #acr("SLR") publications <slr_publications>

#set heading(numbering: none)

== Primary studies

#let index = 0

#show figure: set block(breakable: true)
#show figure: set text(size: 9pt)
#figure(
  table(
    columns: (auto, auto),
    inset: 5pt,
    stroke: (x: none),
    align: (right, left),
    [*ID*], [*Publication*],
    ..for (platform) in publications.platforms.keys() {
      let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

      for (key) in publications.platforms.at(platform).primary {
        index += 1

        (
          [*#ref(label("slr_" + key))*],
          [
            #slr_reference(
              [
                #slr_cite_authors(label(key)),
                #text(pubs.at(key).at("title"), style: "italic"),
                #str(pubs.at(key).at("date")).split("-").first()
              ],
              "slr_" + key,
            )
          ],
        )
      }
    }
  ),
  caption: [Selected publications (primary studies)]
) <slr_primary_publications>

== Secondary studies

#let index = 0

#show figure: set block(breakable: true)
#show figure: set text(size: 9pt)
#figure(
  table(
    columns: (auto, auto),
    inset: 5pt,
    stroke: (x: none),
    align: (right, left),
    [*ID*], [*Publication*],
    ..for (platform) in publications.platforms.keys() {
      let pubs = yaml("/bibliography/literature-review/" + platform + ".yml")

      for (key) in publications.platforms.at(platform).secondary {
        index += 1

        (
          [*#ref(label("slr_" + key))*],
          [
            #slr_reference(
              [
                #slr_cite_authors(label(key)),
                #text(pubs.at(key).at("title"), style: "italic"),
                #str(pubs.at(key).at("date")).split("-").first()
              ],
              "slr_" + key,
            )
          ],
        )
      }
    }
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>
