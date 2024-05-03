#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

=== Metrics

The quality metrics used in the publications are summarized in @slr_metrics.
The metrics are used to quantitatively evaluate the quality of the generated microservice decomposition.
Some of the algorithms require the use of a specific metric to guide the process, such as the fitness function in genetic algorithms, or the modularity metric in the Louvain algorithm.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, left),
    [*Metric*], [*Publications*],
    "Cohesion",
    [
      #metrics.at("cohesion").map(p => ref(label(p))).join()
    ],

    "Coupling",
    [
      #metrics.at("coupling").map(p => ref(label(p))).join()
    ],

    "Network overhead",
    [
      #metrics.at("overhead").map(p => ref(label(p))).join()
    ],

    "Complexity",
    [
      #metrics.at("complexity").map(p => ref(label(p))).join()
    ],

    "Resource usage",
    [
      #metrics.at("resource").map(p => ref(label(p))).join()
    ],

    "Modularity",
    [
      #metrics.at("modularity").map(p => ref(label(p))).join()
    ],

    "Other metrics",
    [
      #metrics.at("other").map(p => ref(label(p))).join()
    ],

    "No metrics",
    [
      #metrics.at("none").map(p => ref(label(p))).join()
    ],
  ),
  caption: [Quality metrics]
) <slr_metrics>

