#import "@preview/acrostiche:0.3.1": *

= Introduction <introduction>

// General introduction to the topic

In the past decade, software engineering has seen a radical shift in the way software is developed and deployed.
The rise in popularity of cloud computing and containerization has led to the emergence of microservices a new software architecture paradigm.
Microservices as an architectural style emphasize the development of small, distributed services that are deployed independently and communicate with each other over an internal network.
This approach has several benefits, including scalability and fault tolerance.
Many big and small organizations have adopted a microservices architecture to increase the flexibility of their software systems, and to enable faster development and deployment cycles.

Migrating monolithic applications to a microservices architecture is not a trivial task.
It involves deep understanding of software engineering principles, the existing codebase, and the business domain.
Moreover, as larger and older applications typically have more technological debt, the process of migrating to microservices can be overly complex and error-prone.

In recent years, a new software architecture paradigm has emerged that takes a hybrid approach to monolithic and microservices architectures.
The modular monolith architecture aims to combine the advantages of using a microservices architecture with the simplicity of a monolithic codebase.
The modular monolithic application consists of multiple independent modules encapsulating a specific set of functionality.
The modules are developed in tandem, but deployed as single units.
This approach allows developers to rapidly build and deploy new features, while maintaining the flexibility and scalability of a microservices architecture.
As the code resides in the same codebase, developers can easily restructure and redefine the module boundaries.
This makes the modular monolith architecture an attractive option for organizations that want to migrate their monolithic software systems to a more flexible and scalable architecture.

In this thesis, we aim to investigate the potential benefits of a modular monolithic architecture, and how automated technologies can help software architects to migrate their monolithic codebases to a modular monolith architecture.

== Motivation

// Explanation about why and for whom the topic is relevant, and what the expected outcome of the thesis is

/* TODO: read "Migrating Legacy Software to Microservices Architecture */

== Scope and goal

This research is centered around three research questions:

*Research Question 1*: What are the challenges and opportunities of the modular monolith architecture compared to traditional monolithic and microservices architectures?

*Research Question 2*: What are the existing approaches and tools for automated microservice candidate identification in monolith codebases?

*Research Question 3*: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?
// Motivation: a lot of information is embedded in source code repository, and can be extracted with little prerequisite knowledge of the design

The motivation behind the first research question is to investigate the potential benefits and drawbacks of the modular monolith architecture with a particular focus on its application to existing monolithic codebases.
To answer this question, we will first define the modular monolith architecture using existing literature, and examine what sets it apart from monolithic and microservices architectures.
Then, we will proceed to investigate the merits and drawbacks of the software architecture when applied to an existing codebase.

The second research question is motivated by the need for reducing the complexity and error-proneness of manual modularization efforts.
We will explore the existing automated technologies to aid modularization of monolithic codebases in the literature.
This will then help us to answer the third research question.
An approach to automated modularization will be chosen based on the review of existing technologies.
A prototype of the proposed solution will be implemented, and applied to a case study.
The results will be evaluated using a set of quality metrics, and its effectiveness will be discussed.

The goal of this research can be summarized as follows:

+ Investigate the merits and drawbacks of the modular monolith architecture
+ Investigate the use of automated technologies to modularize a monolithic architecture

Although the proposed solution will be designed for a specific case study, the results can be generalized to other monolithic codebases.

== Outline

// General outline of the sections
The thesis is divided into three parts.

The first part comprises the background and related work.
In @introduction, the scope and goal of the research is defined, and the research questions are formulated.
The stakeholders are identified, and the methodology is explained.
@methodology describes the research methodology used in this thesis.
@background introduces the reader to the research background and necessary concepts.
In @relatedwork, the existing literature is reviewed, and the state of the art is presented.

The second part of the thesis, starting with @modularmonolith, is dedicated to the first research question.
The modular monolith architecture is defined, and its merits and drawbacks are discussed.

The third part aims to solve the second and third research question.
@automatedmodularization gives an introduction into the automated modularization of monolith codebases, listing the existing technologies.
It then continues to focus on one automated technology, _(automated technology)_, and explains its implementation.
@casestudy applies _(automated technology)_ on a given case study, and compares it to manual modularization efforts.

Finally, @conclusion summarizes the findings, and gives an outlook on future work.
