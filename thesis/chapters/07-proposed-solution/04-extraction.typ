#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

== Extraction

Software development is typically done in sequential steps, either using the waterfall model, or using an iterative approach @royce_1970.
Analysis and design are two steps of early software development which often yield software development lifecycle artifacts in the form of use cases, process models, and diagrams.
After the completion of the development and the subsequent deployment, these documents are often not kept up to date, and sometimes even lost.
Hence, it is not always possible to use design documents for the information extraction phase.
A software development artifact that is generally available for legacy applications is the source code repository of the application.
For these reasons, we chose the source code repository as the starting point of the information extraction.

Our solution uses multiple coupling strategies to extract information from the source code repository.
The first strategy is the structural coupling strategy, which is based on the dependencies between software components.
When two software components are dependent on each other, they are structurally coupled.

#cite_full(<mazlami_etal_2017>) proposed a microservice extraction model that includes three possible extraction strategies: _logical coupling_ strategy, _semantic coupling_ strategy, and _contributor coupling_ strategy.
In this thesis, we concentrate on the logical coupling strategy, and the contributor coupling strategy as second and third strategies.
The next sections describe in detail how these strategies are used for extracting information from the source code repository.

=== Structural coupling

Structural coupling is a measure of the dependencies between software components.
The dependencies can take the form of control dependencies, or data dependencies.
Control dependencies are dependencies between software components that are related to the flow of control of the software system (e.g. interleaving method calls).
Data dependencies relate to the flow of data between software components (e.g. passing parameters).
MOSAIK extracts structural coupling information using static analysis of the source code.
As our solution is intended to collect information from monolith applications written in a dynamic programming language, the static analysis is limited to the information that is embedded in the source code.
Dynamic languages such as Python and Ruby typically include only incomplete type information that can be extracted using static analysis.
In particular, some techniques like meta-programming and dynamic class loading may affect the accuracy of the extracted information.

Our solution analyzes the source code of the monolith application using the `parser` library#footnote[#link("https://github.com/whitequark/parser")[https://github.com/whitequark/parser]].
The library is written in Ruby and can be used to parse Ruby source code files and extract the #acr("AST") of the source code.
Iterating over the #acr("AST") of the monolith application, MOSAIK extracts the references between classes.

Using this information, a call graph is constructed that represents the structural coupling of the monolith application. For each class in the monolith application $c_i in M_C$, a vertex is created in the call graph.
References between classes are represented as directed edges between the vertices.

A directed edge is created for each reference between two classes $c_i, c_j in M_C$.
This edge describes one of three types of references: (i) static method calls between two methods $m_i$ and $m_j$ of the classes $c_i, c_j$ _(method-to-method)_, (ii) references from method $m_i$ to an object of class $c_j$ _(method-to-entity)_, and (iii) associations between entities of class $c_i$ and $c_j$ _(entity-to-entity)_ @filippone_etal_2021.

Hence, the structural coupling $N_s$ for each pair of classes $c_i, c_j in M_C$ is defined as the sum of the number of references between the classes, as described in @aggregated_structural_coupling_formula.

$
  N_s (c_i, c_j) =
    sum_(m_i in c_i, m_j in c_j\ c_i, c_j in M_C)
      italic("ref")_italic("mm") (m_i, m_j) +
      italic("ref")_italic("mc") (m_i, c_j) +
      italic("ref")_italic("cc") (c_i, c_j)
$ <aggregated_structural_coupling_formula>

The $italic("ref")_italic("mm")$, $italic("ref")_italic("mc")$, and $italic("ref")_italic("cc")$ functions return the number of references between the two methods $m_i$ and $m_j$, method $m_i$ and class $m_j$, and classes $c_i$ and $c_j$ respectively.

As #cite_full(<carvalho_etal_2020>) noted, the choice of granularity is an important decision in the extraction of microservices.
Existing approaches tend to use a more coarse-grained granularity (e.g. on the level of files or classes) rather than a fined-grained granularity (e.g. on the level of methods).
Using a coarse-grained granularity can lead to a smaller number of microservices that are responsible for a larger number of functionalities.
A fine-grained granularity can lead to a much larger number of microservices, which can decrease the maintainability of the system.
Hence, a trade-off between the two granularities must be made.
MOSAIK uses a coarse-grained granular approach, using the classes of the monolith application as the starting point for the extraction of microservices.

