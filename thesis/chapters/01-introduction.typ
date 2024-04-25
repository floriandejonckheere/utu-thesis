#import "@preview/acrostiche:0.3.1": *

= Introduction <introduction>

// General introduction to the topic

In the past decade, software engineering has seen a radical shift in the way software is developed and deployed.
The rise in popularity of cloud computing and containerization has led to the emergence of microservices a new software architecture paradigm.
Microservices as an architectural style emphasize the development of small, distributed services that are deployed independently and communicate with each other over an internal network.
This approach has several benefits, including scalability and fault tolerance.
Many big and small organizations have adopted a microservices architecture to increase the flexibility of their software systems, and to enable faster development and deployment cycles.

Migrating monolith applications to a microservices architecture is not a trivial task.
It involves deep understanding of software engineering principles, the existing codebase, and the business domain.
Moreover, as larger and older applications typically have more technological debt, the process of migrating to microservices can be overly complex and error-prone.

In recent years, a new software architecture paradigm has emerged that takes a hybrid approach to monolith and microservices architectures.
The modular monolith architecture aims to combine the flexibility of using a microservices architecture with the simplicity of a monolith codebase.
The modular monolith application consists of multiple independent modules encapsulating a specific set of functionality.
The modules are developed in tandem, but deployed as single units.
This approach allows developers to rapidly build and deploy new features, while maintaining the flexibility and scalability of a microservices architecture.
As the code resides in the same codebase, developers can easily restructure and redefine the module boundaries.
This makes the modular monolith architecture an attractive option for organizations that want to migrate their monolith software systems to a more flexible and scalable architecture.

In this thesis, we aim to investigate the potential benefits of a modular monolith architecture, and how automated technologies can help software architects to migrate their monolith codebases to a modular monolith or microservices architecture.

== Motivation

The case study conducted in this thesis relates to a software system developed at Nipro Digital Technologies Europe, a Belgian software company that specializes in developing software solutions for the healthcare industry.
The application in question is a monolith application that has accumulated a significant amount of technical debt over the years, and might benefit from a modular monolith architecture.
It is the aim of this thesis to investigate the viability of applying automated modularization techniques to this software system, in order to pivot towards a modular monolith architecture.

/* TODO: read "Migrating Legacy Software to Microservices Architecture */

== Scope and goal

This research is centered around three research questions:

*Research Question 1*: What is the modular monolith architecture, and what sets it apart from monolith and microservices architectures?

*Research Question 2*: What are the existing approaches and tools for automated microservice candidate identification in monolith codebases?

*Research Question 3*: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?

The motivation behind the first research question is to investigate the potential merits and demerits of the modular monolith architecture with a particular focus on its application to migrating existing monolith codebases.
To answer this question, we will first define the modular monolith architecture using existing literature, and examine what sets it apart from monolith and microservices architectures.
Then, we will proceed to investigate the merits and demerits of the software architecture when applied to an existing codebase.

The second research question is motivated by the need for reducing the complexity and error-proneness of manual modularization efforts.
We will explore the existing automated technologies to aid modularization of monolith codebases in the literature.

Finally, the third research question is motivated by the fact that a lot of useful information is embedded in the source code repository of a software system, and how this information can be extracted to aid in the modularization process.
An approach for microservice candidate identification will be designed based on the review of existing technologies.
A prototype of the proposed solution will be implemented, and applied to a case study.
The results will be evaluated using a set of quality metrics, and its effectiveness will be discussed.

The goal of this research can be summarized as follows:

+ Investigate the merits and demerits of the modular monolith architecture
+ Investigate the use of automated technologies to modularize a monolith architecture

Although the proposed solution will be designed for a specific case study, the results can be generalized to other monolith codebases.

== Outline

The thesis is structured as follows.

In @introduction, the motivation behind the research is explained.
The scope and goal are defined, and the research questions are formulated.
@methodology describes the research methodology used in this thesis.
In @background the reader is introduced to the research background and necessary concepts.
@relatedwork discusses the related work in the field of the research topic.

@modularmonolith is dedicated to answering the first research question.
The modular monolith architecture is defined, and its merits and demerits are discussed.
The chapter also touches the concept of modularization and its relevance in software architecture.

The next chapters aim to solve the remaining research questions.
@automatedmodularization takes a deep dive into the existing technologies for automated modularization.
Based on this study, @proposedsolution then continues with a proposed solution for automated modularization.
In @casestudy, a case study is presented that applies the proposed solution to a real-world software system.
The results are then evaluated and discussed.

Finally, @conclusion summarizes the findings, discusses the validity of the research, and gives an outlook on future work.
