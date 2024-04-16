#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Methodology <methodology>

This chapter describes the methodology used in this thesis in detail.

// Ad hoc review (@ralph_baltes_2022)
To answer the first research question, an ad hoc review is conducted, picking a select number of papers that define and discuss the modular monolith architecture.
An ad hoc review is a less formal review process, where the researcher discusses purposefully selected papers to gain an understanding of a specific topic @ralph_baltes_2022.

For the second research question, a systematic literature review is conducted to identify and summarize the state of the art in automated modularization technologies.
Systematic literature reviews are more formal than ad hoc reviews, and follow a well-defined process to reduce bias and increase the reliability of the results.

The third research question is answered by designing an approach based on the results of the systematic literature review, and implementing it for a case study.
The effectiveness of the approach is then evaluated based on quantitative and qualitative metrics.

==== Systematic literature review

A systematic literature review is used to identify, evaluate and interpret research literature for a given topic area, or research question @kitchenham_charters_2007.
The systematic nature of systematic literature reviews reduces sampling bias through a well-defined sequence of steps to identify and categorize existing literature, and applies techniques such as forward and reverse snowballing to reduce publication bias @ralph_baltes_2022.
Studies directly researching the topic area are called _primary_ studies, systematic studies aggregating and summarizing primary studies are called _secondary_ studies.
_Tertiary_ studies are systematic studies aggregating and summarizing secondary studies.
Systematic literature reviews often only consider primary studies as they are considered the most reliable source of information, but may also include secondary studies if the primary studies are scarce, or as a means to identify primary studies.

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
The model is inspired by prior research and is designed to guide researchers through the process of analysis, creation, and evaluation of artifacts in information science.

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

In this thesis, we use the #acr("DSRP") as a guideline for the design, development, and evaluation of the automated modularization approach used in the case study.
We focus in particular on the design and development, demonstration, and evaluation steps.
