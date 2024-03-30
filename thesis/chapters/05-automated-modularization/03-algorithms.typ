#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": citeauthor

=== Algorithms

Microservice candidate identification is a problem that is often solved by representing the architecture as a directed graph.
The graph exposes the relationship between the elements of the software architectures.
The nodes of the graph represent the classes, modules, or components, and the edges the function or method calls between them.
Often the edges are weighted, representing the frequency or cost of the calls.
Based on the information contained within, the graph is then divided into several clusters, each encapsulating a microservice candidate.
The goal is to find a partitioning of the graph that minimizes the number of edges between clusters and maximizes the number of edges within clusters.

The identified classes of microservice candidate identification algorithms are described in @slr_algorithms.

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: (left, left, left),
    [*Type*], [*Example algorithms*], [*Publications*],
    "Clustering algorithms",
    "K-Means, DBSCAN, Hierarchical Agglomerative Clustering, Affinity Propagation",
    [
      @daoud_etal_2020 // Hierarchical Agglomerative clustering
      @saidi_etal_2023 // K-means
      @al_debagy_martinek_2020 // Affinity Propagation
      @selmadji_etal_2020 // Hierarchical clustering
      @bandara_perera_2020 // Hierarchical Agglomerative clustering
      @wu_zhang_2022 // K-means
      @zaragoza_etal_2022 // Hierarchical clustering
      @santos_silva_2022 // Hierarchical clustering
      @romani_etal_2022 // K-means
      @lourenco_silva_2023 // Hierarchical clustering
      @hao_etal_2023 // K-means
      @ma_etal_2022 // Hierarchical clustering
      @sellami_etal_2022 // DBSCAN
      @nitin_etal_2022 // Hierarchical Agglomerative clustering, K-Means, Girvan-Newman
      @kalia_etal_2021 // Hierarchical clustering
    ],

    "Evolutionary algorithms",
    "NSGA-II, NSGA-III",
    [
      @amiri_2018 // NSGA-II
      @li_etal_2023 // NSGA-II
      @zhou_xiong_2022 // NSGA-II
      @carvalho_etal_2020 // NSGA-II
      @kinoshita_kanuka_2022 // NSGA-II
      @jin_etal_2021 // NSGA-II
      @zhang_etal_2020 // NSGA-II
    ],

    "Graph algorithms",
    "Kruskal, Louvain method, Label Propagation",
    [
      @yang_etal_2022 // Kruskal
      @mazlami_etal_2017 // Kruskal
      @filippone_etal_2023 // Louvain method
      @brito_etal_2021 // Louvain method
      @hasan_etal_2023 // Leiden algorithm, Mean Shift
      @nitin_etal_2022 // Label propagation
    ],

    "Other algorithms",
    "Linear optimization, custom algorithms",
    [
      @quattrocchi_etal_2024 // Linear
      @escobar_etal_2016 // Custom
      @kamimura_etal_2018 // Custom
      @selmadji_etal_2020 // Gravity centers
      @filippone_etal_2021 // Linear
      @agarwal_etal_2021 // Seed expansion
      @eyitemi_reiff_marganiec_2020 // Rule-based
      @wei_etal_2020 // Mapping-based
      @hasan_etal_2023 // Gaussian Mixture
    ],
  ),
  caption: [Microservice candidate identification algorithm]
) <slr_algorithms>

==== Clustering algorithms

The first class of algorithms identified in the literature is clustering algorithms.
Clustering algorithms are unsupervised machine learning algorithms that aim to find an optimal partitioning of the graph.
Typical clustering algorithms used for this purpose are K-Means clustering and agglomerative clustering.

Examples of publications using K-Means clustering to identify microservice candidates are #citeauthor(<saidi_etal_2023>), #citeauthor(<wu_zhang_2022>), #citeauthor(<romani_etal_2022>), and #citeauthor(<hao_etal_2023>).

#citeauthor(<al_debagy_martinek_2020>) use Affinity Propagation @frey_dueck_2007 to cluster vector representations of operation names in a software system.
Affinity Propagation is a clustering algorithm that identifies exemplars in the data, which are used to represent the clusters.

Hierarchical clustering approaches are used in various publications @selmadji_etal_2020 @santos_silva_2022 @lourenco_silva_2023 @ma_etal_2022 @zaragoza_etal_2022 @bandara_perera_2020.
#citeauthor(<lourenco_silva_2023>) uses similarity between domain entities accesses and development history of source code files as a guiding measure for the clustering algorithm, while #citeauthor(<zaragoza_etal_2022>) uses structural and data cohesion of microservices.
#citeauthor(<daoud_etal_2020>) extend the hierarchical agglomerative clustering (HAC) algorithm @murtagh_legendre_2014 with a collaborative approach, where the clustering is performed by multiple homogenous clustering nodes, each responsible for a subset of the data.

