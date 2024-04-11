#import "@preview/acrostiche:0.3.1": *
#import "@preview/sourcerer:0.2.1": code

#import "/helpers.typ": *

#let publications = yaml("/bibliography/literature-review.yml")

= Automated modularization <automatedmodularization>

// Enumeration of existing automated technologies for modularization of monolith codebases
// Answer to Research Question 2.

In this chapter, we investigate the state of the art in automated technologies for modularization of monolith codebases.
Using a systematic literature review, we identified and categorized existing literature on automated modularization of monolith codebases.
We also provided a brief overview of the most relevant approaches and tools.

== Plan

Using the systematic literature review, we answered the following research question:

*Research Question 2*: What are the existing approaches and tools for automated microservice candidate identification in monolith codebases?

The motivation for the research question is discussed in @introduction.

In current literature, several systematic mapping studies related to microservices architecture have been conducted @alshuqayran_etal_2016 @pahl_jamshidi_2016, as well as systematic literature reviews related to microservice decomposition /* TODO: systematic literature reviews */.
However, in these studies the methods described are mainly used as an aid for the software architect when identifying microservice candidates.
Therefore, we believe that there is a need for a systematic literature review aimed at summarizing existing literature regarding automated and semi-automated methods for modularization of monolith codebases.

Automated methods for modularization are techniques that autonomously perform the entire decomposition process, without requiring intervention of a software architect.
The resulting architecture is then presented to the software architect for validation and implementation.
Semi-automated methods for modularization are techniques that assist the software architect in the decomposition process, but do not perform the entire process autonomously.
The software architect is required to make decisions during the process, and is left with several final proposals to choose from.
Automated methods are of particular interest, as they take away the manual effort required from the software architect to analyze and decompose the monolith codebase.

As a search strategy, the following platforms were queried for relevant publications:
+ IEEE Xplore#footnote[#link("https://ieeexplore.ieee.org/")[https://ieeexplore.ieee.org/]]
+ ACM Digital Library#footnote[#link("https://dl.acm.org/")[https://dl.acm.org/]]

The platforms were selected based on their academic relevance, as they contain a large number of publications in the field of software engineering.
Furthermore, the platforms also contain only peer-reviewed publications, which ensures a certain level of quality in the publications.

Based on a list of relevant topics, we used a combination of related keywords to formulate the search query.
We refrained from using more generic keywords, such as "architecture" or "design", as they would yield too many irrelevant results.
The topics relevant for the search query are:

- *Architecture*: the architectural styles being discussed in the publications.
  #linebreak()
  Keywords: _microservice, monolith, modular monolith_
- *Modularization*: the process of identifying and decomposing modules in a monolith architecture.
  #linebreak()
  Keywords: _service identification, microservice decomposition, monolith modularization_
- *Technology*: the technologies, algorithms, or methods for modularization.
  #linebreak()
  Keywords: _automated tool, machine learning, static analysis, dynamic analysis, hybrid analysis_

The resulting search query can be expressed as follows:

