#import "@preview/acrostiche:0.3.1": *

= Introduction <introduction>

// General introduction to the topic

== Scope and goal

// Scope of the research thesis

This research is centered around three research questions:

// TODO: for each research question, specify motivation and approach?

*Research Question 1*: What are the challenges and opportunities of the modular monolith architecture compared to traditional monolithic and microservices architectures?

*Research Question 2*: What are the existing approaches and tools for automated microservice candidate identification in monolith codebases?

*Research Question 3*: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?

To answer the first research question, we will first define the modular monolith architecture, and examine what sets it apart from monolithic and microservices architectures.
Then, we will proceed to investigate the merits and drawbacks of the software architecture when applied to an existing codebase.

For the second research question, we will enumerate the existing technologies to aid modularization of monolithic codebases, and choose one automated technology for further examination.
_(Automated technology)_ will then be implemented for a given use case, and compared to manual modularization efforts in terms of accuracy, efficiency, development velocity.
This comparison will help us to answer the third research question.

The goal of this research can be summarized as follows:

+ Investigate the merits and drawbacks of the modular monolith architecture
+ Investigate the use of automated technologies to modularize a monolithic architecture

The proposed solution will add value to the field of software engineering, and will be able to be used as a base for future improvements regarding automated modularization of monolith codebases.

== Motivation

// Explanation about why and for whom the topic is relevant, and what the expected outcome of the thesis is

/* TODO: read "Migrating Legacy Software to Microservices Architecture */

== Methodology

// Explanation of the research methodology used

// TODO: first RQ solved by ad-hoc literature review (@ralph_baltes_2022)
// TODO: determine if second RQ is solved by systematic literature review, or mapping study? (@ralph_baltes_2022)
A literature review is conducted to answer the first and second research question.
For the first research question, the study aims to find a definition of the modular monolith architecture, and to list the advantages and disadvantages of the architecture based on existing literature.
For the second research question, the state of the art in automated modularization technologies is reviewed and summarized.

The third research question is answered by choosing the most appropriate automated technology, and implementing it for a given use case.
The implementation is then evaluated based on quantitative and qualitative metrics, and compared to manual modularization efforts.

Finally, the findings are summarized, and an outlook on future work is given.

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

== Outline

// General outline of the sections
The thesis is divided into three parts.

The first part comprises the background and related work.
In @introduction, the scope and goal of the research is defined, and the research questions are formulated.
The stakeholders are identified, and the methodology is explained.
@background introduces the reader to the research background and necessary concepts.
In @relatedwork, the existing literature is reviewed, and the state of the art is presented.

The second part of the thesis, starting with @modularmonolith, is dedicated to the first research question.
The modular monolith architecture is defined, and its merits and drawbacks are discussed.

The third part aims to solve the second and third research question.
@automatedmodularization gives an introduction into the automated modularization of monolith codebases, listing the existing technologies.
It then continues to focus on one automated technology, _(automated technology)_, and explains its implementation.
@casestudy applies _(automated technology)_ on a given case study, and compares it to manual modularization efforts.

Finally, @conclusion summarizes the findings, and gives an outlook on future work.
