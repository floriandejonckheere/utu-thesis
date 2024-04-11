#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Methodology <methodology>

// Explanation of the research methodology used

// TODO: first RQ solved by ad-hoc literature review (@ralph_baltes_2022)
// TODO: determine if second RQ is solved by systematic literature review, or mapping study? (@ralph_baltes_2022)
A literature review is conducted to answer the first and second research question.
For the first research question, the study aims to find a definition of the modular monolith architecture, and to list the advantages and disadvantages of the architecture based on existing literature.
For the second research question, the state of the art in automated modularization technologies is reviewed and summarized.

The third research question is answered by choosing the most appropriate automated technology, and implementing it for a given use case.
The implementation is then evaluated based on quantitative and qualitative metrics, and compared to manual modularization efforts.

Finally, the findings are summarized, and an outlook on future work is given.

==== Systematic literature review

// TODO: explain a bit more in detail
A systematic literature review is used to identify, evaluate and interpret research literature for a given topic area, or research question @kitchenham_charters_2007.
The systematic nature of systematic literature reviews reduces bias through a well-defined sequence of steps to identify and categorize existing literature, although publication bias still has to be considered /* TODO: reference */.
Studies directly researching the topic area are called _primary_ studies, systematic studies aggregating and summarizing primary studies are called _secondary_ studies.
_Tertiary_ studies are systematic studies aggregating and summarizing secondary studies.

The systematic literature review was conducted using the three-step protocol as defined by #citeauthor(<kitchenham_charters_2007>):

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (center, left, left),
    [], [*Step*], [*Activity*],
    "1", "Plan", "Identify the need for the review, specifying the research questions, and developing a review protocol",
    "2", "Conduct", "Identification and selection of literature, data extraction and synthesis",
    "3", "Report", "Evaluation and reporting of the results",
  ),
  caption: [Systematic literature review process]
) <slr_process>

==== Case study

For the case study, a #acr("DSRM") is adopted, which is a research paradigm for information systems research focused at creating and evaluating artifacts.
In particular, the research and design of the proposed solution follows the six-step #acr("DSRP") model @design_science_research_methodology.
Their model is based on prior research and is designed to guide researchers through the process of analysis, creation, and evaluation of artifacts.

The six steps of the process are:

+ *Problem identification and motivation*: Research problem statement and justification for existence of a solution.
+ *Objectives of a solution*: Definition of the objectives, derived from the problem statement.
+ *Design and development*: Creation of the artifact.
+ *Demonstration*: Usage of the artifact to demonstrate its effectiveness in solving the problem.
+ *Evaluation*: Observation and measurement of how well the artifact supports a solution to the problem.
+ *Communication*: Transfer of knowledge about the artifact and the problem solution to the relevant audience.

#v(2em)

#figure(
  include("/figures/dsrp.typ"),
  caption: [Design Science Research Process (DSRP)]
) <dsrp>

#v(2em)

The process is structured sequentially, however the authors suggests that researchers may proceed in a non-linear fashion, and start or stop at any step, depending on the context and requirements of the research.

In this thesis specifically, the DSRP is used to guide the design and development of the automated modularization technology, with a particular focus on the design and development, demonstration, and evaluation steps.
