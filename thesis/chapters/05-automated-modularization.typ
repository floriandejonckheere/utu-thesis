#import "@preview/acrostiche:0.3.1": *
#import "@preview/sourcerer:0.2.1": code

#import "/cite.typ": citeauthor

#let publications = (
  platforms: (
    ieee: (total: 337, selected: 34, primary: 29, secondary: 5),
  ),
  snowballing: none,
)

= Automated modularization <automatedmodularization>

// Enumeration of existing automated technologies for modularization of monolith codebases
// Answer to Research Question 2.

In this chapter, we investigate the state of the art in automated technologies for modularization of monolith codebases.
Using a systematic literature review, we identified and categorized existing literature regarding automated modularization of monolith codebases.
We also provided a brief overview of the most relevant approaches and tools.

A systematic literature review is used to identify, evaluate and interpret research literature for a given topic area, or research question @systematic_literature_review_guidelines.
The systematic nature of systematic literature reviews reduces bias through a well-defined sequence of steps to identify and categorize existing literature, although publication bias still has to be considered /* TODO: reference */.
Studies directly researching the topic area are called _primary_ studies, systematic studies aggregating and summarizing primary studies are called _secondary_ studies.
_Tertiary_ studies are systematic studies aggregating and summarizing secondary studies.

The literature review was conducted using a three-step protocol as defined by #citeauthor(<systematic_literature_review_guidelines>):

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (center, center, left),
    [], [*Step*], [*Activity*],
    "1", "Plan", "Identify the need for the review, specifying the research questions, and developing a review protocol",
    "2", "Conduct", "Identification and selection of literature, data extraction and synthesis",
    "3", "Report", "Evaluation and reporting of the results",
  ),
  caption: [Systematic literature review process]
) <slr_process>

== Plan

Using the systematic literature review, we answered the following research question:

*Research Question 2*: What are the existing approaches and tools for automated microservice candidate identification in monolith codebases?

The motivation for the research question is discussed in @introduction.

In current literature, several systematic mapping studies related to microservices architecture have been conducted @systematic_mapping_study_1 @systematic_mapping_study_2, as well as systematic literature reviews related to microservice decomposition /* TODO: systematic literature reviews */.
However, in these studies the techniques described are mainly used as an aid for the software architect when identifying microservice candidates.
Therefore, we believe that there is a need for a systematic literature review aimed at summarizing existing literature regarding fully automated techniques for modularization of monolith codebases.

As a search strategy, the following platforms were queried for relevant publications:
+ IEEE Xplore#footnote[https://ieeexplore.ieee.org/]

Based on a list of relevant topics, we used a combination of related keywords to formulate the search query.
We refrained from using more generic keywords, such as "architecture" or "design", as they would yield too many irrelevant results.
The topics relevant for the search query are:

- _Architecture_: the architectural styles being discussed in the publications.
  #linebreak()
  Keywords: microservice, monolith, modular monolith
- _Modularization_: the process of identifying and decomposing modules in a monolith architecture.
  #linebreak()
  Keywords: service identification, microservice decomposition, monolith modularization
- _Technology_: the technologies, algorithms, or methods for modularization.
  #linebreak()
  Keywords: automated tool, machine learning, static analysis, dynamic analysis, hybrid analysis

The resulting search query can be expressed as follows:

#figure(
  code(
    ```sql
      (('microservices' IN title OR abstract) OR
       ('monolith' IN title OR abstract))
    AND
      (('decomposition' IN title OR abstract) OR
       ('identification' IN title OR abstract))
    AND
      ('automated' IN title OR abstract)
    ```
  ),
  caption: [Search query]
) <slr_search_query>

The search query was adapted to the specific search syntax of the platform.

In addition to search queries on the selected platforms, we used snowballing to identify additional relevant publications.
Snowballing is a research technique used to find additional publications of interest by following the references of the selected publications /* TODO: reference */.

Based the inclusion/exclusion criteria in @slr_criteria, the results were filtered, and the relevant studies were selected for inclusion in the systematic literature review.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (center, left),
    [], [*Criteria*],
    "Inclusion",
    [
      - Title, abstract or keywords include the search terms
      - Conference papers, research articles, blog posts, or other publications
      - Publications addressing (semi-)automated technologies, algorithms, or methods
    ],
    "Exclusion",
    [
      - Publications in languages other than English
      - Publications not available in full text
      - Publications using the term "microservice", but not referring to the architectural style
      - Publications aimed at greenfield #footnote[Development of new software systems lacking constraints imposed by prior work @project_management] or brownfield #footnote[Development of new software systems in the presence of legacy software systems @project_management] development of microservice-based systems
      - Publications published before 2014, as the definition of "microservices" as an architectural style is inconsistent before @systematic_mapping_study_2
      - Publications addressing manual technologies, algorithms, or methods
      - Surveys, opinion pieces, or other non-technical publications
    ]
  ),
  caption: [Inclusion and exclusion criteria]
) <slr_criteria>

