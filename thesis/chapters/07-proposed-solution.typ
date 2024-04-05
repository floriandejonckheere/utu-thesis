#import "/helpers.typ": citeauthor

= Proposed solution <proposedsolution>

In this chapter, we propose our solution for identification of microservice candidates in a monolithic application.
The approach is based on the analysis of a dependency graph, that aggregates information from the static and evolutionary analysis of the source code.

*Problem statement*

// Problem statement
The goal of this solution is to identify a set of microservice candidates that can be extracted from the source code of the given monolithic application, in order to automate the migration to a microservices architecture.
The problem can be formulated as a graph partitioning problem, where the vertices correspond to the modules or classes in the monolithic application, and the edges represent the dependencies between them.
The input of the algorithm is a representation $M$ of the monolithic application, which exposes a set of functionalities $M_F$ through a set of classes $M_C$, and history of modifications $M_H$.
The triplet is described by @monolith_triplet_formulas.

$ M_i = { M_F_i, M_C_i, M_H_i } $ <monolith_triplet_formulas>

The set of functionalities $M_F_i$, the set of classes $M_C_i$, and the set of historical modifications $M_H_i$ are described by @monolith_formulas.

$
  M_F_i = { f_1, f_2, ..., f_j }
#linebreak()
  M_C_i = { c_1, c_2, ..., c_k }
#linebreak()
  M_H_i = { h_1, h_2, ..., h_l }
$ <monolith_formulas>

The output of the algorithm is a set of microservices $S$, according to @decomposition_formula, where $m$ is the number of microservices in the proposed decomposition.

$ S_i = { s_1, s_2, ..., s_m } $ <decomposition_formula>

// TODO: at most one microservice?
// TODO: is this really an bijection?
As each class belongs to exactly one microservice, the proposed decomposition $S$ can be written as an bijective function $f$ of $M_C_i$ onto $S_i$ as in @microservice_formula, where $f(c_i) = s_j$ if class $c_i$ belongs to microservice $s_j$.

$ f: M_C_i -> S_i  $ <microservice_formula>

#pagebreak()

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

Our approach needs to fulfill certain requirements.
We make a distinction between functional and non-functional requirements.
In software engineering, functional requirements describe requirements that impact the design of the application in a functional way /* TODO: reference */.
Non-functional requirements are additional requirements imposed at design-time that do not directly impact the functionality of the application /* TODO: reference */.

// Quality requirements: @abdellatif_etal_2021

The functional requirements we pushed forward for our proposed solution are as follows:

+ *Efficiency*: the solution decomposes the monolithic application into a microservices application with adequate efficiency /* TODO: reference quality metrics */
+ *Technology*: the solution is written in a programming language that is compatible with the Ruby programming language#footnote[#link("https://www.ruby-lang.org/")[https://www.ruby-lang.org/]]
+ *Visual*: the solution can output the proposed decomposition in a visual manner, to aid understanding of the process

The non-functional requirements identified in our solution are:

+ *Usability*: a software architect or senior software engineer can reasonably quickly get started with the solution
+ *Performance*: the solution performs the analysis, decomposition, and evaluation reasonably fast on the source code of a larger application /* TODO: define larger application */
+ *Reuse*: The solution can successfully be reused for untested monolithic applications

#pagebreak()

== Extraction

// - Static analysis of code base, because no requirements or design documents (@carvalho_etal_2020)
Software development is typically done in multiple steps, either using the waterfall model /* TODO: reference */, or using an iterative approach.
Analysis and design are two steps of early software development which often yield software development lifecycle artifacts in the form of use cases, process models, and diagrams.
However, after the completion of the development and the subsequent deployment, these documents are often not kept up to date, and sometimes even lost.
Therefor, it is not always possible to use design documents for the information extraction phase.
A software development artifact that is usually available is the source code repository of the application.
Hence, we chose the source code repository as the starting point of the information extraction.

// TODO: explain why we chose static analysis + evolutionary analysis

// Evolutionary analysis
// TODO: structural coupling + reference
#citeauthor(<mazlami_etal_2017>) propose a microservice extraction model that includes three possible extraction strategies: _logical coupling_ strategy, _semantic coupling_ strategy, and _contributor coupling_ strategy.
In this thesis, we concentrate on the logical coupling strategy, and the contributor coupling strategy.
The next sections describe in detail how these strategies are used for extracting information from the source code repository.

=== Structural coupling

// TODO

// Graph representation of the software system @filippone_etal_2021
// - Node for each method
// - Edge for each static call between methods, weighted (method-to-method edge)
// - Edge for each dynamic call from method to object of class, weighted (method-to-entity edge)
// - Edge for association between two entities (entity-to-entity edge)
// Limitations: meta-programming, reflection, dynamic class loading

// Decide on granularity: coarse-grained (class-level) or fine-grained (method-level) and motivate choice
// => Class-level, because method-level is too fine-grained and leads to too many clusters

=== Logical coupling

