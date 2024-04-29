#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Methodology <methodology>

This chapter describes the methodology used in this thesis.

To answer the first research question, an ad hoc review of grey literature is conducted, picking a select number of publications that define and discuss the modular monolith architecture.
An ad hoc review is a less formal review process, where the researcher discusses purposefully selected publications to gain an understanding of a specific topic @ralph_baltes_2022.

For the second research question, a systematic literature review is conducted to identify and summarize the state of the art in (semi-)automated modularization technologies.
Systematic literature reviews are more formal than ad hoc reviews, and follow a well-defined process to reduce bias and increase the reliability of the results @ralph_baltes_2022.

The third research question is answered by designing an approach based on the results of the systematic literature review, and evaluating it in the context of a case study.
The effectiveness of the approach is then assessed based on a select set of quality metrics.

==== Systematic literature review

A systematic literature review is used to identify, evaluate and interpret research literature for a given topic area, or research question @kitchenham_charters_2007.
The methodological nature of systematic literature reviews reduces sampling bias through a well-defined sequence of steps to identify and categorize existing literature, and applies techniques such as forward and reverse snowballing to reduce publication bias @ralph_baltes_2022.
Studies directly researching the topic area are called _primary_ studies, systematic studies aggregating and summarizing primary studies are called _secondary_ studies.
_Tertiary_ studies are systematic studies aggregating and summarizing secondary studies.
Systematic literature reviews often only consider primary studies as they are considered the most reliable source of information @ralph_baltes_2022, but may also include secondary studies if the primary studies are scarce, or as a means to identify primary studies.

We conducted the systematic literature review in this thesis using the three-step protocol as defined by #cite_full(<kitchenham_charters_2007>).
@slr_process enumerates and succinctly describes the three steps of the protocol.

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
In particular, the research and design of the proposed solution follows the six-step #acr("DSRP") model @peffers_etal_2007.
The model is inspired by prior research and is designed to guide researchers through the process of analysis, creation, and evaluation of artifacts in information science.

The six steps of the process are:

+ *Problem identification and motivation*: research problem statement and justification for existence of a solution.
+ *Objectives*: definition of the objectives following the problem statement
+ *Design and development*: creation of the artifact
+ *Demonstration*: usage of the artifact to demonstrate its effectiveness in solving the problem
+ *Evaluation*: observation and measurement of how well the artifact supports a solution to the problem
+ *Communication*: transfer of knowledge about the artifact and the problem solution to the relevant audience

#figure(
  include("/figures/02-methodology/dsrp.typ"),
  caption: [Design Science Research Process @peffers_etal_2007]
) <dsrp>

@dsrp gives a visual overview of the #acr("DSRP") model.
The process is structured sequentially, however the authors suggest that researchers may proceed in a non-linear fashion, and start or stop at any step, depending on the context and requirements of the research.
In this thesis, we use the #acr("DSRP") as a guideline for the design, development, and evaluation of the microservice candidate identification approach used in the case study.
We focus in particular on the design and development, demonstration, and evaluation steps.