As a final step, the publications were subjected to a validation scan to ensure relevance and quality.
To assess the quality, we mainly focused on the technical soundness of the approach or technique described in the publication.

The quality of the publication was assessed based on the following criteria:

- The publication is peer-reviewed or published in a respectable journal
- The publication thoroughly describes the technical aspects of the approach or technique
- The publication includes a validation phase or case study demonstrating the effectiveness of the approach or technique

This step is necessary to ensure that the selected publications are relevant to the research question and that the results are not biased by low-quality publications.

Once a final selection of publications was made, the resulting publications were qualitatively reviewed and categorized based on the type of approach or technique they describe.

== Conduct

Using the search strategy outlined in the previous section, we queried the selected platforms and found a total of #publications.platforms.values().map(p => p.total).sum() publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, center, center),
    [*Platform*], [*Search results*], [*Selected publications*],
    // (("All Metadata":"microservices" OR "All Metadata":"monolith") AND ("All Metadata":"decomposition" OR "All Metadata":"identification"))
    [IEEE Xplore], [#publications.platforms.ieee.total], [#publications.platforms.ieee.selected],
    [Snowballing], none, [#publications.snowballing],
    [*Total*], [#publications.platforms.values().map(p => p.total).sum()], [#(publications.platforms.values().map(p => p.selected).sum() + publications.snowballing)],
  ),
  caption: "Summary of search results"
) <slr_search_results>

After applying the inclusion/exclusion criteria, we selected #publications.platforms.values().map(p => p.selected).sum() publications for inclusion in the systematic literature review.
Of these publications, #publications.platforms.values().map(p => p.primary).sum() are primary studies, and #publications.platforms.values().map(p => p.secondary).sum() are secondary studies.
The secondary studies were used to categorize the selected primary studies (if any), and as a starting point for the snowballing process, which resulted in #publications.snowballing additional publications being included in the systematic literature review.
For a list of the selected publications, see @slr_publications.

== Report

The publications selected for inclusion in the systematic literature review were qualitatively reviewed and categorized in three dimensions.

To begin with, we categorized the publications based on the #acr("SDLC") artifact they use as input for the microservice candidate identification algorithm.
Each artifact category has an associated collection type, either static, dynamic, or hybrid. @bajaj_etal_2021.
Static collection describes a #acr("SDLC") artifact that was collected without executing the software, while dynamic collection describes a #acr("SDLC") artifact that was collected after or during execution of the software. /* TODO: elaborate more and link sources */
Some publications describe algorithms or techniques that use a combination of #acr("SDLC") artifacts, which we categorized as hybrid. /* TODO: is hybrid a separate category? */

Thereafter we categorized the publications based on the algorithm used for microservice candidate identification.
The algorithms were subdivided into several classes based on the technique.

Ultimately, the publications were also categorized by the metrics discussed.

// FIXME: #acr does not render in the PDF index
=== SDLC artifact

The identified #acr("SDLC") artifact categories used as input for the microservice candidate identification algorithm are described in @slr_artifacts.
The categories are based on #citeauthor(<bajaj_etal_2021>).

#show figure: set block(breakable: true)
#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, left, left),
    [*Artifact*], [*Type*], [*Publications*],
    "Requirements documents and models", // e.g., functional and non-functional requirements, use cases, BPMN
    "Static",
    [
      @amiri_2018
      @daoud_etal_2020
      @yang_etal_2022
      @saidi_etal_2023
      @li_etal_2023
    ],

    "Design documents", // e.g., API specifications, UML, ERD
    "Static",
    [
      @al_debagy_martinek_2020
      @zhou_xiong_2022
      @quattrocchi_etal_2024
    ],

    "Code", // e.g., source code, revision history
    "Static",
    [
      @escobar_etal_2016
      @mazlami_etal_2017
      @kamimura_etal_2018
      @selmadji_etal_2020
      @carvalho_etal_2020
      @bandara_perera_2020
      @filippone_etal_2021
      @agarwal_etal_2021
      @kinoshita_kanuka_2022
      @wu_zhang_2022
      @zaragoza_etal_2022
      @santos_silva_2022
      @romani_etal_2022
      @filippone_etal_2023
      @lourenco_silva_2023
      @hao_etal_2023
    ],

    "Execution data", // e.g., log files, execution traces
    "Dynamic",
    [
      @zhang_etal_2020
      @carvalho_etal_2020
      @eyitemi_reiff_marganiec_2020
      @jin_etal_2021
      @wu_zhang_2022
      @ma_etal_2022
      @lourenco_silva_2023
      @hao_etal_2023
    ],
  ),
  caption: [SDLC artifact categories]
) <slr_artifacts>