The logical coupling strategy is based on the Single Responsibility Principle @martin_2003, which states that a software component should only have one reason to change.
Software design that follows the Single Responsibility Principle groups together software components that change together.
Hence, it is possible to identify appropriate microservice candidates by analyzing the history of modifications of the classes in the source code repository.
Classes that change together, should belong in the same microservice.
Let $M_H$ be the history of modifications of the source code files of the monolithic application $M$.
Each change event $h_i$ is associated with a set of associated classes $c_i$ that were changed during the modification event at timestamp $t_i$.
The change event $h_i$ is also associated with a set of developers $d_i$, as described by @modification_formula @mazlami_etal_2017.

$ h_i = { c_i, t_i, d_i } $ <modification_formula>

If $c_1, c_2$ are two classes belonging to the same change event $h_i$, then the logical coupling is computed as follows in @aggregated_logical_coupling_formula @mazlami_etal_2017.

$ Delta(c_1, c_2) = sum_(h in M_H) delta_h(c_1, c_2) $ <aggregated_logical_coupling_formula>

Where $delta$ is the change function.

$ delta(c_1, c_2) = cases(1 "if" c_1\, c_2 "changed in" h_i, 0 "otherwise") $ <logical_coupling_formula>

@aggregated_logical_coupling_formula is calculated for each change event $h_i in M_H$, and each pair of classes $c_1, c_2$ in the change event, and stored in a co-change matrix $N_c$.

// TODO: Git extraction algorithm (see @santos_paula_2021 algorithm listing)

// TODO: Dynamic analysis, because inherent polymorphism and late binding
//        -> not through execution, because always skewed towards a certain code path (e.g. one dialysis machine model)
//        -> through integration tests (@carvalho_etal_2020): describe coverage and setup
//        -> measure performance overhead

=== Contributor coupling

// Git extraction algorithm (see @santos_paula_2021 algorithm listing)
//    Extract all commits from a Git repository
//    If commit not related to files changed, return
//    For each file changed, increment co-change matrix

// TODO

=== Dependency graph

Finally, an edge-weighted graph $G = (V, E)$ is constructed, where $V$ is the set of classes in the monolithic application, and $E$ is the set of edges between classes that have an interdependency based on the discussed information extraction strategies.
The weight for the edge $e_i$ between classes $c_j, c_k in V$ is calculated as the weighted sum of the call graph $N_s$ representing the structural coupling, the co-change matrix $N_c$ representing the logical coupling, and the co-authorship matrix $N_d$ representing the contributor coupling.
The weights $alpha, beta, gamma in [0, 1]$ are used to balance the contribution of the structural, logical, and contributor coupling respectively, as in @weighted_edge_formula.

$ w(e_i) = w(c_j, c_k) = alpha N_s(c_j, c_k) + beta N_c(c_j, c_k) + gamma N_d(c_j, c_k) $ <weighted_edge_formula>

An illustration of the graph $G$ is presented in @dependency_graph.

#figure(
  include("/figures/dependency_graph.typ"),
  caption: [Dependency graph]
) <dependency_graph>

== Decomposition

// 1. more automated means less work for the architect
// 2. use knowledge of experts when available
// 3. recommendations should be specified without knowledge of source code or intensive intervention of the architect

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
// Comparison of community detection algorithms: @rahiminejad_etal_2019 @brito_etal_2021

// Algorithms:
// - Clustering: cannot use algorithms that require specifying the number of clusters up-front, because not automated enough (e.g. Spectral Clustering, K-Means, Agglomerative Clustering)
//   Affinity Propagation: no need to define amount of clusters before
// - Genetic algorithms: need to define a fitness function, but can be used to optimize multiple objectives
//   Require a lot of resources (slow), and proper fine-tuning of parameters (population size, mutation rate, crossover rate)
// - Graph algorithms: Kruskal is MST (not adjustable, does not optimize for quality metrics), Label Propagation may not always work on this type of graph
//   Louvain/Leiden: designed for optimizing modularity, multiple objectives

// Summary:
// Louvain/Leiden, because designed for this kind of clustering application
// Iterative and hierarchical, so they are fast
// Good balance between efficiency and effectiveness
// Also proposed as best algorithm by @rahiminejad_etal_2019 and @brito_etal_2021

// LOUVAIN/LEIDEN ALGORITHM
// Explain algorithm, define modularity
// Difference between Louvain and Leiden (@hairol_anuar_etal_2021)
// Drawbacks: generation of small communities (@fortunato_barthelemy_2007), only non-overlapping communities

== Visualization

== Evaluation

// Metrics: functional (cohesion, coupling) and non-functional (network overhead, CPU, memory)
// Lots of metrics were studied by @candela_etal_2016

// Cohesion: number of static calls between methods within microservice boundary over all possible existing static calls (@carvalho_etal_2020)
// Coupling: sum of static calls from within microservice boundary to methods outside (@carvalho_etal_2020)
// Network overhead: size of primitive types in method calls over microservice boundaries (@carvalho_etal_2020, @filippone_etal_2021)
// => Not really probable due to dynamic nature of Ruby, and no dynamic analysis
// Modularization: user provides set of labels (features), algorithm labels vertices (@carvalho_etal_2020)

// Evaluation for different scenarios
// Different weights for structural, logical, and contributor coupling (@santos_paula_2021)w