We identified #total(metrics) metrics used in the publications, and categorized them in six categories.
Publications using undisclosed quality metrics, and publications using no metrics at all, are categorized into separate categories.
Cohesion (#count(metrics, "cohesion")\; #percentage(metrics, "cohesion")) and coupling (#count(metrics, "coupling")\; #percentage(metrics, "coupling")) are the most frequently used metrics, followed by modularity (#count(metrics, "modularity")\; #percentage(metrics, "modularity")), network overhead and complexity (#count(metrics, "complexity")\; #percentage(metrics, "complexity") each), and resource usage (#count(metrics, "resource")\; #percentage(metrics, "resource")).
Publications using other metrics (#count(metrics, "other")\; #percentage(metrics, "other")) account for the remaining metrics.
Finally, the #count(metrics, "none") publications that do not mention any quality metrics account for #percentage(metrics, "none").
@slr_metrics_chart breaks down the metrics distribution by category.

#figure(
  include("/figures/06-automated-modularization/metrics.typ"),
  caption: [SDLC metric categories]
) <slr_metrics_chart>

==== Cohesion and coupling

The quality metrics most frequently mentioned in the literature are cohesion and coupling.
The behaviour of information systems has been studied  with the help of these metrics and others such as size and complexity since the 1970s @parnas_1972.
As object-oriented programming became more popular, the concepts of cohesion and coupling were adapted to the new paradigm @eder_etal_1995.

Throughout the years, many definitions of cohesion and coupling have been proposed both for procedural and object-oriented systems.
For example, #cite_full(<briand_etal_1996>) defined cohesion as the tightness with which related program features are grouped together, and coupling as the amount of relationships between the elements belonging to different modules of a system.

The publications in this review use different definitions for cohesion and coupling, and different methods of calculating them.
For example, #cite_full(<selmadji_etal_2020>) defined cohesion as the number of direct connections between the methods of the classes belonging to a microservice over the number of possible connections between the methods of the classes.
The authors then define coupling as the number of direct method calls between two classes over the total number of method calls in the application.

Others @zhou_xiong_2022, @zhang_etal_2020, @filippone_etal_2021, @agarwal_etal_2021, @carvalho_etal_2020, @bandara_perera_2020 use a similar definition of cohesion, but they define (individual) coupling as the number of method calls from a microservice class to another class outside of the microservice boundary.
The total coupling of the solution is the sum of the coupling of all microservices.
Similarly, #cite_full(<filippone_etal_2023>) defined average cohesion and average coupling as ratio of the total cohesion and coupling respectively, to the number of microservices in the decomposition.

#cite_full(<jin_etal_2021>) introduced the concept of inter-service cohesion and inter-call percentage (ICP) as coupling metrics.
Several other publications used the metrics introduced by #cite_author(<jin_etal_2021>) in their research @wu_zhang_2022, @brito_etal_2021, @sellami_etal_2022, @nitin_etal_2022.

Another approach to cohesion and coupling is that of #cite_full(<santos_silva_2022>) and #cite_full(<lourenco_silva_2023>), who defined cohesion as the percentage of entities accessed by a functionality.
If all entities belonging to a microservice candidate are accessed each time a microservice candidate is accessed, the microservice is strongly cohesive.
Coupling is defined as the percentage of the entities exposed by a microservice candidate that are accessed by other microservice candidates.

#cite_full(<al_debagy_martinek_2020>) used the inverse of cohesion as a metric, called lack of cohesion (LCOM).
Lack of cohesion is calculated by the number of times a microservice uses a method from another microservice, divided by the number of operations multiplied by the number of unique parameters.
This metric quantifies how the operations in a microservice are related to each other in terms of functionality.

==== Network overhead

Microservices are distributed systems, and communication between microservices is done over a network.
The network overhead is the extra cost of this communication, and many authors consider it an important metric when designing a microservice architecture.

#cite_full(<filippone_etal_2021>) and others @carvalho_etal_2020, @zhou_xiong_2022 calculated the value using a heuristic function that uses the size of primitive types of method call arguments to predict the total network overhead of a microservice decomposition.
#cite_full(<carvalho_etal_2020>) also included the protocol overhead in the calculation, which is the cost of the communication protocol used to send messages between microservices (for example, TCP and HTTP headers).

#cite_full(<quattrocchi_etal_2024>) measured network overhead as part of their operational cost metric.
The metric also includes data management costs (CPU and memory).

==== Complexity

The complexity of a microservice candidate is another metric that can impact the quality of the microservice decomposition.
#cite_full(<al_debagy_martinek_2020>) defined complexity based on Number of Operations, a metric that uses Weighted Methods per Class (WMC), summing the number of methods in a class.

#cite_full(<santos_silva_2022>) defined the complexity metric in terms of the functionality redesign effort, rather than the complexity of the microservice candidates.
The metric is associated with the cognitive load of the software architect when considering a migration from monolith to microservice.

In another publication by the same co-author, #cite_full(<lourenco_silva_2023>) defined complexity as the effort required to perform the decomposition, and expanded the concept to uniform complexity, which is calculated by dividing the complexity of a decomposition by the maximum possible complexity.

==== Resource usage

A non-functional metric that is considered by some authors is the resource usage of the microservices.
#cite_full(<zhang_etal_2020>) used this metric to evaluate the quality of the microservice decomposition, by predicting the average CPU and memory usage of the microservices.
The prediction is made based on performance logs collected by executing the monolith application.

#cite_full(<quattrocchi_etal_2024>) defined operational costs as the metric to minimize, including communication (network) and data management (CPU and memory) costs.

#cite_full(<nitin_etal_2022>) did not utilize the resource usage directly as a metric, but instead assumed the latency and throughput as indicators of performance.

==== Modularity

Modularity is a measure of independence of microservices, and can be divided into many dimensions, such as structure, concept, history, and dynamism @candela_etal_2016.
Some definitions of modularity rely on the concepts of cohesion and coupling, and the balance between them.

#cite_full(<jin_etal_2021>) used modularity as a metric to evaluate potential decompositions.
The authors use Modularity Quality @mancoridis_etal_1998 and extend the concept with structural and conceptual dependencies to assess the modularity of microservice candidates.

#cite_full(<carvalho_etal_2020>) introduced a metric named feature modularization, which maps a list of features supplied by the software architect onto classes and methods, determining the set of predominant features per microservice.

==== Other metrics

#cite_full(<mazlami_etal_2017>) introduced the concept of Team Size Reduction (TSR), which indicates if the average team size is shorter after the decomposition, by comparing the average number of authors per microservice to the total number of authors.
A Team Size Reduction value of 1 indicates that the microservices architecture has the same number of authors as the monolith, while a value fewer than 1 indicates a reduction in the number of authors.
The authors made use of the TSR metric, as well as the Average Domain Redundancy (ADR) metric, which represents the amount of domain-specific duplication or redundancy between the microservices.
The ADR metric uses a scale from 0 to 1, where 0 indicates no redundancy and 1 indicates that all microservices are redundant.

#cite_full(<lourenco_silva_2023>) used the TSR metric in their solution as well.

#cite_full(<carvalho_etal_2020>) proposed a metric called reuse, which measures the reusability of a microservice.
Reuse is calculated as the number of times a microservice is called by the user, relying on dynamic analysis to collect this information.

The usage metric of an object-oriented software system, defined as the sum of the inheritance factor (is-a) and the composition factor (has-a) is used by #cite_full(<bandara_perera_2020>) as a part of the fitness function for the clustering algorithm.

#cite_full(<saidi_etal_2023>) used the intra-domain and inter-domain data dependency metrics to delineate microservice boundaries, based on the read and write access pattern of the operations.
In a similar fashion, #cite_full(<selmadji_etal_2020>) talked about data autonomy determined by the internal and external data access of a microservice candidate.

#cite_full(<kamimura_etal_2018>) introduced a metric called dedication score, which measures the relationships between microservices as a function of access frequency.
Along with a modularity metric, the dedication score is used in their custom SArF dependency-based clustering algorithm @kobayashi_etal_2012.

The correlation metric is used by #cite_full(<yang_etal_2022>) and indicates the degree of correlation between the microservices.
The authors calculate the correlation in two ways: the number of co-occurrence of the problem domain, and the adjacency relationship between problem domains.

#cite_full(<ma_etal_2022>) used the Adjusted Rand Index (ARI) as clustering evaluation criterion.
The metric measures the similarity between two clusters in a decomposition, and ranges from -1 to 1, with 0 being the optimal value.

#cite_full(<hao_etal_2023>) used the matching degree metric as quality indicator.
The metric is calculated by dividing the number of intersections of database tables in a given microservice and a given cluster by the total number of tables used in the microservice.

#cite_full(<hasan_etal_2023>) and #cite_full(<kalia_etal_2021>) used the size metric to evaluate the quality of the microservice decomposition.
The metric measures how evenly the size of the proposed microservices is.
The size metric was originallly proposed by #cite_full(<wu_etal_2005>).

#cite_full(<santos_paula_2021>) used the silhouette coefficient originally proposed by #cite_full(<rousseeuw_1987>) as evaluation metric.
The silhouette coefficient assesses clustering consistency by comparing the average dissimilarity within the cluster.

==== No metrics

Some of the publications do not mention any quality metrics used in the evaluation of the proposed decomposition.
These methods typically rely on the selection or approval of a software architect to choose the best decomposition, based on their experience and knowledge of the system.
This is the case of #cite_full(<kinoshita_kanuka_2022>),  #cite_full(<amiri_2018>), #cite_full(<eyitemi_reiff_marganiec_2020>), #cite_full(<romani_etal_2022>), and #cite_full(<escobar_etal_2016>).