#figure(
    table(
      columns: (auto),
      inset: 5pt,
      stroke: (x: none),
      align: (left),
      [*@structural_coupling_algorithm*: Structural coupling extraction algorithm],
      [
        _calls_ $arrow.l$ _array_[][][] \
        \
        *for each* ( _class_ : _classes_ ) \
          #h(1em) *for each* ( _method_ : _class_._methods_ ) \
            #h(2em) *for each* ( _reference_ : _method_._references_ ) \
              #h(3em) _receiver_ $arrow.l$ _reference_._receiver_ \
              #h(3em) _type_ $arrow.l$ _reference_._type_ \
              #h(3em) _calls_[_class_][_receiver_][_type_] $arrow.l$ 1 \
        \
        *return* _calls_;
      ]
  ),
  kind: "algorithm",
  supplement: "Algorithm",
  caption: [Structural coupling extraction algorithm],
) <structural_coupling_algorithm>

@structural_coupling_algorithm describes the structural coupling extraction algorithm in pseudocode.
The algorithm first initializes an empty three-dimensional call matrix, which stores the number and type of references between classes in the monolith application.
The algorithm then iterates over all classes in the monolith application, and for each method in the class, it parses the method body.
All references from the method body are extracted, and the receiver and type of reference are stored in the call graph.

=== Logical coupling

The logical coupling strategy is based on the #acr("SRP") @martin_2003, which states that a software component should only have one reason to change.
Software design that follows the #acr("SRP") groups together software components that change together.
Hence, it is possible to identify appropriate microservice candidates by analyzing the history of modifications of the classes in the source code repository.
Classes that change together, should belong in the same microservice.
Let $M_H$ be the history of modifications of the source code files of the monolith application $M$.
Each change event $h_i$ is associated with a set of associated classes $c_i$ that were changed during the modification event at timestamp $t_i$, as described by @logical_history_formula @mazlami_etal_2017.

$ h_i = { c_i, t_i } $ <logical_history_formula>

If $c_1, c_2$ are two classes belonging to the same change event $h_i$, then the logical coupling is computed as follows in @logical_coupling_formula @mazlami_etal_2017.

$ Delta(c_1, c_2) = sum_(h_i in M_H) delta_h_i (c_1, c_2) $ <logical_coupling_formula>

Where $delta$ is the change function in @change_function_formula.

$ delta_h_i (c_1, c_2) = cases(1 "if" c_1\, c_2 "changed in" h_i, 0 "otherwise") $ <change_function_formula>

Then, the logical coupling is calculated for each change event $h_i in M_H$, and each pair of classes $c_1, c_2$ in the change event.
The logical coupling $N_c$ for each pair of classes $c_i, c_j in M_C$ is defined as the sum of the logical coupling for each change event $h_i in M_H$.

$ N_c (c_1, c_2) = Delta(c_1, c_2) $ <aggregated_logical_coupling_formula>

#figure(
    table(
      columns: (auto),
      inset: 5pt,
      stroke: (x: none),
      align: (left),
      [*@logical_coupling_algorithm*: Logical coupling extraction algorithm],
      [
        _cochanges_ $arrow.l$ _array_[][] \
        \
        *for each* ( _commit_ : _git.log_ ) \
          #h(1em) _parent_ $arrow.l$ _commit_._parent_ \
          #h(1em) _parent_diff_ $arrow.l$ _diff_ ( _commit_, _parent_ ) \
          \
          #h(1em) *for each* ( _file_one_ : _parent_diff_._files_ ) \
            #h(2em) *for each* ( _file_two_ : _parent_diff_._files_ ) \
              #h(3em) _cochanges_[_file_one_][_file_two_] $arrow.l$ 1 \
        \
        *return* _cochanges_;
      ]
  ),
  kind: "algorithm",
  supplement: "Algorithm",
  caption: [Logical coupling extraction algorithm],
) <logical_coupling_algorithm>

Consider the extraction algorithm in pseudocode in @logical_coupling_algorithm.
First, a co-change matrix is initialized, which stores the number of times two files have changed together in a two-dimensional matrix.
The algorithm then iterates over all commits in the source code repository, and for each commit, retrieves the changes between the commit and its parent.
Then, it iterates over each pair of files in the changelist, and increments the co-change matrix for the pair of files.

=== Contributor coupling

