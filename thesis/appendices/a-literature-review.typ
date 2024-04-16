#import "@preview/acrostiche:0.3.1": *

#import "/helpers/cite.typ": *
#import "/helpers/slr.typ": *

= #acr("SLR") publications <slr_publications>

#set heading(numbering: none)

== Primary studies

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
      for (key) in publications.platforms.at(platform).primary {
        (
          [*#ref(label(key))*],
          [
            #slr_reference(
              [
                #slr_cite_authors(label(key)),
                #text(slr_bibliography.at(key).at("title"), style: "italic"),
                #str(slr_bibliography.at(key).at("date")).split("-").first()
              ],
              key,
            )
          ],
        )
      }
    },
    ..for (key) in publications.snowballing.primary {
      (
        [*#ref(label(key))*],
        [
          #slr_reference(
            [
              #slr_cite_authors(label(key)),
              #text(slr_bibliography.at(key).at("title"), style: "italic"),
              #str(slr_bibliography.at(key).at("date")).split("-").first()
            ],
            key,
          )
        ],
      )
    }
  ),
  caption: [Selected publications (primary studies)]
) <slr_primary_publications>

== Secondary studies

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
      for (key) in publications.platforms.at(platform).secondary {
        (
          [*#ref(label(key))*],
          [
            #slr_reference(
              [
                #slr_cite_authors(label(key)),
                #text(slr_bibliography.at(key).at("title"), style: "italic"),
                #str(slr_bibliography.at(key).at("date")).split("-").first()
              ],
              key,
            )
          ],
        )
      }
    },
    ..for (key) in publications.snowballing.secondary {
      (
        [*#ref(label(key))*],
        [
          #slr_reference(
            [
              #slr_cite_authors(label(key)),
              #text(slr_bibliography.at(key).at("title"), style: "italic"),
              #str(slr_bibliography.at(key).at("date")).split("-").first()
            ],
            key,
          )
        ],
      )
    }
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>
