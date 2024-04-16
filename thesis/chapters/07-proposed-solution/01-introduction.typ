#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Proposed solution <proposedsolution>

In this chapter, we propose *#acr("MOSAIK")*, our solution for identification of microservice candidates in a monolithic application.
The approach is based on the analysis of a dependency graph, that aggregates information from the static and evolutionary analysis of the source code.

== Problem statement

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
As each class belongs to exactly one microservice, the proposed decomposition $S$ can be written as a surjective function $f$ of $M_C_i$ onto $S_i$ as in @microservice_formula, where $f(c_i) = s_j$ if class $c_i$ belongs to microservice $s_j$.

$ f: M_C_i -> S_i  $ <microservice_formula>

A microservice that contains only one class is called a _singleton microservice_.
Singleton microservices typically contain classes that are not used by any other class in the monolithic application.
As an optimization of the microservice decomposition, these classes can be omitted from the final decomposition, as they do not have any functional contribution.

#pagebreak()

== Design

We start by identifying the functional and non-functional requirements for the solution.
Then, we propose a four-step approach to decomposition adapted from the microservice identification pipeline by #citeauthor(<lopes_silva_2023>).

- *Extraction*: the necessary information is extracted from the application and its environment.
- *Decomposition*: using the collected data, a decomposition of the application into microservices is proposed.
- *Visualization*: the proposed decomposition is visualized to facilitate the understanding of the architecture.
- *Quality assessment*: the proposed decomposition is evaluated according to a set of quality metrics.

#figure(
  include("/figures/architecture.typ"),
  caption: [Architectural overview of the proposed solution]
) <architecture>

#v(2em)

The next sections detail each of these steps, providing a comprehensive overview of the proposed solution.
The process we describe is generic and not tied to any specific programming language or paradigm.
We implemented a prototype of the proposed solution in Ruby, as the monolithic application we use for evaluation is written in Ruby.
The implementation is available online#footnote[#link("https://github.com/floriandejonckheere/mosaik")[https://github.com/floriandejonckheere/mosaik]].
// TODO: something about type checking
