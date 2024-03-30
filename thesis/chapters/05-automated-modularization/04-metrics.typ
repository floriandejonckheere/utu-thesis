#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": citeauthor

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
      @daoud_etal_2020
      @li_etal_2023
      @al_debagy_martinek_2020
      @zhou_xiong_2022
      @quattrocchi_etal_2024
      @selmadji_etal_2020
      @carvalho_etal_2020
      @bandara_perera_2020
      @filippone_etal_2021
      @filippone_etal_2023
      @wu_zhang_2022
      @zaragoza_etal_2022
      @santos_silva_2022
      @lourenco_silva_2023
      @jin_etal_2021
      @zhang_etal_2020
      @brito_etal_2021
      @wei_etal_2020
      @sellami_etal_2022
      @hasan_etal_2023
      @nitin_etal_2022
    ],

    "Coupling",
    [
      @daoud_etal_2020
      @li_etal_2023
      @zhou_xiong_2022
      @selmadji_etal_2020
      @carvalho_etal_2020
      @bandara_perera_2020
      @filippone_etal_2021
      @filippone_etal_2023
      @agarwal_etal_2021
      @wu_zhang_2022
      @santos_silva_2022
      @lourenco_silva_2023
      @jin_etal_2021
      @zhang_etal_2020
      @brito_etal_2021
      @wei_etal_2020
      @sellami_etal_2022
      @hasan_etal_2023
      @nitin_etal_2022
    ],

    "Network overhead",
    [
      @zhou_xiong_2022
      @quattrocchi_etal_2024
      @carvalho_etal_2020
      @filippone_etal_2021
    ],

    "Complexity",
    [
      @al_debagy_martinek_2020
      @santos_silva_2022
      @lourenco_silva_2023
      @hasan_etal_2023
    ],

    "CPU and memory usage",
    [
      @quattrocchi_etal_2024
      @zhang_etal_2020
      @nitin_etal_2022
    ],

    "Modularity",
    [
      @li_etal_2023
      @bandara_perera_2020
      @jin_etal_2021
      @wu_zhang_2022
      @brito_etal_2021
      @sellami_etal_2022
    ],

    "Other metrics",
    [
      @yang_etal_2022 // Correlation
      @saidi_etal_2023 // Dependency
      @li_etal_2023 // Instability
      @mazlami_etal_2017 // Team Size Reduction, Average Domain Redundancy
      @kamimura_etal_2018 // Dedication Score
      @selmadji_etal_2020 // Data Autonomy
      @filippone_etal_2023 // Precision/recall
      @lourenco_silva_2023 // Team Size Reduction
      @hao_etal_2023 // Matching Degree
      @ma_etal_2022 // Adjusted Rand Index
      @wei_etal_2020 // Instability
      @sellami_etal_2022 // Non-Extreme Distribution
      @hasan_etal_2023 // Size
      @nitin_etal_2022 // Business Context Purity
    ],

    "No metrics",
    [
      @escobar_etal_2016 // Manual
      @kinoshita_kanuka_2022 // Manual
      @romani_etal_2022
      @eyitemi_reiff_marganiec_2020
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

Others @carvalho_etal_2020 @filippone_etal_2021 @zhou_xiong_2022 @zhang_etal_2020 @agarwal_etal_2021 @bandara_perera_2020 use a similar definition of cohesion, but they define (individual) coupling as the number of method calls from a microservice class to another class outside of the service boundary.
The total coupling of the solution is the sum of the coupling of all microservices.
Similarly, #citeauthor(<filippone_etal_2023>) define average cohesion and average coupling as ratio of the total cohesion and coupling respectively, to the number of microservices in the decomposition.

#citeauthor(<jin_etal_2021>) introduce the concept of inter-service cohesion and inter-call percentage (ICP) as coupling metrics.
Several other publications use the metrics introduced by #cite(<jin_etal_2021>, form: "author") in their research @wu_zhang_2022 @brito_etal_2021 @sellami_etal_2022 @nitin_etal_2022.

Another approach to cohesion and coupling is that of #citeauthor(<santos_silva_2022>) and #citeauthor(<lourenco_silva_2023>), who define cohesion as the percentage of entities accessed by a functionality.
If all entities belonging to a microservice candidate are accessed each time a microservice candidate is accessed, the service is strongly cohesive.
Coupling is defined as the percentage of the entities exposed by a microservice candidate that are accessed by other microservice candidates.

#citeauthor(<al_debagy_martinek_2020>) use the inverse of cohesion as a metric, named lack of cohesion (LCOM).
It is calculated by the number of times a microservice uses a method from another microservice, divided by the number of operations multiplied by the number of unique parameters.
This metric quantifies how the operations in a service are related to each other in terms of functionality.

==== Network overhead

Microservices are distributed systems, and communication between services is done over a network.
The network overhead is the extra cost of this communication, and many authors consider it an important metric to consider when designing a microservice architecture.

#citeauthor(<filippone_etal_2021>) and others @carvalho_etal_2020 @zhou_xiong_2022 calculate the value based using a heuristic function that uses the size of primitive types of method call arguments to predict the total network overhead of a microservice decomposition.
#citeauthor(<carvalho_etal_2020>) also includes the protocol overhead in the calculation, which is the cost of the communication protocol used to send messages between services (for example, TCP headers, HTTP headers, etc.).

#citeauthor(<quattrocchi_etal_2024>) measure network overhead as part of their operational cost metric.
The metric also includes data management costs (CPU and memory).

==== Complexity

The complexity of a microservice candidate is another metric that can impact the quality of the microservice decomposition.
#citeauthor(<al_debagy_martinek_2020>) defines complexity based on Number of Operations, a metric that uses Weighted Methods per Class (WMC), summing the number of methods in a class.

#citeauthor(<santos_silva_2022>) define the complexity metric in terms of the functionality redesign effort, rather than the complexity of the microservice candidates.
The metric is associated with the cognitive load of the software architect when considering a migration from monolith to microservice.

In another publication by the same co-author, #citeauthor(<lourenco_silva_2023>) define complexity as the effort required to perform the decomposition, and expand the concept to uniform complexity, which is calculated by dividing the complexity of a decomposition by the maximum possible complexity.

==== CPU and memory usage
// TODO: should be "performance" instead?

A non-functional metric that is considered by some authors is the CPU and/or memory usage of the microservices.
#citeauthor(<zhang_etal_2020>) use this metric to evaluate the quality of the microservice decomposition, by predicting the average CPU and memory usage of the microservices.
The prediction is made based on performance logs collected by executing the monolith application.

#citeauthor(<quattrocchi_etal_2024>) define operational costs as metric to minimize, which includes communication (network) and data management (CPU and memory) costs.

#citeauthor(<nitin_etal_2022>) don't utilize the CPU and memory usage directly as a metric, but instead assume the latency and throughput as indicators of performance.

==== Modularity

Modularity is a measure of independence of services, and can be divided into many dimensions, such as structure, concept, history, and dynamism @candela_etal_2016.

#citeauthor(<jin_etal_2021>) use modularity as a metric to evaluate potential decompositions.
The authors use Modularity Quality @mancoridis_etal_1998 and extend the concept with structural and conceptual dependencies to assess the modularity of microservice candidates.

#citeauthor(<carvalho_etal_2020>) introduce a metric named feature modularization, which maps a list of features supplied by the software architect onto classes and methods, determining the set of predominant features per microservice.

==== Other metrics

#citeauthor(<lourenco_silva_2023>) introduce the concept of Team Size Reduction (TSR), which indicates if the average team size is shorter after the decomposition, by comparing the average number of authors per microservice to the total number of authors.
A Team Size Reduction value of 1 indicates that the microservices architecture has the same number of authors as the monolith, while a value less than 1 indicates a reduction in the number of authors.
#citeauthor(<mazlami_etal_2017>) make use of the TSR metric, as well as the Average Domain Redundancy (ADR) metric, which represents the amount of domain-specific duplication or redundancy between the microservices.
The ADR metric uses a scale from 0 to 1, where 0 indicates no redundancy and 1 indicates that all microservices are redundant.

#citeauthor(<carvalho_etal_2020>) propose a metric called reuse, which measures the reusability of a microservice.
Reuse is calculated as the number of times a microservice is called by the user, relying on dynamic analysis to collect this information.

The usage metric of an object-oriented software system, defined as the sum of the inheritance factor (is-a) and the composition factor (has-a) is used by #citeauthor(<bandara_perera_2020>) as a part of the fitness function for the clustering algorithm.

#citeauthor(<saidi_etal_2023>) use the intra-domain and inter-domain data dependency metrics to delineate microservice boundaries, based on the read and write access pattern of the operations.
In a similar fashion, #citeauthor(<selmadji_etal_2020>) talk about data autonomy determined by the internal and external data access of a microservice candidate.

#citeauthor(<kamimura_etal_2018>) introduce a metric called dedication score, which measures the relationships between services as a function of access frequency.
Along with a modularity metric, the dedication score is used in their custom SArF dependency-based clustering algorithm @kobayashi_etal_2012.

The correlation metric is used by #citeauthor(<yang_etal_2022>) and indicates the degree of correlation between the microservices.
The authors calculate the correlation in two ways: the number of co-occurrence of the problem domain, and the adjacency relationship between problem domains.

#citeauthor(<ma_etal_2022>) use the Adjusted Rand Index (ARI) as clustering evaluation criterion.
The metric measures the similarity between two clusters in a decomposition, and ranges from -1 to 1, with 0 being the optimal value.

#citeauthor(<hao_etal_2023>) use the Matching Degree metric as quality indicator.
The metric is calculated by dividing the number of intersections of database tables in a given microservice and a given cluster by the total number of tables used in the microservice.

==== No metrics

Finally, some of the publications publications, do not mention any quality metrics used in the evaluation of the proposed decomposition.
These methods typically rely on the selection or approval of a software architect to choose the best decomposition, based on their experience and knowledge of the system.
This is the case of #citeauthor(<eyitemi_reiff_marganiec_2020>), #citeauthor(<romani_etal_2022>), #citeauthor(<amiri_2018>), and #citeauthor(<escobar_etal_2016>).

The evaluation method by #citeauthor(<kinoshita_kanuka_2022>) also does not rely on quantifying the quality of the microservice decomposition using metrics, but rather relies on the software architect's judgement to choose a qualitative decomposition.
