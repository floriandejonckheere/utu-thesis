#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

== Decomposition

// TODO: mention graph reduction

Monolith decomposition is the process of identifying microservice candidates in a monolith application.
The goal of this process is to split the monolith into smaller, more manageable software components which can be deployed independently @dehghani_2018.
Traditionally, monolith decomposition is a manual process that requires a deep understanding of the software architecture and business requirements.
However, the burden of manual decomposition can be alleviated by using automated tools and algorithms.
The knowledge of software architects should be leveraged where possible to guide the decomposition process, without imposing the requirement of a deep understanding of the software architecture.
For example, #cite_full(<li_etal_2023>) proposed a method that utilizes expert knowledge, however requires the recommendations to be written in a domain-specific language, increasing the burden on the software architect.

MOSAIK implements an automated identification of microservice candidates in a monolith application using a clustering algorithm.
The decomposition process can be fine-tuned by assigning an importance to the different types of coupling strategies.
This way, the software architect can decide which coupling strategies are most relevant to the decomposition process.

Clustering algorithms group similar elements together based on one or multiple criteria.
Generally these algorithms work iteratively either top-down or bottom-up.
Top-down algorithms start by assigning all elements to one big cluster, and then progressively split it into smaller clusters until a stopping criterion is met.
Examples of top-down clustering algorithm are the Girvan-Newman algorithm @girvan_newman_2002 and hierarchical divisive clustering.
Bottom-up algorithms on the other hand, start by assigning each element to its own cluster, then merge similar clusters together in succession, until a stopping criterion is met.
Examples of bottom-up clustering algorithms are hierarchical agglomerative clustering and the Louvain algorithm @blondel_etal_2008.

==== Selection of algorithm

In @slr_algorithms, we performed an analysis of the state of the art in clustering algorithms used for microservice candidate identification.
We considered the following criteria when selecting the most suitable algorithm for our task:

- *Automation*: the algorithm should not require architectural knowledge up-front (e.g. number of clusters)
- *Complexity*: the algorithm should be computationally efficient

The first criteria disqualifies algorithms that require specifying the number of clusters up-front, such as Spectral Clustering, K-Means, and Hierarchical Agglomerative Clustering.
Search-based algorithms (e.g. genetic, linear optimization) were considered as well, due to their inherent ability to optimize multiple objectives @carvalho_etal_2020.
However, they require a lot of computing resources, and proper fine-tuning of parameters such as population size, mutation rate, and crossover rate, which makes them less suitable.
Affinity Propagation is an algorithm that does not require specifying the number of clusters up-front, but it is computationally expensive as well @frey_dueck_2007.

We found that the Louvain @blondel_etal_2008 and Leiden @traag_etal_2019 algorithms are the most suitable for this task, as they are designed for optimizing modularity in networks.
The algorithms are iterative and hierarchical, which makes them fast and efficient.

Similarly, in #cite(<rahiminejad_etal_2019>, form: "year") #cite_full(<rahiminejad_etal_2019>) performed a topological and functional comparison of community detection algorithms in biological networks.
They analyzed six algorithms based on certain criteria such as appropriate community size (not too small or too large), and performance speed.
The authors found that the Louvain algorithm @blondel_etal_2008 performed best in terms of quality and speed.

==== The Louvain/Leiden algorithm

The Louvain algorithm, introduced by #cite_full(<blondel_etal_2008>), is an algorithm for extracting non-overlapping communities in large networks.
The algorithm uses a greedy optimization technique to maximize the modularity of the network.

Modularity is a measure of the strength of division of a network.
Networks with high modularity have dense connections between the internal vertices of a community, and sparse connections between vertices of different communities.
The domain of the metric is between -0.5 (non-modular clustering) and 1 (fully modular clustering).
Optimizing the modularity theoretically results in the best possible clustering of the network, though for numerical computing reasons, the algorithm uses heuristics to approach the optimal solution.

The modularity of a network is defined as follows in @modularity @hairol_anuar_etal_2021.

$ Q = 1/(2m) sum_(i=1)^N sum_(j=1)^N [ A_("ij") - (k_i k_j)/(2m) ] delta (c_i, c_j) $ <modularity>

Where:

- $A$ is the adjacency matrix
- $k_i$ and $k_j$ are the degrees of the vertices $i$ and $j$ respectively
- $m$ is the number of edges in the network
- $N$ is the total number of vertices in the network
- $c_i$ and $c_j$ are the communities to which vertices $i$ and $j$ belong
- $delta (c_i, c_j)$ is 1 if $c_i$ and $c_j$ are in the same cluster, and 0 otherwise

