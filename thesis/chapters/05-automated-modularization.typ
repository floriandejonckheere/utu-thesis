#import "@preview/acrostiche:0.3.1": *

= Automated modularization <automatedmodularization>

// Enumeration of existing automated technologies for modularization of monolith codebases
// Answer to Research Question 2.

In this chapter, we investigate the state of the art in automated technologies for modularization of monolith codebases.
Using a systematic literature review, we identified and categorized existing literature regarding automated modularization of monolith codebases.
We also provided a brief overview of the most relevant approaches and tools.

// TODO: snowballing
A systematic literature review is used to identify, evaluate and interpret research literature for a given topic area, or research question @systematic_literature_review_guidelines.
The systematic nature of systematic literature reviews reduces bias through a well-defined sequence of steps to identify and categorize existing literature, although publication bias still has to be considered.
Studies directly researching the topic area are called _primary_ studies, systematic studies aggregating and summarizing primary studies are called _secondary_ studies.
_Tertiary_ studies are systematic studies aggregating and summarizing secondary studies.

The literature review was conducted using a three-step protocol as defined by #cite(<systematic_literature_review_guidelines>, form: "author") @systematic_literature_review_guidelines:

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
+ ACM Digital Library
+ arXiv
+ Google scholar

Based on a list of relevant topics, we used a combination of related keywords to formulate the search query.
The search query was adapted to the specific search syntax of the platform.
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
In the end, /* TODO: amount */ publications were selected for inclusion in the systematic literature review.

Once a final selection of publications was made, the resulting publications were qualitatively reviewed and categorized based on the type of approach or technique they describe.

== Conduct

Using the search strategy outlined in the previous section, we queried the selected platforms and found a total of /* TODO: amount */ publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, center, center),
    [*Platform*], [*Search results*], [*Selected publications*],
    // (("All Metadata":"microservices" OR "All Metadata":"monolith") AND ("All Metadata":"decomposition" OR "All Metadata":"identification"))
    [IEEE Xplore], "337", "" /* TODO: amount */,
    [*Total*], "" /* TODO: amount */, "" /* TODO: amount */,
  ),
  caption: "Summary of search results"
) <slr_search_results>
    

After applying the inclusion/exclusion criteria, we selected /* TODO: amount */ publications for inclusion in the systematic literature review.
@slr_publications provides a summary of the selected publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (right, left, left),
    [], [*Type*], [*Publication*],
    "1", "Proceedings", cite(<comparison_static_dynamic_analysis>, form: "full"),
    "2", "Proceedings", cite(<extraction_of_microservices>, form: "full"),
  ),
  caption: [Selected publications]
) <slr_publications>

== Report

The publications selected for inclusion in the systematic literature review were qualitatively reviewed and categorized two-fold.
// TODO: should be three-fold? (artifact, algorithm, metric)

First, we categorized the publications based on the #acr("SDLC") artifact they use as input for the microservice candidate identification algorithm.
Each artifact category has an associated collection type, either static, dynamic, or hybrid. @prescriptive_model_migration.
Static collection describes a #acr("SDLC") artifact that was collected without executing the software, while dynamic collection describes a #acr("SDLC") artifact that was collected after or during execution of the software. /* TODO: elaborate more and link sources */
Some publications describe algorithms or techniques that use a combination of #acr("SDLC") artifacts, which we categorized as hybrid.

Second, we categorized the publications based on the algorithm, and the type of algorithm used for microservice candidate identification.

=== #acr("SDLC") artifact

The identified #acr("SDLC") artifact categories used as input for the microservice candidate identification algorithm are described in @slr_artifacts.
The categories are based on #cite(<prescriptive_model_migration>).

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

#cite(<ddd_approach_automatic>, form: "prose") use domain-driven design techniques to extract functional dependencies from the software design as starting point in microservice identification.
#cite(<problem_frames_approach>, form: "prose") tackle requirements engineering using problem frames.
#cite(<design_model_identification>, form: "prose") use schematic design documents in XML format as input for the algorithm.

// Design documents
Design documents created by software architects are machine-readable representations of the software system.
They are deliverables produced during the design phase of the software development life cycle. /* TODO: find reference */
Design documents include API specifications, UML diagrams (such as class diagrams and sequence diagrams), and entity-relationship diagrams.
Techniques using design documents either use a domain-driven approach, or a data-driven approach.
Domain-driven approaches use domain-specific knowledge to identify microservice candidates, while data-driven approaches use knowledge about data storage and data flow to identify microservice candidates.
Similar to requirements documents and models, design documents are often not available for legacy systems, although some design documents can be reconstructed from the software system (e.g., reverse engineering entity-relationship diagrams from the database schema).

#cite(<migrating_legacy_software>, form: "prose") enumerate three decomposition methods depending on the requirements of the business: (1) code based, (2) business domain based, and (3) data storage based.
The authors suggest a code based approach as suitable for automatic decomposition of monoliths.

#cite(<cromlech_semiautomated_monolith>, form: "prose") takes a different approach to the problem, using a data-driven approach combined with a domain-driven approach.
Software architects describe the software system using a custom architecture description language, and the tool developed by the authors is able to identify microservice candidates.
The tool can be persuaded to generate different, more efficient decompositions when given domain-driven requirements.

// Codebase
A third category of #acr("SDLC") artifacts is the executable codebase of the software system.
(Static) analysis on the source code of the application can be used to identify microservice candidates.
Furthermore, also indirect information, such as revision history, can be used to complement the decomposition approach.

For example, #cite(<multiobjective_optimization_decomposition>, form: "prose") consider object-oriented classes as units of business capability.

// Execution
Finally, data can also be collected during the runtime of the software system.
Execution data includes log files, execution traces, and performance metrics.

An example of an approach using execution traces as input is described by #cite(<execution_trace_identification>, form: "prose").
Using software probes inserted into the bytecode of software systems, the authors are able to monitor execution paths.
Additionally, various metrics such as processor time and memory usage are collected.

=== Algorithm

The identified classes of microservice candidate identification algorithms are described in @slr_algorithms.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, left, left),
    [*Type*], [*Algorithms*], [*Publications*],
    "Clustering",
    "K-Means, DBSCAN, OPTICS, BIRCH, Agglomerative",
    [],

    "Genetic algorithms",
    "NSGA-II",
    [
      @multiobjective_optimization_decomposition
      @design_model_identification
      @execution_trace_identification
    ],

    "Machine learning/optimization",
    "Neural networks, Support Vector Machines",
    [
      @cromlech_semiautomated_monolith
    ],
  ),
  caption: [Microservice identification algorithm]
) <slr_algorithms>

// TODO: explanation about clustering

// TODO: explanation about genetic algorithms
Examples of publications using Non-Dominated Sorting Algorithm II (NGSA-II) as multi-objective optimization algorithm to identify microservice candidates are #cite(<design_model_identification>, form: "prose"), #cite(<multiobjective_optimization_decomposition>, form: "prose"), and #cite(<execution_trace_identification>, form: "prose")

// TODO: explanation about machine learning/optimization
The authors of #cite(<cromlech_semiautomated_monolith>, form: "prose") incorporated a linear optimization solver in their tool to identify microservice candidates.

// TODO: summary/conclusion
