#import "/helpers.typ": citeauthor

= Proposed solution <proposedsolution>

In this chapter, we propose our solution for identification of microservice candidates in a monolithic application.

// Problem statement
The goal of this solution is to identify a set of microservices that can be extracted from the source code of the given monolithic application, in order to facilitate the migration to a microservices architecture.
As such, the problem can be formulated as a graph partitioning problem, where the vertices correspond to the modules or classes in the monolithic application, and the eges represent the dependencies between them.
The input to the algorithm is a representation $M$ of the monolithic application, which consists of a set of classes $M_C = { c_1, c_2, ..., c_n }$ where $n$ is the number of classes in the application.
The output of the algorithm is a set of microservices $S = { s_1, s_2, ..., s_m }$ where $m$ is the number of microservices in the proposed decomposition.
As each class belongs to exactly microservice, the output can be represented as a mapping $f: M_C -> S$, where $f(c_i) = s_j$ if class $c_i$ belongs to microservice $s_j$.

We start by identifying the functional and non-functional requirements for the solution.
Then, we propose a four-step approach to decomposition adapted from the microservice identification pipeline by #citeauthor(<lopes_silva_2023>).

- *Extraction*: the necessary information is extracted from the application and its environment.
- *Decomposition*: using the collected data, a decomposition of the application into microservices is proposed.
- *Visualization*: the proposed decomposition is visualized to facilitate the understanding of the architecture.
- *Quality assessment*: the proposed decomposition is evaluated according to a set of quality metrics.

#v(2em)

#figure(
  image("/figures/architecture.svg"),
  caption: [Overview of the architecture of the proposed solution]
) <architecture>

#v(2em)

The next sections detail each of these steps, providing a comprehensive overview of the proposed solution.
The process we describe is generic and not tied to any specific programming language or paradigm.
We implemented a prototype of the proposed solution in Ruby, as the monolithic application we use for evaluation is written in Ruby.
The implementation is available online#footnote[#link("https://github.com/floriandejonckheere/mosaik")[https://github.com/floriandejonckheere/mosaik]].

== Requirements

// Functional: visualization, user-imposed priorities, gradual migration, technology
// Non-functional: usability, performance, maintainability, license

// Quality requirements: @abdellatif_etal_2021

== Extraction

// Collection strategies
// - Static analysis of code base, because no requirements or design documents (@carvalho_etal_2020)
// - Dynamic analysis, because inherent polymorphism and late binding
//        -> not through execution, because always skewed towards a certain code path (e.g. one dialysis machine model)
//        -> through integration tests (@carvalho_etal_2020): describe coverage and setup
//        -> measure performance overhead
// - Version history (because strong culture of code ownership), but only from specific commits, because Link v5 refactor (@lourenco_silva_2023)
//      Justify why this strategy is applicable, and mention the parameters (how many commits, authors, timespan, etc.)

// Graph representation of the software system @filippone_etal_2021
// - Node for each method
// - Edge for each static call between methods, weighted (method-to-method edge)
// - Edge for each dynamic call from method to object of class, weighted (method-to-entity edge)
// - Edge for association between two entities (entity-to-entity edge)
// Merge multiple information collectors @brito_etal_2021
// Limitations: meta-programming, reflection, dynamic class loading

// Version history: logical coupling, contributor coupling (@mazlami_etal_2017)

// Git extraction algorithm (@santos_paula_2021)
//    Extract all commits from a Git repository
//    If commit not related to files changed, return
//    For each file changed, increment co-change matrix

== Decomposition

// 1. more automated means less work for the architect
// 2. use knowledge of experts when available
// 3. recommendations should be specified without knowledge of source code or intensive intervention of the architect

// Decide on granularity: coarse-grained (class-level) or fine-grained (method-level) and motivate choice

// Decide on top-down or bottom-up approach and motivate choice
// Top-down: start with one big package, then progressively split up into smaller packages
// Bottom-up: start with small packages (every class is a package), then progressively merge into bigger packages

// Application is not stateful (or negligible), so no database dependencies

// Strategies:
// - Logical coupling: classes that are often changed together are likely to be part of the same microservice
// - Semantic coupling: classes that are often mentioned together in documentation are likely to be part of the same microservice
// - Contributor coupling: classes that are often changed by the same developer are likely to be part of the same microservice

// Algorithms:
// - NSGA-II
// - NSGA-III (@carvalho_etal_2020)
// - Affinity Propagation (@al_debagy_martinek_2020)
//    - Advantages: no need to define amount of clusters before
// Comparison of community detection algorithms: @rahiminejad_etal_2019

== Visualization

== Evaluation

// Metrics: functional (cohesion, coupling) and non-functional (network overhead, CPU, memory)
// Lots of metrics were studied by @candela_etal_2016

// Cohesion: number of static calls between methods within microservice boundary over all possible existing static calls (@carvalho_etal_2020)
// Coupling: sum of static calls from within microservice boundary to methods outside (@carvalho_etal_2020)
// Network overhead: size of primitive types in method calls over microservice boundaries (@carvalho_etal_2020, @filippone_etal_2021)
// Modularization: user provides set of labels (features), algorithm labels vertices (@carvalho_etal_2020)