#figure(
  code(
    ```sql
      (('microservice*' IN title OR abstract) OR
       ('monolith*' IN title OR abstract))
    AND
      (('decompos*' IN title OR abstract) OR
       ('identificat*' IN title OR abstract))
    AND
      ('automate*' IN title OR abstract)
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
    stroke: (x: none),
    align: (center, left),
    [], [*Criteria*],
    "Inclusion",
    [
      - Title, abstract or keywords include the search terms
      - Conference papers, research articles, blog posts, or other publications
      - Publications addressing (semi-)automated methods or technologies
    ],
    "Exclusion",
    [
      - Publications in languages other than English
      - Publications not available in full text
      - Publications using the term "microservice", but not referring to the architectural style
      - Publications aimed at greenfield #footnote[Development of new software systems lacking constraints imposed by prior work @project_management] or brownfield #footnote[Development of new software systems in the presence of legacy software systems @project_management] development of systems using microservices architecture
      - Publications published before 2014, as the definition of "microservices" as an architectural style is inconsistent before 2014 @pahl_jamshidi_2016
      - Publications addressing manual methods or technologies
      - Surveys, opinion pieces, or other non-technical publications
    ]
  ),
  caption: [Inclusion and exclusion criteria]
) <slr_criteria>

As a final step, the publications were subjected to a validation scan to ensure relevance and quality.
To assess the quality, we mainly focused on the technical soundness of the method or approach described in the publication.

The quality of the publication was assessed based on the following criteria:

- The publication is peer-reviewed or published in a respectable journal
- The publication thoroughly describes the technical aspects of the method or approach
- The publication includes a validation phase or case study demonstrating the effectiveness of the method or approach

This step is necessary to ensure that the selected publications are relevant to the research question and that the results are not biased by low-quality publications.

Once a final selection of publications was made, the resulting publications were qualitatively reviewed and categorized based on the method or approach described.

#pagebreak()

== Conduct

Using the search strategy outlined in the previous section, we queried the selected platforms and found a total of #publications.platforms.values().map(p => p.total).sum() publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, center, center),
    [*Platform*], [*Search results*], [*Selected publications*],
    // (("All Metadata":"microservices" OR "All Metadata":"monolith") AND ("All Metadata":"decomposition" OR "All Metadata":"identification"))
    [IEEE Xplore], [#publications.platforms.ieee.total], [#publications.platforms.ieee.selected],
    // Title:(microservice) AND AllField:(microservice OR monolith) AND AllField:(decomposition OR identification OR refactor) AND AllField:(automated)
    [ACM Digital Library], [#publications.platforms.acm.total], [#publications.platforms.acm.selected],
    [Snowballing], none, [#publications.snowballing.total],
    [*Total*], [#publications.platforms.values().map(p => p.total).sum()], [#(publications.platforms.values().map(p => p.selected).sum() + publications.snowballing.total)],
  ),
  caption: "Summary of search results"
) <slr_search_results>

After applying the inclusion/exclusion criteria, we selected #publications.platforms.values().map(p => p.selected).sum() publications for inclusion in the systematic literature review.
Of these publications, #publications.platforms.values().map(p => p.primary.len()).sum() are primary studies, and #publications.platforms.values().map(p => p.secondary.len()).sum() are secondary studies.
The secondary studies were used as a starting point for the snowballing process, which resulted in #publications.snowballing.total additional publications being included in the systematic literature review.
For a list of the selected publications, see @slr_publications.

#figure(
  include("/figures/slr_by_year.typ"),
  caption: "Distribution of selected publications by year"
) <slr_by_year>

The selected publications range in publication date from 2014 to 2024, with a peak in 2022.
Few publications were selected in the first part of the interval, picking up in the later years with a steady increase in the number of publications.

From the selected publications, we extracted relevant information, such as:

- The type of approach or technique described (automated, semi-automated)
- The input data used for the microservice candidate identification process
- The algorithms used in the microservices candidate identification process
- The quality metrics used in the evaluation of the decomposition

#citeauthor(<kitchenham_charters_2007>) suggest that the data extraction process should be performed by at least two researchers to ensure the quality and consistency of the extracted data.
However, due to resource constraints, the data extraction was performed by a single researcher.
To prevent bias and ensure the quality of the data extraction, the results were validated by a re-test procedure where the researcher performs a second extraction from a random selection of the publications to check the consistency of the extracted data.

#pagebreak()

== Report

The publications selected for inclusion in the systematic literature review were qualitatively reviewed and categorized in three dimensions.
The categorization was only performed on the primary studies, as the secondary studies already aggregate and categorize primary studies.
The secondary studies were used to perform the snowballing process, which resulted in additional primary studies being included in the systematic literature review.

First, we categorized the publications based on the #acr("SDLC") artifact used as input for the microservice candidate identification algorithm.
Each artifact category has an associated collection type: either static, dynamic, or hybrid. @bajaj_etal_2021.
Static collection describes a #acr("SDLC") artifact that was collected without executing the software (e.g. source code or binary code), while dynamic collection describes a #acr("SDLC") artifact that was collected after or during execution of the software (e.g. execution logs). /* TODO: reference */
/* TODO: elaborate more on the categories */
Some publications describe methods or algorithms that use a combination of #acr("SDLC") artifacts, which is categorized as hybrid. /* TODO: is hybrid a separate category? */

Second, we categorized the publications based on the class of algorithm(s) used for microservice candidate identification.
We based the classification of the algorithms on #citeauthor(<abdellatif_etal_2021>), who identified six types of service identification algorithms.

Third, the publications were also categorized by the quality metrics used for evaluation the proposed decompositions.
