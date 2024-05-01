#import "@preview/acrostiche:0.3.1": *
#import "@preview/sourcerer:0.2.1": code

#import "/helpers.typ": *

= Automated modularization <automatedmodularization>

In this chapter, we investigate the state of the art in (semi-)automated technologies for modularization of monolith codebases.
Using a systematic literature review, we identify and categorize existing literature on (semi-)automated modularization of monolith codebases.
We focus in particular on the identification of microservices candidates in monolith codebases, as this is a crucial step in the migration from monolith to microservices architecture.
Using the systematic literature review, we answer the following research question:

*Research Question 2*: What are the existing approaches and tools for (semi-)automated microservice candidate identification in monolith codebases?

The motivation behind the research question is discussed in @introduction.

== Plan

In the current literature, several systematic mapping studies related to microservices architecture have been conducted @pahl_jamshidi_2016, @alshuqayran_etal_2016, as well as systematic literature reviews related to microservice candidate identification @abgaz_etal_2023, @schmidt_thiry_2020.
However, the methods discussed in these studies are mostly aimed at assisting the software architect in identifying microservice candidates, rather than providing automated processes.
Therefore, we believe that there is a need for a systematic literature review aimed at summarizing existing literature regarding (semi-)automated methods for modularization of monolith codebases.

Automated methods for modularization are techniques that autonomously perform the decomposition process, without requiring intervention of a software architect.
The resulting architecture can then be validated and implemented by the software architect.
Semi-automated methods for modularization are techniques that assist the software architect in the decomposition process, but do not perform the entire process autonomously.
The software architect is required to make decisions during the process, and is often left with several final proposals to choose from.
Automated methods are of particular interest, as they take away the manual effort required from the software architect to analyze and decompose the monolith codebase.

As a search strategy, the following platforms were queried for relevant publications:
+ IEEE Xplore#footnote[#link("https://ieeexplore.ieee.org/")[https://ieeexplore.ieee.org/]]
+ ACM Digital Library#footnote[#link("https://dl.acm.org/")[https://dl.acm.org/]]

The platforms were selected based on their academic relevance, as they contain a large number of publications in the field of software engineering.
Furthermore, the platforms also contain only peer-reviewed publications, which ensures a certain level of quality in the publications.

Based on a list of relevant topics, we used a combination of related keywords to formulate the search query.
We refrained from using more generic keywords, such as "architecture" or "design", as they would yield too many irrelevant results.
The topics relevant for the search query are:

- *Architecture*: the architectural styles discussed in the publications
  #linebreak()
  Keywords: _microservice, monolith, modular monolith_
- *Modularization*: the process of identifying and decomposing modules in a monolith architecture
  #linebreak()
  Keywords: _service identification, microservice decomposition, monolith modularization_
- *Technology*: the methods or technologies used for modularization
  #linebreak()
  Keywords: _automated tool, machine learning, static analysis, dynamic analysis, hybrid analysis_

We formulated the search query by combining the keywords related to the topics.
It can be expressed as the following boolean query:

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
Snowballing is a research technique used to find additional publications of interest by following the references of the selected publications @wohlin_2014.

Based the inclusion/exclusion criteria in @slr_criteria, the results were filtered, and the relevant studies were selected for inclusion in the systematic literature review.

#figure(
  table(
    columns: (14%, auto),
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
      - Publications aimed at greenfield #footnote[Development of new software systems lacking constraints imposed by prior work @gupta_2011] or brownfield #footnote[Development of new software systems in the presence of legacy software systems @gupta_2011] development of systems using microservices architecture
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

Once a final selection of publications was made, the resulting publications were reviewed, relevant information was extracted, and the publications were categorized based on the methods or approaches described.

#pagebreak()

== Conduct

Using the search strategy outlined in the previous section, we queried the selected platforms and found a total of #slr.platforms.values().map(p => p.total).sum() publications.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, center, center),
    [*Platform*], [*Search results*], [*Selected publications*],
    // (("All Metadata":"microservices" OR "All Metadata":"monolith") AND ("All Metadata":"decomposition" OR "All Metadata":"identification"))
    [IEEE Xplore], [#slr.platforms.ieee.total], [#slr.platforms.ieee.selected],
    // Title:(microservice) AND AllField:(microservice OR monolith) AND AllField:(decomposition OR identification OR refactor) AND AllField:(automated)
    [ACM Digital Library], [#slr.platforms.acm.total], [#slr.platforms.acm.selected],
    [Snowballing], none, [#slr.snowballing.total],
    [*Total*], [#slr.platforms.values().map(p => p.total).sum()], [#(slr.platforms.values().map(p => p.selected).sum() + slr.snowballing.total)],
  ),
  caption: [Summary of search results]
) <slr_search_results>

After applying the inclusion/exclusion criteria, we selected #slr.platforms.values().map(p => p.selected).sum() publications for inclusion in the systematic literature review.
Of these publications, #slr.platforms.values().map(p => p.primary.len()).sum() are primary studies, and #slr.platforms.values().map(p => p.secondary.len()).sum() are secondary studies.
The secondary studies were used as a starting point for the snowballing process, which resulted in #slr.snowballing.total additional publications being included in the systematic literature review.
For a list of the selected publications, see @slr_publications.

#figure(
  include("/figures/06-automated-modularization/publications-by-year.typ"),
  caption: [Distribution of publications by year]
) <slr_by_year>

The selected publications range in publication date from 2014 to 2024, with a peak in 2022.
Fewer publications were selected during the first part of the interval, but the number of publications selected increased significantly in the second part of the decade.

From the selected publications, we extracted relevant information, such as:

- The type of method or approach described (automated, semi-automated)
- The input data used for the microservice candidate identification process
- The algorithms used in the microservices candidate identification process
- The quality metrics used in the evaluation of the decomposition

#cite_full(<kitchenham_charters_2007>) suggest that the data extraction process should be performed by at least two researchers to ensure the quality and consistency of the extracted data.
However, due to resource constraints, the data extraction was performed only by one researcher.
To prevent bias and ensure the quality of the data extraction, the results were validated by a re-test procedure where the researcher performed a second extraction from a random selection of the publications to check the consistency of the extracted data.

#pagebreak()

== Report

The publications selected for inclusion in the systematic literature review were qualitatively reviewed and categorized in three dimensions.
The categorization was only performed on the primary studies, as the secondary studies already aggregate and categorize primary studies.
The secondary studies were used to perform the snowballing process, which resulted in additional primary studies being included in the systematic literature review.

First, we categorized the publications based on the #acr("SDLC") artifact used as input for the microservice candidate identification process.
Each artifact category has an associated collection type: either static, dynamic, or hybrid @bajaj_etal_2021.
Static collection describes a #acr("SDLC") artifact that was collected without executing the software (e.g. source code or binary code), while dynamic collection describes a #acr("SDLC") artifact that was collected after or during execution of the software (e.g. call trace or execution logs). /* TODO: reference */
/* TODO: elaborate more on the categories */
Some publications describe methods or algorithms that use a combination of #acr("SDLC") artifacts, which is categorized as hybrid. /* TODO: is hybrid a separate category? */

Second, we categorized the publications based on the class of algorithm(s) used for microservice candidate identification.
We based the classification of the algorithms on the work of #cite_full(<abdellatif_etal_2021>), who identified six types of microservice candidate identification algorithms.

Third, the publications were also categorized by the quality metrics used for evaluation of the proposed decompositions.
