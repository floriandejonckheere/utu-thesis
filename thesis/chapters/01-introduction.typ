#import "@preview/acrostiche:0.3.1": *

= Introduction <introduction>

// General introduction to the topic

In the past decade, software engineering has seen a radical shift in the way software is developed and deployed.
The rise in popularity of cloud computing and containerization has led to the emergence of microservices as a new software architecture paradigm.
Microservices as an architectural style emphasize the development of small, distributed services that are deployed independently and communicate with each other over an internal network.
This approach has numerous benefits, such as scalability and fault tolerance.
Many small and large organizations have adopted a microservices architecture to increase the flexibility of their software systems and to enable faster software development cycles.
Some organizations haven started to migrate their existing monolith applications to a microservices architecture to take advantage of these benefits.

Migrating monolith applications to a microservices architecture is not a trivial task.
It involves deep understanding of software engineering principles, the codebase of the application, and the business domain of the organization.
Moreover, as larger and older applications typically have more technological debt, the process of migrating to microservices can be overly complex and error-prone @lenarduzzi_etal_2020.
The initial investment in time and resources required to migrate to a microservices architecture is another factor that deters organizations from undertaking such a migration.
As a result, (semi-)automated technologies have been developed to assist the migration process, covering various aspects of the migration, such as analysis of the codebase, microservice candidate identification, and refactoring.

In recent years, a new software architecture paradigm has emerged that takes a hybrid approach to monolith and microservices architectures.
The modular monolith architecture aims to combine the flexibility of using a microservices architecture with the simplicity of a monolith codebase.
The modular monolith application consists of multiple independent modules encapsulating a specific set of functionality.
The modules are developed and deployed independently, but they reside in the same codebase.
This approach allows developers to rapidly introduce new features, while maintaining the flexibility and scalability of a microservices architecture.
As the code resides in the same codebase, developers can easily restructure and redefine the module boundaries.
This makes the modular monolith architecture an attractive option for organizations that want to migrate their monolith applications to a more flexible and scalable architecture, without the deterrents of a full microservices migration.

In this thesis, we aim to investigate the potential benefits of a modular monolith architecture, and how (semi-)automated technologies can help software architects to migrate their monolith codebases to a modular monolith or microservices architecture.

== Motivation

The case study conducted in this thesis relates to a software system developed at Nipro Digital Technologies Europe NV#footnote[#link("https://www.niprodigital.com")[https://www.niprodigital.com]], a Belgian software company that specializes in developing software systems for the healthcare industry.
The application in question is a monolith application that has accumulated a significant amount of technical debt over the years, and might benefit from an architectural overhaul.
It is the aim of this thesis to investigate the viability of applying (semi-)automated modularization techniques to this software system, with the goal of pivoting towards a modular monolith architecture.

== Scope and goal

This research is centered around three research questions:

*Research Question 1*: What is the modular monolith architecture, and what sets it apart from monolith and microservices architectures?

*Research Question 2*: What are the existing approaches and tools for (semi-)automated microservice candidate identification in monolith codebases?

*Research Question 3*: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?

The motivation behind the first research question is to investigate the potential merits and demerits of the modular monolith architecture with a particular focus on its application to migrating existing monolith codebases.
To answer this question, we will first define the modular monolith architecture on the basis of existing literature, and examine what sets it apart from monolith and microservices architectures.
Then, we will proceed to investigate the merits and demerits of the software architecture when migrating existing monolith codebases to a modular monolith architecture.

The second research question is motivated by the observed need for reducing the complexity and error-proneness of manual modularization efforts.
We will explore the existing (semi-)automated technologies to assist in modularization of monolith codebases in the literature.

Finally, the third research question is motivated by the fact that a lot of useful information is embedded in the source code repository of a software system that could be used to identify module boundaries.
An approach for microservice candidate identification will be designed based on the review of existing technologies.
A prototype of the proposed solution will be implemented, and applied to a case study.
The results will be evaluated using a set of quality metrics, and its effectiveness will be assessed.

The goal of this research can be summarized as follows:

+ Investigate the merits and demerits of the modular monolith architecture
+ Investigate the use of (semi-)automated technologies to modularize a monolith architecture

Although the proposed solution will be designed for a specific case study, the results can be generalized to other monolith codebases.

== Outline

The thesis is structured as follows.

In @introduction, the motivation behind the research is explained.
The scope and goal are defined, and the research questions are formulated.
@methodology describes the research methodology followed.
In @background the reader is introduced to the concepts and background necessary to understand the research.
@relatedwork discusses the related work in the field of (semi-)automated modularization and microservice candidate identification.

@modularmonolith is dedicated to answering the first research question.
The modular monolith architecture is defined, and its merits and demerits are discussed.
The chapter also touches the concept of modularization and its relevance in software architecture.

The next chapters aim to solve the remaining research questions.
@automatedmodularization takes a deep dive into the existing technologies for (semi-)automated modularization.
Based on this study, @proposedsolution then continues with an automated microservice candidate identification approach.
In @casestudy, a case study is presented that applies the proposed solution to a real-world use case.
The proposed solution is evaluated, and the results are discussed.

Finally, @conclusion summarizes the findings, reflects upon the research, and gives an outlook on future work.
