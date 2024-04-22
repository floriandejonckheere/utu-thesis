#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Modular monolith architecture <modularmonolith>

In this chapter, we will discuss the modular monolith architecture.
We will start by defining the architectural style, and then continue by discussing the challenges and opportunities of this architecture.
We aim to answer the following research question:

*Research Question 1*: What is the modular monolith architecture, and what sets it apart from monolithic and microservices architectures?

== Definition

While a traditional monolith architecture is a single-tiered software architecture that tightly couples the three layers (presentation, business logic and data access), the modular monolith architecture focuses on separation of concerns by partitioning the application into modules or components based on their functionality @kucukoglu_2022.

The three layers are present in each module, but they are not directly accessible from outside of the module.
Instead, modules expose a well-defined interface that describes the capabilities and limitations of the module.
Hence, the modules of a modular monolith are loosely coupled.

#figure(
  include("/figures/modular-monolith.typ"),
  caption: [Modular monolith architecture @kucukoglu_2022]
) <modular_monolith_architecture>

The architecture emphasizes interchangeability and potential reuse of modules, while maintaining an explicit interface between them @su_li_2024.
Focusing on business domains rather then technical capabilities improves the organization of the code, and increases comprehensibility.

While traditional monolith architecture is not a bad choice for small applications, it becomes difficult to develop new functionality and maintain existing as the application grows.
Larger applications are likely to turn into a big ball of mud, where the code is tangled and difficult to understand @foote_yoder_1997.
A big ball of mud, a term coined by #cite_author(<foote_yoder_1997>) in #cite(<foote_yoder_1997>, form: "year"), is a software system that lacks a perceivable architecture.

Modular monolith architecture can also be used as a stepping stone towards a microservices architecture.
Once the application is modularized and the interfaces are well-defined and stable, individual modules can be extracted and turned into external services.
If the agreed upon interface is respected, the external service can be swapped out entirely by another implementation without affecting the rest of the application.
When all modules have been extracted from the monolith, the application has effectively been transformed into a microservices architecture.

#grid(
  columns: (50%, 50%),
  gutter: 1em,
  [
    #figure(
      include("/figures/distributedness.typ"),
      caption: [Physical and logical architectures @kucukoglu_2022]
    ) <distributedness>
  ],
  [
    Contrary to microservices, modular monolith applications are built as a single deployable unit.
    The modules of the software system are separated logically (not physically), and are deployed together.
    Horizontal scaling of a modular monolith architecture is more difficult than in a microservices architecture.
  ]
)

#v(2em)

#cite_full(<su_li_2024>) identified six characteristics of modular monolith architecture in the literature:

+ *Segregation* of modules: each module is independent and includes all three application layers. Modules are autonomously developed, tested and deployed.
+ *Modularity*: modules are highly internally cohesive and loosely externally coupled. Communication between modules is done using well-defined interfaces, preferably asynchronously.
+ *Unified database*: the database schema is shared by all modules, in contrast with microservices where each service has its own database and schema.
+ *Monolithic deployment*: the application is deployed as a single unit, and although modules can be distributed across multiple hosts.
+ *Unified application process*: the application functions as a singular process, scaling uniformly depending on the requirements.
+ *Maintainability and scalability*: the architecture can efficiently manage increasing complexity, and facilitates growth.

In summary, the modular monolith architecture aims to find a middle ground between the monolith and microservices architectures by reaping the benefits of both approaches.
While opting for a modular monolith architecture already improves flexibility and comprehensibility, it can also be used as a step in the migration towards a microservices architecture.

== Challenges and opportunities

In the #cite(<brown_2013>, form: "year") book "Software architecture for developers", #cite_author(<brown_2013>) defines architectural drivers as a set of requirements that have significant influence over software architecture @brown_2013.
The author argues that architectural drivers are the most important requirements that shape the architecture of a software system.
Architectural drivers are often classified in four categories: functional requirements, quality attributes, technical, and business constraints.
Any realized software architecture is a trade-off between several architectural drivers.
Hence, the choice of architecture depends on the context it is being designed in.

In @modular_monolith_comparison, we qualitatively compare the most important architectural drivers of modular monolith architecture with traditional monolith and microservices architectures.
A star rating system is used to indicate the performance of each architecture with respect to the architectural driver, with more stars being indicative of better performance.

