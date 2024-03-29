#import "/cite.typ": citeauthor

= Proposed solution <proposedsolution>

In this chapter, we analyze and design our solution for identification of microservice candidates.
We start by identifying the functional and non-functional requirements for the solution.

Then, we propose a microservice decomposition approach using the three-step process by #citeauthor(<abdellatif_etal_2021>).

- *Collect*: the necessary data is collected from the application and its environment.
- *Decomposition*: using the collected data, a decomposition of the application into microservices is proposed.
- *Analysis*: the proposed decomposition is analyzed to evaluate the effectiveness of the chosen approach.

== Requirements

// Functional: visualization, user-imposed priorities, gradual migration, technology
// Non-functional: usability, performance, maintainability, license

== Collection

// Collection strategies
// - Static analysis of code base, because no requirements or design documents (@carvalho_etal_2020)
// - Dynamic analysis, because inherent polymorphism and late binding -> through execution and also integration tests (@carvalho_etal_2020)
// - Version history (because strong culture of code ownership), but only from specific commits, because Link v5 refactor (@lourenco_silva_2023)
//      Justify why this strategy is applicable, and mention the parameters (how many commits, authors, timespan, etc.)

// Graph representation of the software system @filippone_etal_2021
// - Node for each method
// - Edge for each static call between methods, weighted (method-to-method edge)
// - Edge for each dynamic call from method to object of class, weighted (method-to-entity edge)
// - Edge for association between two entities (entity-to-entity edge)

// Version history (@mazlami_etal_2017)

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

== Analysis

// Metrics: functional (cohesion, coupling) and non-functional (network overhead, CPU, memory)

// Cohesion: number of static calls between methods within microservice boundary over all possible existing static calls (@carvalho_etal_2020)
// Coupling: sum of static calls from within microservice boundary to methods outside (@carvalho_etal_2020)
// Network overhead: size of primitive types in method calls over microservice boundaries (@carvalho_etal_2020, @filippone_etal_2021)
// Modularization: user provides set of labels (features), algorithm labels vertices (@carvalho_etal_2020)
