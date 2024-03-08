= Automated modularization <automatedmodularization>

// Enumeration of existing automated technologies for modularization of monolith codebases
// Answer to Research Question 2.

In this chapter, we will investigate the state of the art in automated technologies for modularization of monolith codebases.
Using a systematic literature review, we will identify and categorize existing literature regarding automated modularization of monolith codebases.
We will also provide a brief overview of the most relevant approaches and tools.

// TODO: snowballing
A systematic literature review is used to identify, evaluate and interpret research literature for a given topic area, or research question @systematic_literature_review_guidelines.
The systematic nature of systematic literature reviews reduces bias through a well-defined sequence of steps to identify and categorize existing literature, although publication bias still has to be considered.
Studies directly researching the topic area are called _primary_ studies, systematic studies aggregating and summarizing primary studies are called _secondary_ studies.
_Tertiary_ studies are systematic studies aggregating and summarizing secondary studies.

The literature review is conducted using a three-step protocol as defined by #cite(<systematic_literature_review_guidelines>, form: "author") @systematic_literature_review_guidelines:

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

Using the systematic literature review, we want to answer the following research question:

*Research Question 2*: What are the existing approaches and tools for automated modularization of monolith codebases?

The motivation for the research question is discussed in @introduction.

Although systematic mapping studies related to microservices exist @systematic_mapping_study_1 @systematic_mapping_study_2, we are not aware of any systematic literature review specifically focusing on automated modularization of monolith codebases.
Therefore, we believe that there is a need for a systematic literature review to identify and categorize existing literature regarding automated modularization of monolith codebases.

As a search strategy, the following platforms will be queried:
+ IEEE Xplore
+ ACM Digital Library
+ arXiv
+ Google scholar

Based on a list of relevant topics, we will use a combination of related keywords to formulate the search query.
Depending on the platform, the search query will be adapted to the specific search syntax of the platform.
The topics relevant for the search query are:

- _Architecture_: the architectural styles being discussed in the publications.
  #linebreak()
  Keywords: microservice, monolith, modular monolith
- _Modularization_: the process of identifying and decomposing modules in a monolith architecture.
  #linebreak()
  Keywords: service identification, decomposition, modularization
- _Technology_: the technologies, algorithms, or methods for modularization.
  #linebreak()
  Keywords: automated tool, machine learning, static analysis, dynamic analysis, hybrid analysis

Based the inclusion/exclusion criteria in @slr_criteria, the results will be filtered, and the relevant studies will be selected for inclusion in the systematic literature review.

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
      - Publications addressing automated technologies, algorithms, or methods
    ],
    "Exclusion",
    [
      - Publications in languages other than English
      - Publications not available in full text
      - Publications using the term "microservice", but not referring to the architectural style
      - Publications aimed at greenfield development of microservice-based systems
      - Publications published before 2014, as the definition of "microservices" as an architectural style is inconsistent before @systematic_mapping_study_2
      - Publications addressing manual technologies, algorithms, or methods
    ]
  ),
  caption: [Inclusion and exclusion criteria]
) <slr_criteria>

Once a selection of publications is made, the resulting selection will be qualitatively assessed and categorized based on the type of approach or technique they describe.
The categories are as follows:

// TODO: classification of categories is a result of the review, and doesn't belong in the planning phase?
+ Static analysis
+ Dynamic analysis
+ Hybrid analysis
+ Machine learning
+ Other

== Conduct

Using the search strategy outlined in the previous section, we queried the selected platforms and found a total of XX publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, center, center),
    [*Platform*], [*Search results*], [*Selected publications*],
    // (("All Metadata":"microservices" OR "All Metadata":"monolith") AND ("All Metadata":"decomposition" OR "All Metadata":"identification"))
    [IEEE Xplore], "337", "2",
    [*Total*], "337", "2",
  ),
  caption: "Summary of search results"
) <slr_search_results>
    

After applying the inclusion/exclusion criteria, we selected XX publications for inclusion in the systematic literature review.
@slr_publications provides a summary of the selected publications.

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (right, left),
    [], [*Publication*],
    "1", cite(<comparison_static_dynamic_analysis>, form: "full"),
    "2", cite(<extraction_of_microservices>, form: "full"),
  ),
  caption: [Selected publications]
) <slr_publications>
