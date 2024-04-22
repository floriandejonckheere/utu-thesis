#import "/helpers.typ": *

= Modular monolith architecture <modularmonolith>

In this chapter, we will discuss the modular monolith architecture.
We will start by defining the architectural style, and then continue by discussing the challenges and opportunities of this architecture.
We aim to answer the following research question:

*Research Question 1*: What is the modular monolith architecture, and what sets it apart from monolithic and microservices architectures?

// TODO: Justification for choice of modular monolith in this thesis

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
The modular monolith architecture attempts to address these issues, and can be used as a stepping stone towards a microservices architecture.

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

// Answer to Research Question 1

// TODO: discuss testing strategies, security concerns, external dependencies, transactional context, Conway's law

// Monolith facets: development velocity
// Microservice facets: scalability, security, fault tolerance (@kucukoglu_2022)


// TODO: table comparing monolith, modular monolith and microservices

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, center, center),

    [*Monolith*], [*Modular monolith*], [*Microservices*],
  ),
  caption: "Comparison of modular monolith architecture"
) <modular_monolith_comparison>

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

== Existing approaches

// Tools: ServiceWeaver, Spring Modulith, Light-Hybrid-4j, Packwerk
// Companies: Shopify, AppSmith, Gusto, PlayTech
