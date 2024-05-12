#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Modular monolith architecture <modularmonolith>

In this chapter, we discuss the modular monolith architecture.
We start by defining the architectural style, and then continue by discussing the advantages and drawbacks of the architecture.
We answer the following research question:

#link(<research_question_1>)[*Research Question 1*]: What is the modular monolith architecture, and what sets it apart from monolith and microservices architectures?

The motivation behind the research question is discussed in @introduction.

== Definition

While a traditional monolith architecture is a single-tiered software architecture that tightly couples the three layers (presentation, business logic, and data access), the modular monolith architecture focuses on separation of concerns by partitioning the application into modules based on their functionality @kucukoglu_2022.

The three layers are present in each module, but are not directly accessible from outside of the module boundary.
Instead, modules expose a well-defined interface that describes the capabilities and restrictions of the module.
Hence, the modules of a modular monolith are loosely coupled.

The architecture emphasizes interchangeability and potential reuse of modules, while maintaining an explicit interface between them @su_li_2024.
Focusing on business domains rather than technical capabilities improves the organization of the code, and increases comprehensibility.
@modular_monolith_architecture illustrates the difference between a traditional monolith, a modular monolith, and a microservices architecture.

#figure(
  include("/figures/05-modular-monolith/modular-monolith.typ"),
  caption: [Modular monolith architecture @tsechelidis_etal_2023]
) <modular_monolith_architecture>

While a traditional monolith architecture is not a bad choice for smaller applications, it becomes difficult to develop new and maintain existing functionality as the application grows.
Larger applications are likely to turn into a big ball of mud, where the code is tangled and difficult to understand.
A big ball of mud, a term coined by #cite_full(<foote_yoder_1997>) in #cite(<foote_yoder_1997>, form: "year"), is a software system that lacks a perceivable architecture.

Modular monolith architecture can also be used as a stepping stone towards a microservices architecture.
Once the application is modularized and the interfaces are well-defined and stable, individual modules can be extracted and turned into external microservices.
If the agreed upon interface is respected, the external microservice can be swapped out entirely by another implementation without affecting the rest of the application.
When all modules have been extracted from the monolith, the application has effectively been transformed into a microservices application.

#grid(
  columns: (auto, auto),
  gutter: 1em,
  [
    #figure(
      include("/figures/05-modular-monolith/distributedness.typ"),
      caption: [Physical and logical architectures @kucukoglu_2022]
    ) <distributedness>
  ],
  [
    Contrary to microservices applications, modular monolith applications are built as a single deployable unit.
    The modules of the software system are separated logically (not physically), and are deployed together.
    Horizontal scaling of a modular monolith architecture is more difficult than a microservices architecture.
    @distributedness describes the software architectures in two dimensions: logical and physical.
  ]
)

The traditional monolith is both logically and physically monolithic, while a distributed monolith is only logically monolithic.
A microservices architecture is physically distributed, and logically modular.
The modular monolith architecture is logically modular, as the application is divided into modules, but physically monolithic, as the modules are deployed together.

#pagebreak()

#cite_full(<su_li_2024>) identified six characteristics of modular monolith architecture:

+ *Segregation* of modules: each module is independent and includes all three application layers. Modules are autonomously developed, tested, and deployed.
+ *Modularity*: modules have high internal cohesion and low external coupling. Communication between modules is done using well-defined interfaces, preferably asynchronously.
+ *Unified database*: the database schema is shared by all modules, in contrast with microservices where each microservice has its own database and schema.
+ *Monolith deployment*: the application is deployed as a single unit, although modules can be distributed across multiple hosts.
+ *Unified application process*: the application functions as a singular process, scaling uniformly depending on the requirements.
+ *Maintainability and scalability*: the architecture can efficiently manage increasing complexity, and facilitates growth.

In summary, the modular monolith architecture aims to find a middle ground between the monolith and microservices architectures by reaping the benefits of both approaches.
While opting for a modular monolith architecture already improves flexibility and comprehensibility, it can also be used as a step in the migration towards a microservices architecture.

== Advantages and drawbacks

In the #cite(<brown_2013>, form: "year") book _Software architecture for developers_, #cite_full(<brown_2013>) defined architectural drivers as a set of requirements that have significant influence over software architecture.
The author argues that architectural drivers are the most important requirements that shape the architecture of a software system.
#cite_full(<grzybek_2019_architectural_drivers>) classified architectural drivers in four categories: functional requirements, quality attributes, technical, and business constraints.
Any realized software architecture is a trade-off between several architectural drivers.
Subsequently, the choice of architecture depends on the context of the application it is being used in.

