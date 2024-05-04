#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Systematic Literature Review publications <slr_publications>

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
    ..for (platform) in slr.platforms.keys() {
      for (key) in slr.platforms.at(platform).primary {
        (
          [*#ref(label(key))*],
          [
            #slr_reference(
              [
                #cite_author(label(key)),
                #text(slr_bibliography.at(key).at("title"), style: "italic"),
                #str(slr_bibliography.at(key).at("date")).split("-").first()
              ],
              key,
            )
          ],
        )
      }
    },
    ..for (key) in slr.snowballing.primary {
      (
        [*#ref(label(key))*],
        [
          #slr_reference(
            [
              #cite_author(label(key)),
              #text(slr_bibliography.at(key).at("title"), style: "italic"),
              #str(slr_bibliography.at(key).at("date")).split("-").first()
            ],
            key,
          )
        ],
      )
    }
  ),
  caption: [Selected publications (primary studies)],
  kind: "appendix",
  supplement: "Table"
) <slr_primary_publications>

#pagebreak()

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
    ..for (platform) in slr.platforms.keys() {
      for (key) in slr.platforms.at(platform).secondary {
        (
          [*#ref(label(key))*],
          [
            #slr_reference(
              [
                #cite_author(label(key)),
                #text(slr_bibliography.at(key).at("title"), style: "italic"),
                #str(slr_bibliography.at(key).at("date")).split("-").first()
              ],
              key,
            )
          ],
        )
      }
    },
    ..for (key) in slr.snowballing.secondary {
      (
        [*#ref(label(key))*],
        [
          #slr_reference(
            [
              #cite_author(label(key)),
              #text(slr_bibliography.at(key).at("title"), style: "italic"),
              #str(slr_bibliography.at(key).at("date")).split("-").first()
            ],
            key,
          )
        ],
      )
    }
  ),
  caption: [Selected publications (secondary studies)],
  kind: "appendix",
  supplement: "Table"
) <slr_secondary_publications>
