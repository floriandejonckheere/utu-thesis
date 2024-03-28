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
For example, #citeauthor(<selmadji_etal_2020>) define (internal) cohesion as the number of direct connections between the methods of the classes belonging to a microservice over the number of possible connections between the methods of the classes.
The authors then define internal coupling as the number of direct method calls between two classes over the total number of method calls in the application.

Others @carvalho_etal_2020 @filippone_etal_2021 @zhou_xiong_2022 use a similar definition of cohesion, but they define (individual) coupling as the number of method calls from a microservice class to another class outside of the service boundary.
The total coupling of the solution is the sum of the coupling of all microservices.

Another approach to cohesion and coupling is that of #citeauthor(<santos_silva_2022>) and #citeauthor(<lourenco_silva_2023>), who define cohesion as the percentage of entities accessed by a functionality.
If all entities belonging to a microservice candidate are accessed each time a microservice candidate is accessed, the service is strongly cohesive.
Coupling is defined as the percentage of the entities exposed by a microservice candidate that are accessed by other microservice candidates.

#citeauthor(<al_debagy_martinek_2020>) use the inverse of cohesion as a metric, named lack of cohesion (LCOM).
It is calculated by the number of times a microservice uses a method from another microservice, divided by the number of operations multiplied by the number of unique parameters.
This metric quantifies how the operations in a service are related to each other in terms of functionality.

// TODO: more examples

==== Network overhead

Microservices are distributed systems, and communication between services is done over a network.
The network overhead is the extra cost of this communication, and many authors consider it an important metric to consider when designing a microservice architecture.

#citeauthor(<filippone_etal_2021>) and others @carvalho_etal_2020 @zhou_xiong_2022 calculate the value based using a heuristic function that uses the size of primitive types of method call arguments to predict the total network overhead of a microservice decomposition.
#citeauthor(<carvalho_etal_2020>) also includes the protocol overhead in the calculation, which is the cost of the communication protocol used to send messages between services (for example, TCP headers, HTTP headers, etc.).

==== Complexity

The complexity of a microservice candidate is another metric that can impact the quality of the microservice decomposition.
#citeauthor(<al_debagy_martinek_2020>) defines complexity based on Number of Operations, a metric that uses Weighted Methods per Class (WMC), summing the number of methods in a class.

#citeauthor(<santos_silva_2022>) define the complexity metric in terms of the functionality redesign effort, rather than the complexity of the microservice candidates.
The metric is associated with the cognitive load of the software architect when considering a migration from monolith to microservice.

In another publication by the same co-author, #citeauthor(<lourenco_silva_2023>) define complexity as the effort required to perform the decomposition, and expand the concept to uniform complexity, which is calculated by dividing the complexity of a decomposition by the maximum possible complexity.

==== CPU and memory usage

// TODO

==== Modularity

// TODO

==== Similarity

// TODO

==== Other metrics

#citeauthor(<lourenco_silva_2023>) introduce the concept of Team Size Reduction (TSR), which indicates if the average team size is shorter after the decomposition, by comparing the average number of authors per microservice to the total number of authors.
A Team Size Reduction value of 1 indicates that the microservices architecture has the same number of authors as the monolith, while a value less than 1 indicates a reduction in the number of authors.
#citeauthor(<mazlami_etal_2017>) make use of the TSR metric, as well as the Average Domain Redundancy (ADR) metric, which represents the amount of domain-specific duplication or redundancy between the microservices.
The ADR metric uses a scale from 0 to 1, where 0 indicates no redundancy and 1 indicates that all microservices are redundant.

#citeauthor(<carvalho_etal_2020>) propose a metric called reuse, which measures the reusability of a microservice.
Reuse is calculated as the number of times a microservice is called by the user, relying on dynamic analysis to collect this information.

==== No metrics

Finally, some of the publications publications, do not mention any quality metrics.
This is the case of #citeauthor(<eyitemi_reiff_marganiec_2020>) and #citeauthor(<romani_etal_2022>).
