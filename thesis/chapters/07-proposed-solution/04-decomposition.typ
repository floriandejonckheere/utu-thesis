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
Bottom-up algorithms on the other hand, start by assigning each element to its own cluster, then merge suitable clusters together in succession, until a stopping criterion is met.

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

We found that the Louvain and Leiden algorithms @blondel_etal_2008 /* TODO: reference */ are the most suitable for this task, as they are designed for optimizing modularity in networks.
The algorithms are iterative and hierarchical, which makes them fast and efficient.

Similarly, in #cite(<rahiminejad_etal_2019>, form: "year") #citeauthor(<rahiminejad_etal_2019>) performed a topological and functional comparison of community detection algorithms in biological networks.
They analyzed six algorithms based on certain criteria such as appropriate community size (not too small or too large), and performance speed.
The authors found that the Louvain algorithm @blondel_etal_2008 performed best in terms of quality and speed.

==== The Louvain/Leiden algorithm

// LOUVAIN/LEIDEN ALGORITHM
// Explain algorithm, define modularity
// Difference between Louvain and Leiden (@hairol_anuar_etal_2021)
// Drawbacks: generation of small communities (@fortunato_barthelemy_2007), only non-overlapping communities