==== Requirements documents and models

In software engineering, requirements documents and models are used to formally describe the requirements of a software system following the specification of the business or stakeholder requirements @software_requirements_specification.
They include functional and non-functional requirements, use cases, user stories, and business process models.
Approaches using requirements documents and models as input for the microservice candidate identification algorithm often times need to pre-process the documents to extract the relevant information, as they are not intended to be directly read by a machine. /* TODO: find reference */
In many cases, requirements documents and models for legacy systems are no longer available or outdated, which makes this approach less suitable for automated microservice identification.

#citeauthor(<amiri_2018>) and #citeauthor(<daoud_etal_2020>) model a software system as a set of business process using the industry standard #acr("BPMN"), using the machine-readable XML representation as input for the algorithm.
#citeauthor(<yang_etal_2022>) tackle requirements engineering using problem frames. /* TODO: find reference */

Some approaches use schematic requirements documents in XML format as input for the algorithm, as described by #citeauthor(<zhang_etal_2020>) and #citeauthor(<saidi_etal_2023>).
 The latter use domain-driven design techniques to extract functional dependencies from the software design as starting point in microservice identification.
#citeauthor(<li_etal_2023>) employ an intermediate format containing a precise definition of business functionality, generated from validated requirements documents.

==== Design documents

Design documents created by software architects are machine-readable representations of the software system.
They describe the software functionalities in detail and are used to guide the implementation of the software system.
Design documents include API specifications, UML diagrams (such as class diagrams and sequence diagrams), and entity-relationship diagrams.

Techniques using design documents either use a domain-driven approach, or a data-driven approach.
Domain-driven approaches use domain-specific knowledge to identify microservice candidates, while data-driven approaches use knowledge about data storage and data flow to identify microservice candidates.
Similar to requirements documents and models, design documents for legacy systems are often not available or outdated, although some design documents can be reconstructed from the software system (e.g., reverse engineering entity-relationship diagrams from the database schema).

For example, #citeauthor(<al_debagy_martinek_2020>) propose a data-driven method based on the analysis of the software system's external API, specified in the OpenAPI format.
The method extracts the information from the specification and converts it into vector representation for further processing.

#citeauthor(<zhou_xiong_2022>) use readily available design documents as well, in the form of UML class diagrams, use cases, and object sequence diagrams as starting point for the microservice identification algorithm.

#citeauthor(<quattrocchi_etal_2024>) takes a different approach to the problem, using a data-driven approach combined with a domain-driven approach.
Software architects describe the software system using a custom architecture description language, and the tool developed by the authors is able to identify microservice candidates.
The tool can be prompted to generate different, more efficient decompositions when given additional domain-driven requirements.

==== Code

A third category of #acr("SDLC") artifacts is the executable code of the software system.
This can be the source code of the software system, or a binary distribution (e.g. a JAR file).
For example, the implementation in @agarwal_etal_2021 accepts either source code or compiled binary code for analysis.

As the source code of the software system is the most detailed representation of how the software system works, it is most often used as input for the microservice candidate identification algorithm.
The source code can be analyzed using static analysis (i.e., without executing the software system), dynamic analysis (i.e., during the execution of the software system or test suite), or a combination of both.
Dynamic analysis has the advantage that it can be used if the source code is not available.

Additionally, the revision history of the source code can also be used as source for valuable information about the behaviour of the software system.
For example, #citeauthor(<mazlami_etal_2017>) use both the structure of the source code, as well as the revision history to drive the identification algorithm.
/* TODO: reference "CVS release history data for detecting logical couplings" */

#citeauthor(<escobar_etal_2016>) use the source code of the software system to construct an #acr("AST"), and map the dependencies between the business and data layer.
#citeauthor(<kamimura_etal_2018>) use a more data-driven approach, and statically trace data access calls in the source code.

Several publications @selmadji_etal_2020 @agarwal_etal_2021 construct a dependency graph from Java source code, and use the graph as input for a clustering algorithm.
#citeauthor(<bandara_perera_2020>) map object-oriented classes in the source code to specific microservices, although the list of microservices has to be specified beforehand.

#citeauthor(<filippone_etal_2021>) concentrate on the API controllers as entrypoints into the software system.
A later paper by the same authors @filippone_etal_2023 builds on top of this approach by using the API specification as entrypoints, and then drilling down into the source code by separating the logic and presentation layer.

