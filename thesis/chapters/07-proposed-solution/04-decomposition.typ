#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": citeauthor

== Decomposition

Monolith decomposition is the process of identifying microservice candidates in a monolithic application.
The goal of this process is to split the monolith into smaller, more manageable software components which can be deployed independently.
Traditionally, monolith decomposition is a manual process that requires a deep understanding of the software architecture and business requirements.
However, the burden of manual decomposition can be alleviated by using automated tools and algorithms.
The knowledge of software architects should be leveraged where possible to guide the decomposition process, without imposing the requirement of a deep understanding of the software architecture.
For example, #citeauthor(<li_etal_2023>) propose a method that utilizes expert knowledge, however requires the recommendations to be written in a domain-specific language, increasing the burden on the architect.

Our solution proposes an automatic way to identify microservice candidates in a monolithic application using clustering algorithms.
The decomposition process can be fine-tuned by assigning an importance to the different types of coupling strategies.
This way, the software architect can decide which coupling strategies are most relevant to the decomposition process.

Clustering algorithms group similar elements together based on one or multiple criteria.
Generally these algorithms work iteratively either top-down or bottom-up.
Top-down algorithms start by assigning all elements to one big cluster, and then progressively split it into smaller clusters until a stopping criterion is met.
// TODO: examples? Girvan-Newman
Bottom-up algorithms on the other hand, start by assigning each element to its own cluster, then merge suitable clusters together in succession, until a stopping criterion is met.
// TODO: examples? Louvain/Leiden, Hierarchical Agglomerative Clustering

==== Selection of algorithm

In @slr_algorithms, we performed an analysis of the state of the art in clustering algorithms used for microservice candidate identification.
We considered the following criteria when selecting the most suitable algorithm for our task:

+ *Automation*: The algorithm should not require architectural knowledge up-front (e.g. number of clusters)
+ *Performance*: The algorithm should be able to handle large datasets efficiently

The first criteria disqualifies algorithms that require specifying the number of clusters up-front, such as Spectral Clustering, K-Means, and Agglomerative Clustering.
Search-based algorithms (e.g. genetic, linear optimization) were considered as well, due to their inherent ability to optimize multiple objectives @carvalho_etal_2020.
However, they require a lot of computing resources, and proper fine-tuning of parameters such as population size, mutation rate, and crossover rate, which makes them less suitable.
// TODO: Affinity Propagation: no need to specify number of clusters
Similarly, graph algorithms such as Kruskal's algorithm /* TODO: reference */ and Label Propagation /* TODO: reference */ were considered, but they may not always work on this type of graph due to the nature of the algorithm.

We found that the Louvain @blondel_etal_2008 and Leiden @traag_etal_2019 methods are the most suitable for this task, as they are designed for optimizing modularity in networks.
The algorithms are iterative and hierarchical, which makes them fast and efficient.

Similarly, in #cite(<rahiminejad_etal_2019>, form: "year") #citeauthor(<rahiminejad_etal_2019>) performed a topological and functional comparison of community detection algorithms in biological networks.
They analyzed six algorithms based on certain criteria such as appropriate community size (not too small or too large), and performance speed.
The authors found that the Louvain method @blondel_etal_2008 performed best in terms of quality and speed.

==== The Louvain/Leiden method

The Louvain method, introduced by #citeauthor(<blondel_etal_2008>), is an algorithm for extracting non-overlapping communities in large networks.
The method uses a greedy optimization technique to maximize the modularity of the network.

Modularity is a measure of the strength of division of a network.
Networks with high modularity have dense connections between the internal vertices of a community, and sparse connections between vertices of different communities.
The domain of the metric is between -0.5 (non-modular clustering) and 1 (fully modular clustering).
Optimizing the modularity theoretically results in the best possible clustering of the network, though for numerical computing reasons, the algorithm uses heuristics to approach the optimal solution.

The modularity of a network is defined as follows @hairol_anuar_etal_2021:

$ Q = 1/(2m) sum_(i=1)^N sum_(j=1)^N [ A_("ij") - (k_i k_j)/(2m) ] delta (c_i, c_j) $ <modularity>

Where:

- $A$ is the adjacency matrix
- $k_i$ and $k_j$ are the degrees of the vertices $i$ and $j$ respectively
- $m$ is the number of edges in the network
- $N$ is the total number of vertices in the network
- $c_i$ and $c_j$ are the communities to which vertices $i$ and $j$ belong
- $delta (c_i, c_j)$ is 1 if $c_i$ and $c_j$ are in the same cluster, and 0 otherwise

The Louvain method operates in two phases.
In the first phase, the algorithm optimizes the modularity locally by moving each vertex into the community of their neighbour that yield the best modularity gain.
This step is repeated for each vertex until a local maximum is reached.
Then, the algorithm reduces each community to a single vertex, while preserving the network structure.
The algorithm can then be applied iteratively to the new network, until the modularity cannot be further increased.

#figure(
    grid(
        columns: (auto, auto),
        rows: (auto, auto),
        gutter: 1em,
        [#include("/figures/louvain-1.typ")],
        [#include("/figures/louvain-2.typ")],
        [#include("/figures/louvain-3.typ")],
        [#include("/figures/louvain-4.typ")],
    ),
    caption: [Louvain method intermediate steps]
) <louvain>

// TODO: algorithm listing?

The obvious disadvantage of the Louvain method is that it can only detect non-overlapping communities @blondel_etal_2008.
This means that a software component can only belong to one microservice, which is not in line with the principle of reuse in software engineering.
An other disadvantage of the algorithm is that it may generate small communities, which are not desirable in the context of microservices @fortunato_barthelemy_2007.

In #cite(<traag_etal_2019>, form: "year"), #citeauthor(<traag_etal_2019>) introduced the Leiden method, an improvement of the Louvain method that addresses the disconnected community problem.
Similarly to the Louvain method, the Leiden method optimizes the quality of the network using the Constant Potts Model @traag_2011:

$ cal(H)(G,cal(P)) = sum_(C in cal(P)) |E(C, C)| - gamma binom(||C||, 2) $ <constant_potts_model>

The Leiden method operates in three phases.
The first and last phases equal those of the Louvain method (i.e., local optimization and reduction of the network).
In the second phase, the algorithm performs a refinement of partition on each small community.

// TODO: figures or algorithms

The Leiden method has been shown to outperform the Louvain method in terms of quality and speed @traag_etal_2019.
