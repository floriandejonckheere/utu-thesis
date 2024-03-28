#import "@preview/acrostiche:0.3.1": *

#import "/cite.typ": citeauthor

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
    "K-Means, Hierarchical Agglomerative Clustering, Affinity Propagation",
    [
      // K-means
      @romani_etal_2022
      @wu_zhang_2022
      @hao_etal_2023
      @saidi_etal_2023
      // Hierarchical Agglomerative clustering
      @bandara_perera_2020
      @daoud_etal_2020
      // Affinity Propagation
      @al_debagy_martinek_2020
      // Hierarchical clustering
      @selmadji_etal_2020
      @santos_silva_2022
      @zaragoza_etal_2022
      @lourenco_silva_2023
      @ma_etal_2022
    ],

    "Evolutionary algorithms",
    "NSGA-II, NSGA-III",
    [
      // NSGA-II
      @zhang_etal_2020
      @jin_etal_2021
      @zhou_xiong_2022
      @li_etal_2023
      @kinoshita_kanuka_2022
      // NSGA-III
      @carvalho_etal_2020
      // Other
      @amiri_2018
    ],

    "Graph algorithms",
    "Kruskal, Louvain method",
    [
      // Kruskal
      @yang_etal_2022
      @mazlami_etal_2017
      // Louvain method
      @filippone_etal_2023
    ],

    "Other algorithms",
    "Linear optimization, custom algorithms",
    [
      // Linear
      @filippone_etal_2021
      @quattrocchi_etal_2024
      // Custom
      @kamimura_etal_2018
      @escobar_etal_2016
      // Seed expension
      @agarwal_etal_2021
      // Rule-based
      @eyitemi_reiff_marganiec_2020
      // Gravity centers
      @selmadji_etal_2020
      // Customizable
      @lopes_silva_2023
    ],
  ),
  caption: [Microservice candidate identification algorithm]
) <slr_algorithms>

==== Clustering algorithms

The first class of algorithms identified in the literature is clustering algorithms.
Clustering algorithms are unsupervised machine learning algorithms that aim to find an optimal partitioning of the graph.
Typical clustering algorithms used for this purpose are K-Means clustering and agglomerative clustering.

Examples of publications using K-Means clustering to identify microservice candidates are #citeauthor(<saidi_etal_2023>).

#citeauthor(<al_debagy_martinek_2020>) use Affinity Propagation @frey_dueck_2007 to cluster vector representations of operation names in a software system.
Affinity Propagation is a clustering algorithm that identifies exemplars in the data, which are used to represent the clusters.

A hierarchical clustering approach is used by #citeauthor(<lourenco_silva_2023>) based on similarity between domain entities accesses and development history of source code files.

#citeauthor(<selmadji_etal_2020>) propose two possible algorithms for microservice identification: a hierarchical clustering algorithm, and a clustering algorithm based on gravity centers.

==== Evolutionary algorithms

Evolutionary algorithms are the second class of algorithms present in the literature.
Evolutionary algorithms, and in particular genetic algorithms, are algorithms aimed at solving optimization problems by borrowing techniques from natural selection and genetics.
These algorithms typically operate iteratively, selecting the best solutions from a population at each iteration (called a generation), and then combining the selected solutions to create new combinations for the next generation.
The process is then repeated until certain criteria are met, for example a maximum number of generations, convergence of the population, or a quality indicator.

Examples of publications using Non-Dominated Sorting Algorithm II (NGSA-II) as multi-objective optimization algorithm to identify microservice candidates are #citeauthor(<zhou_xiong_2022>), #citeauthor(<kinoshita_kanuka_2022>), and #citeauthor(<zhang_etal_2020>).
#citeauthor(<carvalho_etal_2020>) use the next generation of NSGA, NSGA-III, in order to find a solution for the problem.

#citeauthor(<amiri_2018>) relies on a genetic algorithm using Turbo-MQ @mitchell_etal_2001 as fitness function.

==== Graph algorithms

Another common approach to identify microservice candidates is to use classical algorithms from graph theory.

For example, #citeauthor(<mazlami_etal_2017>) and #citeauthor(<yang_etal_2022>) use Kruskal's algorithm @algorithm_design to partition the graph into connected clusters.
Kruskal's algorithm is a greedy algorithm that finds the minimum spanning forest for an undirected weighted graph.

#citeauthor(<filippone_etal_2023>) apply the Louvain community detection algorithm @blondel_etal_2008 to obtain the granularity of the microservices, and high-cohesive communities of nodes.
The Louvain method is a greedy optimization algorithm that aims to extract non-overlapping communities from a graph, using the modularity value as optimization target.

==== Other algorithms

Other publications using algorithms that do not fit into one of the previous categories are grouped under the "Other algorithms" category.

// TODO: note about how most algorithms are single- or multi-objective optimization algorithms for graph clustering to find a Pareto-optimal solution

For example, the authors of #citeauthor(<quattrocchi_etal_2024>) incorporated a Mixed Integer Linear Programming (MILP) solver in their solution.
The MILP solver is used to find a solution for an optimization problem that decomposes the software system into microservices, based on the placement of operations and data entities according to the users' needs.
#citeauthor(<filippone_etal_2021>) use a linear optimization algorithm to solve a combinatorial optimization problem.

The approach taken by #citeauthor(<kamimura_etal_2018>) is to use a custom clustering algorithm named SArF @kobayashi_etal_2012, that aims at identifying software subsystems without the need for human intervention.

//#citeauthor(<lopes_silva_2023>) propose a customizable approach to microservice identification, where the user can define the criteria for the identification process.