Most of the publications tracing dependencies between classes (or modules) do this at the level of the classes (or modules). As #citeauthor(<mazlami_etal_2017>) remarks, using a more granular approach at the level of methods (or functions) and attributes has the potential to improve the quality of the decomposition.
#citeauthor(<carvalho_etal_2020>) use a more granular approach, identifying dependencies between methods in the source code.

==== Execution

Finally, data can also be collected during the runtime of the software system.
Execution data includes log files, execution traces, and performance metrics.

An example of an approach using execution traces as input is described by #citeauthor(<jin_etal_2021>).
Using software probes inserted into the bytecode of software systems, the authors are able to monitor execution paths.
Additionally, various metrics such as processor time and memory usage are collected.

#pagebreak()

=== Algorithm

The identified classes of microservice candidate identification algorithms are described in @slr_algorithms.
// TODO: note about how most algorithms are single- or multi-objective optimization algorithms for graph clustering to find a Pareto-optimal solution

#show figure: set block(breakable: true)
#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, left, left),
    [*Type*], [*Example algorithms*], [*Publications*],
    "Machine Learning",
    "K-Means, Hierarchical Agglomerative Clustering, Affinity Propagation",
    [
      // K-means
      @romani_etal_2022
      @wu_zhang_2022
      @hao_etal_2023
      @saidi_etal_2023
      // Hierarchical Agglomerative clustering
      @bandara_perera_2020
      @daoud_etal_2020
      // Affinity Propagation
      @al_debagy_martinek_2020
      // Hierarchical clustering
      @santos_silva_2022
      @zaragoza_etal_2022
      @lourenco_silva_2023
      @ma_etal_2022
    ],

    "Evolutionary algorithms",
    "NSGA-II, NSGA-III",
    [
      // NSGA-II
      @zhang_etal_2020
      @jin_etal_2021
      @zhou_xiong_2022
      @li_etal_2023
      @kinoshita_kanuka_2022
      // NSGA-III
      @carvalho_etal_2020
      // Other
      @amiri_2018
    ],

    "Graph algorithms",
    "Kruskal, Louvain method",
    [
      // Kruskal
      @yang_etal_2022
      @mazlami_etal_2017
      // Louvain method
      @filippone_etal_2023
    ],

    "Other algorithms",
    "Linear optimization, custom algorithms",
    [
      // Linear
      @selmadji_etal_2020
      @filippone_etal_2021
      @quattrocchi_etal_2024
      // Custom
      @kamimura_etal_2018
      @escobar_etal_2016
      // Seed expension
      @agarwal_etal_2021
      // Rule-based
      @eyitemi_reiff_marganiec_2020
      // Customizable
      @lopes_silva_2023
    ],
  ),
  caption: [Microservice identification algorithm]
) <slr_algorithms>

==== Machine Learning

// TODO: explain graphs in mathematical terms
Publications using a clustering approach to identify microservice candidates typically collect static information from the software system, and represent it as a directed graph.
The graph exposes the relationship between the classes, modules, or components.
The nodes of the graph represent the classes, modules, or components, and the edges the function or method calls between them.
Often the edges are weighted, representing the frequency or cost of the calls.
Using this information, the graph is then divided into several clusters, each indicating a microservice candidate.
Typical clustering algorithms used for this purpose are K-Means, Kruskal's algorithm @algorithm_design, and agglomerative clustering.

#citeauthor(<mazlami_etal_2017>) use Kruskal's algorithm @algorithm_design to isolate microservice candidates.

==== Evolutionary algorithms

The second class of algorithms identified in the literature is evolutionary algorithms.
Evolutionary algorithms, and in particular genetic algorithms, are algorithms aimed at solving optimization problems by borrowing techniques from natural selection and genetics.
Such algorithms typically operate iteratively, selecting the best solutions from a population at each iteration (called a generation), and then combining the selected solutions to create new combinations for the next generation.
The process is then repeated until certain criteria are met, for example a maximum number of generations, convergence of the population, or a quality indicator.

Examples of publications using Non-Dominated Sorting Algorithm II (NGSA-II) as multi-objective optimization algorithm to identify microservice candidates are #citeauthor(<zhou_xiong_2022>), #citeauthor(<kinoshita_kanuka_2022>), and #citeauthor(<zhang_etal_2020>)

The authors of #citeauthor(<quattrocchi_etal_2024>) incorporated a linear optimization solver in their tool to identify microservice candidates.

==== Graph algorithms

// TODO

==== Other algorithms

// TODO

#pagebreak()

=== Metrics

The quality metrics used to determine the performance and efficacy of the algorithm are described in @slr_metrics.
// TODO: focus on evaluation metrics instead of performance metrics used in the algorithms

#show figure: set block(breakable: true)
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

=== Conclusion

// TODO: summary/conclusion

