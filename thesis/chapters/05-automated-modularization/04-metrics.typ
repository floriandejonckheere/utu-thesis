#import "@preview/acrostiche:0.3.1": *

#import "/cite.typ": citeauthor

=== Metrics

The quality metrics used to determine the performance and efficacy of the algorithm are described in @slr_metrics.
// TODO: focus on evaluation metrics instead of performance metrics used in the algorithms

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (left, left),
    [*Metric*], [*Publications*],
    "Cohesion",
    [
      @amiri_2018
      @zhang_etal_2020
      @al_debagy_martinek_2020
      @selmadji_etal_2020
      @carvalho_etal_2020
      @daoud_etal_2020
      @bandara_perera_2020
      @filippone_etal_2021
      @jin_etal_2021
      @zhou_xiong_2022
      @zaragoza_etal_2022
      @santos_silva_2022
      @filippone_etal_2023
      @lourenco_silva_2023
      @li_etal_2023
      @quattrocchi_etal_2024
    ],

    "Coupling",
    [
      @amiri_2018
      @zhang_etal_2020
      @selmadji_etal_2020
      @carvalho_etal_2020
      @daoud_etal_2020
      @bandara_perera_2020
      @filippone_etal_2021
      @agarwal_etal_2021
      @jin_etal_2021
      @zhou_xiong_2022
      @santos_silva_2022
      @filippone_etal_2023
      @li_etal_2023
    ],

    "Network overhead",
    [
      @carvalho_etal_2020
      @filippone_etal_2021
      @zhou_xiong_2022
      @quattrocchi_etal_2024
    ],

    "Complexity",
    [
      @al_debagy_martinek_2020
      @santos_silva_2022
      @lourenco_silva_2023
    ],

    "CPU and memory usage",
    [
      @zhang_etal_2020
      @quattrocchi_etal_2024
    ],

    "Modularity",
    [
      @bandara_perera_2020
      @li_etal_2023
    ],

    "Similarity",
    [
      @ma_etal_2022
      @lourenco_silva_2023
    ],

    "Other metrics",
    [
      // Instability
      @li_etal_2023
      // Precision/recall
      @filippone_etal_2023
      // Team Size Reduction
      @mazlami_etal_2017
      @lourenco_silva_2023
      // Average Domain Redundancy
      @mazlami_etal_2017
      // Dedication Score
      @kamimura_etal_2018
      // Matching Degree
      @hao_etal_2023
      // Data Autonomy
      @selmadji_etal_2020
      // Functional Autonomy
      @filippone_etal_2023
      // Correlation
      @yang_etal_2022
      @wu_zhang_2022
      // Dependency
      @saidi_etal_2023
      // Manual
      @kinoshita_kanuka_2022
      // Customizable
      @lopes_silva_2023
    ],

    "No metrics",
    [
      @eyitemi_reiff_marganiec_2020
      @romani_etal_2022
    ],
  ),
  caption: [Quality metrics]
) <slr_metrics>

==== Cohesion and coupling

// TODO

==== Network overhead

// TODO

==== Complexity

// TODO

==== CPU and memory usage

// TODO

==== Modularity

// TODO

==== Similarity

// TODO

==== Other metrics

// TODO