Conway's law states that the structure of a software system is a reflection of the communication structure of the organization that built it @conway_1968.
The contributor coupling strategy is based on the notion that the communication structure can be recovered from analyzing the source code repository @mazlami_etal_2017.
Grouping together software components that are developed in teams that have a strong communication paradigm internally can lead to less communication overhead when developing and maintaining the software system.
Hence, identifying microservice candidates based on the communication structure of the organization can lead to more maintainable software systems.

Let $M_H$ be the history of modifications of the source code files of the monolith application $M$.
Each change event $h_i$ is associated with a set of associated classes $c_i$ that were changed during the modification event at timestamp $t_i$.
The change event $h_i$ is also associated with a set of developers $d_i in M_D$, as stated in @contributor_history_formula @mazlami_etal_2017.
$M_D$ is the set of developers that have contributed to the source code repository of the monolith application.

$ h_i = { c_i, t_i, d_i } $ <contributor_history_formula>

$H(c_i)$ is a function that returns the set of change events that have affected the class $c_i$, and $D(c_i)$ returns the set of developers that have worked on the class $c_i$.

$ H(c_i) = { h_i in M_H | c_i in h_i } $ <contributions_formula>

$ D(c_i) = { d_i in M_D | forall h_i in H(c_i) : d_i in h_i } $ <contributors_formula>

Then, @contributors_formula is calculated for each class $c_i in M_C$ in the monolith application.

Finally, the contributor coupling $N_d$ for each pair of classes $c_i, c_j in M_C$ is defined as the cardinality of the intersection of the sets of developers that have contributed to the classes $c_i, c_j$ @mazlami_etal_2017.

$ N_d (c_1, c_2) = |D(c_i) sect D(c_j)| $ <aggregated_contributor_coupling_formula>

#pagebreak()

Consider the extraction algorithm in pseudocode in @contributor_coupling_algorithm.
The algorithm first initializes the co-authorship matrix, which is a two-dimensional array that stores the (unique) authors of each file in the source code repository.
Then, it iterates over all commits in the source code repository, and for each commit, retrieves the changes between the commit and its parent.
Finally, iterating over each file in the changelist, the algorithm adds the author(s) of the commit to the entry corresponding to the file in the co-authorship matrix.

#figure(
    table(
      columns: (auto),
      inset: 5pt,
      stroke: (x: none),
      align: (left),
      [*@contributor_coupling_algorithm*: Contributor coupling extraction algorithm],
      [
        _coauthors_ $arrow.l$ _array_[][] \
        \
        *for each* ( _commit_ : _git_._log_ ) \
          #h(1em) _parent_ $arrow.l$ _commit_._parent_ \
          #h(1em) _parent_diff_ $arrow.l$ _diff_ ( _commit_, _parent_ ) \
          \
          #h(1em) *for each* ( _file_ : _parent_diff_._files_ ) \
            #h(2em) _coauthors_[_file_] $arrow.l$ _commit_._authors_ \
        \
        *return* _coauthors_;
      ]
  ),
  kind: "algorithm",
  supplement: "Algorithm",
  caption: [Contributor coupling extraction algorithm],
) <contributor_coupling_algorithm>

=== Dependency graph

As a final step in the information extraction phase, an edge-weighted undirected graph $G = (V, E)$ is constructed, where $V$ is the set of classes in the monolith application, and $E$ is the set of edges between classes that have an interdependency based on the discussed coupling strategies.
The weight for the edge $e_i in E$ between classes $c_j, c_k in V$ is calculated as the weighted sum of the call graph $N_s$ representing the structural coupling, the co-change matrix $N_c$ representing the logical coupling, and the co-authorship matrix $N_d$ representing the contributor coupling.
The weights $omega_s, omega_c, omega_d in [0, 1]$ are used to balance the contribution of the structural, logical, and contributor coupling respectively, as described in @weighted_edge_formula.
This makes the strategy adaptive and flexible @santos_paula_2021.

$ w(e_i) = w(c_j, c_k) = omega_s N_s (c_j, c_k) + omega_c N_c (c_j, c_k) + omega_d N_d (c_j, c_k) $ <weighted_edge_formula>

An illustration of the graph $G$ is presented in @dependency_graph.

#figure(
  include("/figures/07-proposed-solution/dependency-graph.typ"),
  caption: [Dependency graph]
) <dependency_graph>