We attempted to qualitatively compare the architectural drivers of modular monolith architecture with traditional monolith and microservices architectures.
@modular_monolith_comparison provides an overview of the comparison.
A star rating system is used to indicate the performance of each architecture with respect to the architectural driver, with one star indicating the lowest performance, and three stars indicating the highest performance.
The ratings are based on several sources, including #cite_full(<grzybek_2019_architectural_drivers>), #cite_full(<fowler_2015>), #cite_full(<kodja_2023>), #cite_full(<kucukoglu_2022>), and #cite_full(<su_li_2024>).

#let star = (i) => range(1, (i + 1)).map(j => sym.star.filled).join()

#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, center, center, center),
    [*Architectural driver*], [*Monolith*], [*Modular monolith*], [*Microservices*],
    [Complexity],             [#star(3)],   [#star(2)],           [#star(1)],
    [Structure],              [#star(2)],   [#star(3)],           [#star(1)],
    [Testing],                [#star(1)],   [#star(2)],           [#star(2)],
    [Productivity],           [#star(3)],   [#star(2)],           [#star(1)],
    [Performance],            [#star(1)],   [#star(2)],           [#star(3)],
    [Fault tolerance],        [#star(1)],   [#star(3)],           [#star(3)],
  ),
  caption: [Comparison of modular monolith architecture]
) <modular_monolith_comparison>

==== Complexity

The complexity of a software system is related to the number of modules and their interactions @grzybek_2019_architectural_drivers.
In a monolith architecture, there is only one module (the monolith application itself), and no interactions.
This makes the architecture simple, and easy to deploy.
Microservices architecture improves the coupling by separating modules into independent microservices, but introduces complexity due to the communication between the microservices, and the additional tools and infrastructure required to manage them.
The modular monolith architecture uses the decoupled approach of microservices, but keeps the complexity down by bundling the modules together in a single deployable unit.
Modules in a modular monolith architecture have two ways of communicating: externally through #acr("API") calls, and internally through abstracted interfaces @su_li_2024.
The external #acr("API") calls can introduce additional complexity, although some tools (e.g. ServiceWeaver) hide this complexity behind abstractions of internal communication.

==== Structure

The source code of monolith and modular monolith applications is stored in the same repository.
This makes enacting changes to the codebase easier, as developers can modify multiple modules or layers at the same time.
In contract, microservices are usually stored in separate repositories, due to the independent nature of the services @kucukoglu_2022.
Monolith architecture makes modification across functional domains possible as well, although it introduces fragility due to the tight coupling of the code @su_li_2024.

In #cite(<conway_1968>, form: "year"), #cite_author(<conway_1968>) observed that the structure of a software system is often influenced by the communication structure of the organization that develops it @conway_1968.
The modular nature of modular monolith and microservices architectures makes it easier to align the architecture with the organization structure, while the inherent structure of a monolith architecture does not provide this ability.

==== Testing

Testing a monolith application can be difficult and tedious, as code is tightly coupled and changes in one module can affect other modules @su_li_2024.
Functionality cannot be tested independently, but must be tested in the context of the entire application.
In modular monolith and microservices architectures, functionality is separated into modules or microservices, which can be tested in isolation.
To ensure that the application works as expected, integration tests can be performed that test the integration between the modules or microservices.

==== Productivity

When designing a software system from scratch, a monolith architecture is often the most productive choice @fowler_2015.
Developers can focus on the business logic of the application, without having to worry about the underlying infrastructure or deployment model.
Using microservices architecture incurs additional investment of time and resources, as developers must define the interfaces between the microservices, and manage the communication.
Modular monolith architecture compromises between the two, by allowing developers to focus on the business logic first, while still providing the benefits of a distributed architecture.
The _Monolith First_ approach proposed by #cite_full(<fowler_2015>) suggests initiating new software projects with a monolith architecture, and only breaking out into microservices when the monolith architecture is showing its limitations.

==== Performance

Traditional monolith applications offer better performance than distributed architectures, due to the lower overhead incurred when processing requests @grzybek_2019_architectural_drivers.
However, monolith applications can only handle a limited number of requests until the application becomes slow and unresponsive.
Distributed architectures, such as microservices and modular monoliths, offer a solution for this problem by allowing the application to scale horizontally, at the cost of increased complexity and overhead.
Care must be taken when designing the distributed application to ensure that the transactional context of a request is not spread across multiple modules or microservices, as this can lead to performance issues @nunes_etal_2019.

Additionally, a microservices architecture is truly distributed in that every microservice is bundled with its own external dependencies, such as databases and caches.
This allows for better performance, as the dependencies can be scaled alongside the microservices @kodja_2023.

==== Fault tolerance

The impact of a failure in a monolith application is greater than in modular architectures, as the entire application is affected @grzybek_2019_architectural_drivers.
The risk of a system failure can be mitigated by replicating the application, but this comes with a significant cost.
Distributed architectures are more tolerant to individual failures, as the failure of one service does not affect the entire application, and can be resolved quicker @grzybek_2019_primer.
Communication between modules or microservices is done over a network, where failures and delays are expected.
Hence, distributed architectures fault-tolerant by design, and can handle unexpected failures more gracefully than monolith applications.

In summary, the modular monolith architecture strikes a balance between the monolith and microservices architectures.
It offers the simplicity of a monolith architecture, while providing the flexibility and scalability of a distributed architecture.
In particular, the modular monolith architecture is well-suited for smaller developments teams where the domain complexity of the application is manageable @kodja_2023.
On the other hand, when the requirements for scaling become more stringent, or the use of multiple, heterogeneous technologies is required, a microservices architecture might be a better choice @kodja_2023.

== Modularization

Modularization of monolith applications is not a new concept.
In #cite(<parnas_1972>, form: "year"), #cite_full(<parnas_1972>) stated that modularization is a mechanism that can improve the flexibility and comprehensibility of software systems.
The author argued that modularization separates the system into smaller and more manageable parts, which can be developed concurrently by multiple teams.

The process of modularization involves identifying the potential modules or services of the software system, defining the interfaces between them, and evaluating the impact of the modularization on the system.


Modularization techniques can be classified into three categories @abdellatif_etal_2021:

- *Top-down (forward) engineering*: starting from the domain artifacts of the application (e.g. requirements, use cases), and deriving the modules from these artifacts
- *Bottom-up (reverse) engineering*: mining functionalities from the existing system (source code, documentation) and developing the modules based on this structure
- *Hybrid/reuse approach*: mapping domain artifacts onto existing functionalities in the system, and identifying the modules based on the mapping

Top-down approaches are more suitable for new projects, where the requirements are known in advance, and little or no existing code is available.
For migration of legacy applications to a modular architecture, bottom-up approaches are more suitable, as they can leverage the existing codebase and development artifacts.

#cite_full(<abdellatif_etal_2021>) identified three main steps in the process of modularization of monolith applications:

+ *Collection*: extraction of useful information from the monolith application
+ *Decomposition*: partitioning the application into individual modules or microservices
+ *Analysis*: evaluating the impact of the modularization on the system

These steps can be done manually by the software architect, or automatically using tools that collect information about the application, and decompose it into a modular application.
Manual collection of data is feasible when the application is small, but becomes unrealistic as the application grows.
Automated tools can also help to extract implicit information from the application, such as the relationship between contributors and file changes, or the frequency of changes to a file.
Automated decomposition tools can help to identify the modules of the application, although for the most part they cannot rely on the knowledge that the software architect has about the application, rendering them less effective than manual decomposition.

The process of identifying modules or microservices for a modular monolith application is similar to the process of identifying them for a microservices architecture @tsechelidis_etal_2023.
However, the criteria for identifying modules are different, as the modules of a modular monolith application are not deployed as separate microservices.

Given the inherent complexity of manual modularization, we see a clear need for the development and improvement of (semi-)automated tools to assist in the modularization of monolith applications.
In particular, the information present in the codebase of the application is a prime candidate for automatic extraction and decomposition, as it contains valuable information about the structure and dependencies of the application.

== Conclusion

In this chapter, we discussed the modular monolith architecture.
We answered the following research question:

#link(<research_question_1>)[*Research Question 1*]: What is the modular monolith architecture, and what sets it apart from monolith and microservices architectures?

The modular monolith architecture arose as a response to the limitations of traditional monolith and microservices architectures.
It combines the simplicity of the monolith architecture with the flexibility and scalability of a microservices architecture.
Modular monolith applications retain a single codebase and deployment unit, but are segregated into loosely coupled modules that communicate through well-defined interfaces.
The software architecture allows small teams to develop applications quickly and efficiently, and allows the application to break out into microservices whenever the need arises.
