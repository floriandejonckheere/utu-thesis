#import "/helpers.typ": citeauthor

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
// => Method-level (@carvalho_etal_2020)

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
Consider the extraction algorithm in pseudocode in @logical_coupling_algorithm.

#figure(
    table(
      columns: (auto),
      inset: 5pt,
      stroke: (x: none),
      align: (left),
      [*Algorithm 1*: Logical coupling extraction algorithm],
      [
        _cochanges_ = $arrow.l$ _array_[][]; \
        *for each* ( _commit_ : _git.log()_ ) { \
          #h(1em) _parent_ $arrow.l$ _commit_._getParent()_ \
          #h(1em) _parentDiff_ $arrow.l$ _diff_ ( _commit_, _parent_ ) \
          \
          #h(1em) *for each* ( _file_one_ : _parentDiff_.getFiles() ) { \
            #h(2em) *for each* ( _file_two_ : _parentDiff_.getFiles() ) { \
              #h(3em) _cochanges_[_file_one_][_file_two_] $arrow.l$ 1 \
            #h(2em) } \
          #h(1em) } \
        } \
        *return* _cochanges_;
      ]
  ),
  kind: "algorithm",
  supplement: "Algorithm",
  caption: [Logical coupling extraction algorithm],
) <logical_coupling_algorithm>

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