#let star = (i) => range(1, (i + 1)).map(j => sym.star.filled).join()

#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, center, center, center),
    [*Architectural driver*], [*Monolith*], [*Modular monolith*], [*Microservices*],
    [Complexity],             [#star(1)],   [#star(3)],           [#star(2)],
    [Structure],              [#star(2)],   [#star(2)],           [#star(1)],
    [Productivity],           [#star(1)],   [#star(1)],           [#star(1)],
    [Deployability],          [#star(1)],   [#star(1)],           [#star(1)],
    [Performance],            [#star(1)],   [#star(1)],           [#star(1)],
    [Scalability],            [#star(1)],   [#star(1)],           [#star(1)],
    [Fault tolerance],        [#star(1)],   [#star(1)],           [#star(1)],
  ),
  caption: "Comparison of modular monolith architecture"
) <modular_monolith_comparison>

==== Complexity

The complexity of a software system is related to the number of modules and their interactions.
In a monolith architecture, the complexity is high because there is no clear separation between the modules, which makes the architecture tightly coupled and difficult to change.
Microservices architecture improves the coupling by separating modules into independent services, but introduces complexity due to the communication between the services.
The modular monolith architecture uses the decoupled approach of microservices, but keeps the complexity down by bundling the modules together in a single deployable unit.
Modules in a modular monolith architecture have two ways of communicating: externally through #acr("API") calls, and internally through abstracted interfaces @su_li_2024.
The external #acr("API") calls can introduce additional complexity, although some tools (e.g. ServiceWeaver) hide this complexity behind abstractions of internal communication.

==== Structure


The source code of monolith and modular monolith applications is stored in the same repository.
This makes enacting changes to the codebase easier, as developers can modify multiple modules or layers at the same time.
In contract, microservices are usually stored in separate repositories, due to the independent nature of the services.

In #cite(<conway_1968>, form: "year"), #cite_author(<conway_1968>) observed that the structure of a software system is often influenced by the communication structure of the organization that develops it @conway_1968.
The modular nature of modular monolith and microservices architectures makes it easier to align the architecture with the organization structure, while the inherent structure of a monolith architecture does not provide this ability.

// Testing: unit tests for each module to ensure it works in isolation, integration tests for entire application

// Security: modules are isolated from each other (fault-tolerance), but shared database can be a single point of failure
//     External interfaces: authentication and authorization, transport security

// Dependencies: external databases are shared for all modules

// Performance: transactional context is smaller, but may

// CAP theorem
//    Consistency: more difficult because one request may require multiple modules to work together
//    Availability: entire application is more fault-tolerant
//    Partition tolerance: shared database is a single point of failure

// Monolith facets: development velocity
// Microservice facets: scalability, security, fault tolerance (@kucukoglu_2022)

== Modularization

Modularization of monolith applications is not a new concept.
In #cite(<parnas_1972>, form: "year"), #cite_author(<parnas_1972>) stated that modularization is a mechanism that can improve the flexibility and comprehensibility of software systems @parnas_1972.
The author argued that modularization separates the system into smaller and more manageable parts, which can be developed concurrently by different teams.

// https://www.kamilgrzybek.com/blog/posts/modular-monolith-primer

// Problem statement regarding identification of optimal module boundaries

// Microservice is architectural style or just SOA-approach? @carrasco_etal_2018

// Explain the process of modularization, including the identification of modules
// TODO: explain graphs in mathematical terms
// TODO: explain difference between top-down approach and bottom-up approach

// TODO: discuss difference between modularization to microservices and modular monolith
// TODO: read Migrating to a microservice architecture: benefits and challenges

/*
  TODO: discuss three strategies (A Taxonomy of Service Identification Approaches for Legacy Software)
    1. Top-down (forward) engineering
    2. Bottom-up (reverse) engineering
    3. Hybrid/reuse approach
*/

// TODO: reference https://martinfowler.com/bliki/MonolithFirst.html

/*
  TODO: discuss three steps (A Taxonomy of Service Identification Approaches for Legacy Software)
    1. Collection (static, dynamic, lexical)
    2. Decomposition (clustering algorithms)
    3. Analysis (evaluation, metrics)
*/