#grid(
  columns: (50%, 50%),
  gutter: 1em,
  [
    #figure(
      table(
        columns: (auto),
        inset: 5pt,
        stroke: (x: none),
        align: (left),
        [*@louvain_algorithm*: Louvain algorithm],
        text(size: 10pt)[
          _graph_ $arrow.l$ original network \
          \
          *loop* \
            #h(1em) *for each* _vertex_ *in* _graph_ \
            #h(2em) Put _vertex_ in its own community \
            \
            #h(1em) #text(green.darken(40%), "// Phase 1: local modularity optimization") \
            #h(1em) *for each* _neighbour_ *in* _vertex_._neighbours_ \
            #h(2em) Move _vertex_ to community of _neighbour_ \
            #h(2em) *if* modularity gain \
            #h(3em) *break* \
            \
            #h(1em) #text(green.darken(40%), "// Phase 2: community aggregation") \
            #h(1em) *for each* ( _community_ : _graph_ ) \
            #h(2em) Reduce _community_ to a single vertex \
            \
            #h(1em) *if* modularity no longer increases \
            #h(2em) *break* \
        ]
      ),
      kind: "algorithm",
      supplement: "Algorithm",
      caption: [Louvain algorithm pseudocode],
    ) <louvain_algorithm>
  ],
  [
    The Louvain algorithm operates in two phases.
    In the first phase, the algorithm optimizes the modularity locally by moving each vertex into the community of their neighbour that yield the best modularity gain.
    This step is repeated for each vertex until a local maximum is reached.

    Then, the algorithm aggregates each community in a single vertex, while preserving the network structure.
    The algorithm can then be applied iteratively to the new network, until the modularity cannot be further increased.

    A visualization of the intermediate steps of the Louvain algorithm is shown in @louvain.
  ]
)

#figure(
    grid(
        columns: (auto, auto),
        rows: (auto, auto),
        gutter: 1em,
        [#include("/figures/07-proposed-solution/louvain-1.typ")],
        [#include("/figures/07-proposed-solution/louvain-2.typ")],
        [#include("/figures/07-proposed-solution/louvain-3.typ")],
        [#include("/figures/07-proposed-solution/louvain-4.typ")],
    ),
    caption: [Visualization of the Louvain algorithm]
) <louvain>

A major disadvantage of the Louvain algorithm is that it can only detect non-overlapping communities @blondel_etal_2008.
This means that a software component can only belong to one microservice, which is not in line with the principle of reuse in software engineering.
The algorithm has also been proven to generate small and disconnected communities @traag_etal_2019, which is not desirable in the context of microservices @fortunato_barthelemy_2007.

In #cite(<traag_etal_2019>, form: "year"), #cite_full(<traag_etal_2019>) introduced the Leiden algorithm, an improvement of the Louvain algorithm that addresses the disconnected community problem.
Similarly to the Louvain algorithm, the Leiden algorithm optimizes the quality of the network using the Constant Potts Model @traag_2011:

$ cal(H)(G,cal(P)) = sum_(C in cal(P)) |E(C, C)| - gamma binom(||C||, 2) $ <constant_potts_model>

#grid(
  columns: (50%, 50%),
  gutter: 1em,
  [
    The Leiden algorithm operates in three phases.
    The first and last phases equal those of the Louvain algorithm (i.e., local modularity optimization and community aggregation).

    In the second phase, the algorithm performs a refinement of partition on each small community.
    The refinement ensures that the algorithm does not get stuck in a local optimum using a probability distribution.
    The Leiden algorithm has been shown to outperform the Louvain algorithm in terms of quality and speed @traag_etal_2019.
  ],
  text(size: 10pt)[
    #figure(
      table(
        columns: (auto),
        inset: 5pt,
        stroke: (x: none),
        align: (left),
        [*@leiden_algorithm*: Leiden algorithm (refinement)],
        [
          #text(green.darken(40%), "// Phase 2: partition refinement") \
          *for each* ( _community_ : _graph_ ) \
          #h(1em) _partition_ $arrow.l$ _community_ \
          #h(1em) *for each* ( well connected _vertex_ : _partition_ ) \
          #h(2em) *if* _vertex_ is a singleton \
          #h(3em) assign _vertex_ to new community \
          #h(3em) using probability distribution _P_ \
        ]
      ),
      kind: "algorithm",
      supplement: "Algorithm",
      caption: [Leiden algorithm (refinement)],
    ) <leiden_algorithm>
  ]
)

Although the Leiden algorithm is more performant than the Louvain algorithm, it is more complex to implement due to the refinement phase.
Because of this added complexity, we opted to use the Louvain algorithm as default clustering algorithm for our solution.
However, the tool allows easy integration of additional algorithms such as the Leiden algorithm.
