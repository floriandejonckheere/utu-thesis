#import "@preview/acrostiche:0.3.1": *
#import "@preview/sourcerer:0.2.1": code

#import "/cite.typ": citeauthor

#let publications = (
  platforms: (
    ieee: (total: 337, selected: 34, primary: 29, secondary: 5),
    arxiv: (total: none, selected: none, primary: none, secondary: none),
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
+ IEEE Xplore
+ arXiv

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

#code(
  ```sql
    (('microservices' IN title OR abstract) OR
     ('monolith' IN title OR abstract))
  AND
    (('decomposition' IN title OR abstract) OR
     ('identification' IN title OR abstract))
  AND
    ('automated' IN title OR abstract)
  ```
)

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
    [arXiv], [#publications.platforms.arxiv.total], [#publications.platforms.arxiv.selected],
    [Snowballing], none, [#publications.snowballing],
    [*Total*], [#publications.platforms.values().map(p => p.total).sum()], [#(publications.platforms.values().map(p => p.selected).sum() + publications.snowballing)],
  ),
  caption: "Summary of search results"
) <slr_search_results>

After applying the inclusion/exclusion criteria, we selected #publications.platforms.values().map(p => p.selected).sum() publications for inclusion in the systematic literature review.
Of these publications, #publications.platforms.values().map(p => p.primary).sum() are primary studies, and #publications.platforms.values().map(p => p.secondary).sum() are secondary studies.
The secondary studies were used to categorize the selected primary studies (if any), and as a starting point for the snowballing process, which resulted in #publications.snowballing additional publications being included in the systematic literature review.
@slr_primary_publications lists the selected primary publications, and @slr_secondary_publications the selected secondary publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (right, left, left),
    [], [*Type*], [*Publication*],
    "1", "Proceedings", cite(<ddd_approach_automatic>, form: "full"),
    "2", "Proceedings", cite(<problem_frames_approach>, form: "full"),
    "3", "Proceedings", cite(<migrating_legacy_software>, form: "full"),
    "4", "Proceedings", cite(<multiobjective_optimization_decomposition>, form: "full"),
    "5", "Article", cite(<design_model_identification>, form: "full"),
    "6", "Proceedings", cite(<execution_trace_identification>, form: "full"),
    "7", "Article", cite(<cromlech_semiautomated_monolith>, form: "full"),
    "8", "Proceedings", cite(<extraction_of_microservices>, form: "full"),
  ),
  caption: [Selected publications (primary studies)]
) <slr_primary_publications>

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (right, left, left),
    [], [*Type*], [*Publication*],
  ),
  caption: [Selected publications (secondary studies)]
) <slr_secondary_publications>

== Report

The publications selected for inclusion in the systematic literature review were qualitatively reviewed and categorized in three dimensions.

To begin with, we categorized the publications based on the #acr("SDLC") artifact they use as input for the microservice candidate identification algorithm.
Each artifact category has an associated collection type, either static, dynamic, or hybrid. @prescriptive_model_migration.
Static collection describes a #acr("SDLC") artifact that was collected without executing the software, while dynamic collection describes a #acr("SDLC") artifact that was collected after or during execution of the software. /* TODO: elaborate more and link sources */
Some publications describe algorithms or techniques that use a combination of #acr("SDLC") artifacts, which we categorized as hybrid. /* TODO: is hybrid a separate category? */

Thereafter we categorized the publications based on the algorithm used for microservice candidate identification.
The algorithms were subdivided into several classes based on the technique.

Ultimately, the publications were also categorized by the metrics discussed.

=== #acr("SDLC") artifact

The identified #acr("SDLC") artifact categories used as input for the microservice candidate identification algorithm are described in @slr_artifacts.
The categories are based on #citeauthor(<prescriptive_model_migration>).

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, left, left),
    [*Artifact*], [*Type*], [*Publications*],
    "Requirements documents and models", // e.g., functional and non-functional requirements, use cases, BPMN
    "Static",
    [
      @ddd_approach_automatic
      @problem_frames_approach
      @migrating_legacy_software
    ],

    "Design documents", // e.g., API specifications, UML, ERD
    "Static",
    [
      @migrating_legacy_software
      @design_model_identification
      @cromlech_semiautomated_monolith
    ],

    "Codebase", // e.g., source code, revision history
    "Static",
    [
      @migrating_legacy_software
      @multiobjective_optimization_decomposition
      @extraction_of_microservices
    ],

    "Execution data", // e.g., log files, execution traces
    "Dynamic",
    [
      @execution_trace_identification
    ],
  ),
  caption: [#acr("SDLC") artifact categories]
) <slr_artifacts>

// Requirements documents and models
In software engineering, requirements documents and models are used to formally describe the requirements of a software system following the specification of the business or stakeholder requirements @software_requirements_specification.
They include functional and non-functional requirements, use cases, user stories, and business process models.
Approaches using requirements documents and models as input for the microservice candidate identification algorithm often times need to pre-process the data to extract the relevant information, as the documents are not intended to be directly read by a machine. /* TODO: find reference */
In many cases, requirements documents and models are no longer available for legacy systems, which makes this approach less suitable for automated microservice identification.

#citeauthor(<ddd_approach_automatic>) use domain-driven design techniques to extract functional dependencies from the software design as starting point in microservice identification.
#citeauthor(<problem_frames_approach>) tackle requirements engineering using problem frames.
#citeauthor(<design_model_identification>) use schematic design documents in XML format as input for the algorithm.

