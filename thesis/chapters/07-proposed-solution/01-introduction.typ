#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

= Proposed solution <proposedsolution>

In this chapter, we propose *Modular Optimization to Service-oriented Architecture Identification Kit (MOSAIK)*, our solution for automated identification of microservice candidates in a monolith application.
The approach is based on the analysis of a dependency graph, that aggregates information from the static and evolutionary analysis of the source code.

We focus on answering the following research question:

*Research Question 3*: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?

The motivation behind the research question is discussed in @introduction.

== Problem statement

The goal of MOSAIK is to automate microservice candidate identification in a monolith application, by statically analyzing the codebase of the application.
The resulting decomposition can be used as a starting point for the migration to microservices or modular monolith architecture.
The problem can be formulated as a graph partitioning problem, where the vertices correspond to the software components in the monolith application, and the edges represent the dependencies between them.
The input of the algorithm is a representation $M$ of the monolith application, which exposes a set of functionalities $M_F$ through a set of classes $M_C$, and history of modifications $M_H$.
The triplet is described by @monolith_triplet_formulas.

$ M_i = { M_F_i, M_C_i, M_H_i } $ <monolith_triplet_formulas>

The set of functionalities $M_F$, the set of classes $M_C$, and the set of historical modifications $M_H$ are described by @monolith_formulas.

$
  M_F_i = { f_1, f_2, ..., f_j }
#linebreak()
  M_C_i = { c_1, c_2, ..., c_k }
#linebreak()
  M_H_i = { h_1, h_2, ..., h_l }
$ <monolith_formulas>

Where $j$, $k$, and $l$ are the number of functionalities, classes, and historical modifications in the monolith application, respectively.
The output of the algorithm is a set of microservices $S$, according to @decomposition_formula, where $m$ is the number of microservices in the proposed decomposition.

$ S_i = { s_1, s_2, ..., s_m } $ <decomposition_formula>

As each class belongs to at most microservice, the proposed decomposition $S$ can be written as a surjective function $f$ of $M_C_i$ onto $S_i$ as in @microservice_formula, where $f(c_i) = s_j$ if class $c_i$ belongs to microservice $s_j$.

$ f: M_C_i -> S_i  $ <microservice_formula>

A microservice that contains only one class is called a _singleton microservice_.
Singleton microservices typically contain classes that are not used by any other class in the monolith application.
As an optimization of the microservice decomposition, these classes can be omitted from the final decomposition, as they do not have any functional contribution.