#citeauthor(<selmadji_etal_2020>) propose two possible algorithms for microservice identification: a hierarchical clustering algorithm, and a clustering algorithm based on gravity centers.

#citeauthor(<sellami_etal_2022>) use the Density-Based Spatial Clustering of Applications with Noise (DBSCAN) algorithm @ester_etal_1996 to identify microservices.

==== Evolutionary algorithms

Evolutionary algorithms are the second class of algorithms present in the literature.
Evolutionary algorithms, and in particular genetic algorithms, are algorithms aimed at solving optimization problems by borrowing techniques from natural selection and genetics.
These algorithms typically operate iteratively, selecting the best solutions from a population at each iteration (called a generation), and then combining the selected solutions to create new combinations for the next generation.
The process is then repeated until certain criteria are met, for example a maximum number of generations, convergence of the population, or a quality indicator.

Examples of publications using Non-Dominated Sorting Algorithm II (NGSA-II) as multi-objective optimization algorithm to identify microservice candidates are #citeauthor(<zhou_xiong_2022>), #citeauthor(<kinoshita_kanuka_2022>), #citeauthor(<zhang_etal_2020>), #citeauthor(<jin_etal_2021>), and #citeauthor(<li_etal_2023>).
#citeauthor(<carvalho_etal_2020>) use the next generation of NSGA, NSGA-III, in order to find a solution for the problem.

#citeauthor(<amiri_2018>) rely on a genetic algorithm using Turbo-MQ @mitchell_etal_2001 as fitness function.

==== Graph algorithms

Another common approach to identify microservice candidates is to use classical algorithms from graph theory.

For example, #citeauthor(<mazlami_etal_2017>) and #citeauthor(<yang_etal_2022>) use Kruskal's algorithm @algorithm_design to partition the graph into connected clusters.
Kruskal's algorithm is a greedy algorithm that finds the minimum spanning forest for an undirected weighted graph.

#citeauthor(<filippone_etal_2023>) apply the Louvain community detection algorithm @blondel_etal_2008 to obtain the granularity of the microservices, and high-cohesive communities of nodes.
The Louvain method is a greedy optimization algorithm that aims to extract non-overlapping communities from a graph, using the modularity value as optimization target.
#citeauthor(<hasan_etal_2023>) use the Leiden algorithm @traag_etal_2019, an improvement of the Louvain method that uses a refinement step to improve the quality of the communities.

#citeauthor(<nitin_etal_2022>) use Context sensitive Label Propagation (CARGO), an algorithm built on the principles of the Label Propagation algorithm @zhu_ghahramani_2003.
CARGO is a community detection algorithm that is able to leverage the context embedded in the dependency graph to increase the cohesiveness of the communities.

==== Other algorithms

Other publications using algorithms that do not fit into one of the previous categories are grouped in a single category.

// TODO: note about how most algorithms are single- or multi-objective optimization algorithms for graph clustering to find a Pareto-optimal solution

For example, the authors of #citeauthor(<quattrocchi_etal_2024>) incorporated a Mixed Integer Linear Programming (MILP) solver in their solution.
The MILP solver is used to find a solution for an optimization problem that decomposes the software system into microservices, based on the placement of operations and data entities according to the users' needs.
#citeauthor(<filippone_etal_2021>) use a linear optimization algorithm to solve a combinatorial optimization problem.

The approach taken by #citeauthor(<kamimura_etal_2018>) is to use a custom clustering algorithm named SArF @kobayashi_etal_2012, that aims at identifying software subsystems without the need for human intervention.
#citeauthor(<escobar_etal_2016>) also use a custom clustering algorithm, detecting optimal microservices based on a meta-model of the class hierarchy.

#citeauthor(<agarwal_etal_2021>) propose an algorithm based on seed expansion.
The seed classes are detected by using formal concept analysis.
Then, using a seed expansion algorithm, clusters are created around the seeds by pulling in related code artefacts based on implementation structure of the software system @agarwal_etal_2021.

#citeauthor(<eyitemi_reiff_marganiec_2020>) use a rule-based approach to microservice candidate identification.
The 6 proposed rules are based on the principles of high cohesion and low coupling, and using a step-based protocol can be used to manually decompose a monolithic system into microservices.