// Design documents
Design documents created by software architects are machine-readable representations of the software system.
They are deliverables produced during the design phase of the software development life cycle. /* TODO: find reference */
Design documents include API specifications, UML diagrams (such as class diagrams and sequence diagrams), and entity-relationship diagrams.
Techniques using design documents either use a domain-driven approach, or a data-driven approach.
Domain-driven approaches use domain-specific knowledge to identify microservice candidates, while data-driven approaches use knowledge about data storage and data flow to identify microservice candidates.
Similar to requirements documents and models, design documents are often not available for legacy systems, although some design documents can be reconstructed from the software system (e.g., reverse engineering entity-relationship diagrams from the database schema).

#citeauthor(<migrating_legacy_software>) enumerate three decomposition methods depending on the requirements of the business: (1) code based, (2) business domain based, and (3) data storage based.
The authors suggest a code based approach as suitable for automatic decomposition of monoliths.

#citeauthor(<cromlech_semiautomated_monolith>) takes a different approach to the problem, using a data-driven approach combined with a domain-driven approach.
Software architects describe the software system using a custom architecture description language, and the tool developed by the authors is able to identify microservice candidates.
The tool can be persuaded to generate different, more efficient decompositions when given domain-driven requirements.

// Codebase
A third category of #acr("SDLC") artifacts is the executable codebase of the software system.
(Static) analysis on the source code of the application can be used to identify microservice candidates.
Furthermore, also indirect information, such as revision history, can be used to complement the decomposition approach.

For example, #citeauthor(<multiobjective_optimization_decomposition>) consider object-oriented classes as units of business capability, as do #citeauthor(<extraction_of_microservices>).
The authors of the latter paper remark that increasing the granularity from classes to methods and functions has the potential to improve the quality of the decomposition.

The decomposition process described by #citeauthor(<extraction_of_microservices>) also uses the revision history of the software system to identify suitable microservice candidates.

// Execution
Finally, data can also be collected during the runtime of the software system.
Execution data includes log files, execution traces, and performance metrics.

An example of an approach using execution traces as input is described by #citeauthor(<execution_trace_identification>).
Using software probes inserted into the bytecode of software systems, the authors are able to monitor execution paths.
Additionally, various metrics such as processor time and memory usage are collected.

=== Algorithm

The identified classes of microservice candidate identification algorithms are described in @slr_algorithms.
// TODO: note about how most algorithms are single- or multi-objective optimization algorithms for graph clustering to find a Pareto-optimal solution

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, left, left),
    [*Type*], [*Example algorithms*], [*Publications*],
    "Machine Learning",
    "K-Means, Hierarchical Agglomerative Clustering, Affinity Propagation, SArF",
    [
    ],

    "Graph algorithms",
    "Kruskal, Louvain method",
    [
    ],

    "Evolutionary algorithms",
    "NSGA-II, NSGA-III",
    [
    ],

    "Optimization algorithms",
    "Linear optimization",
    [
    ],
  ),
  caption: [Microservice identification algorithm]
) <slr_algorithms>

// Clustering
// TODO: explain graphs in mathematical terms
Publications using a clustering approach to identify microservice candidates typically collect static information from the software system, and represent it as a directed graph.
The graph exposes the relationship between the classes, modules, or components.
The nodes of the graph represent the classes, modules, or components, and the edges the function or method calls between them.
Often the edges are weighted, representing the frequency or cost of the calls.
Using this information, the graph is then divided into several clusters, each indicating a microservice candidate.
Typical clustering algorithms used for this purpose are K-Means, Kruskal's algorithm @algorithm_design, and agglomerative clustering.

#citeauthor(<extraction_of_microservices>) use Kruskal's algorithm @algorithm_design to isolate microservice candidates.

// Evolutionary algorithms
The second class of algorithms identified in the literature is evolutionary algorithms.
Evolutionary algorithms, and in particular genetic algorithms, are algorithms aimed at solving optimization problems by borrowing techniques from natural selection and genetics.
Such algorithms typically operate iteratively, selecting the best solutions from a population at each iteration (called a generation), and then combining the selected solutions to create new combinations for the next generation.
The process is then repeated until certain criteria are met, for example a maximum number of generations, convergence of the population, or a quality indicator.

Examples of publications using Non-Dominated Sorting Algorithm II (NGSA-II) as multi-objective optimization algorithm to identify microservice candidates are #citeauthor(<design_model_identification>), #citeauthor(<multiobjective_optimization_decomposition>), and #citeauthor(<execution_trace_identification>)

// TODO: explanation about machine learning/optimization
The authors of #citeauthor(<cromlech_semiautomated_monolith>) incorporated a linear optimization solver in their tool to identify microservice candidates.

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
    ],

    "Coupling",
    [
    ],

    "Complexity",
    [
    ],

    "CPU usage",
    [
    ],

    "Memory usage",
    [
    ],

    "Network overhead",
    [
    ],

    "Modularity",
    [
    ],

    "Instability",
    [
    ],

    "Similarity",
    [
    ],

    "Precision/recall",
    [
    ],

    "Other metrics", // Team size Reduction, Average Domain Redundancy, Dedication Score, Matching Degree, Autonomy
    [
    ],
  ),
  caption: [Evaluation metrics]
) <slr_metrics>

// TODO: summary/conclusion

