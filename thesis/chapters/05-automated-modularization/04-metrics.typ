#import "@preview/acrostiche:0.3.1": *

#import "/cite.typ": citeauthor

=== Metrics

The quality metrics used in the publications are summarized in @slr_metrics.
The metrics are used to quantitatively evaluate the quality of the generated microservice decomposition.
Some of the algorithms require the use of a specific metric to guide the process, such as the fitness function in genetic algorithms.

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

The quality metrics most frequently mentioned in the literature are cohesion and coupling.
The behaviour of information systems has been studied  with the help of these metrics and others such as size and complexity since the 1970s @parnas_1972.
As object-oriented programming became more popular, the concepts of cohesion and coupling were adapted to the new paradigm @eder_etal_1995.

Throughout the years, many definitions of cohesion and coupling have been proposed both for procedural and object-oriented systems.
For example, #citeauthor(<briand_etal_1996>) define cohesion as the tightness with which related program features are grouped together, and coupling as the amount of relationships between the elements belonging to different modules of a system.

The publications in this review use different definitions for cohesion and coupling, and different methods of calculating them.
For example, #citeauthor(<selmadji_etal_2020>) define internal cohesion as the number of direct connections between the methods of the classes belonging to a microservice over the number of possible connections between the methods of the classes.
The authors then define internal coupling as the number of direct method calls between two classes over the total number of method calls in the application.

==== Complexity

// TODO

==== Network overhead

// TODO

==== CPU and memory usage

// TODO

==== Modularity

// TODO

==== Similarity

// TODO

==== Other metrics

Finally, some of the publications publications, do not mention any quality metrics.
This is the case of #citeauthor(<eyitemi_reiff_marganiec_2020>) and #citeauthor(<romani_etal_2022>).
