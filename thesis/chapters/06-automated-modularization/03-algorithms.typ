#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

=== Algorithms <slr_algorithms>

Microservice candidate identification is a problem that is commonly solved by representing the architecture as a directed weighted graph.
The graph exposes the relationship between the elements of the applications.
The vertices of the graph represent the classes, modules, or components, and the edges the function or method calls between them.
Often the edges are weighted, representing the frequency or cost of the calls.
Based on the information contained within, the graph is then divided into several clusters, each encapsulating a microservice candidate.
The goal is to find a partitioning of the graph that minimizes the number of edges between clusters and maximizes the number of edges within clusters.

We categorized #total(algorithms) algorithms in the literature into three main classes: clustering algorithms, evolutionary algorithms, and graph algorithms.
Other algorithms that do not fit into one of these categories, or custom algorithms are grouped in a single _Other_ category.

#grid(
  columns: (57%, 43%),
  gutter: 1em,
  [
    #figure(
      include("/figures/06-automated-modularization/algorithms.typ"),
      caption: [SDLC algorithm categories]
    ) <slr_algorithms_chart>
  ],
  [
    The majority of the algorithms identified in the literature are clustering algorithms (#count(algorithms, "clustering")\; #percentage(algorithms, "clustering")), followed by evolutionary algorithms (#count(algorithms, "evolutionary")\; #percentage(algorithms, "evolutionary")) and graph algorithms (#count(algorithms, "graph")\; #percentage(algorithms, "graph")).
    The remaining algorithms are grouped in the _Other algorithms_ category (#count(algorithms, "other")\; #percentage(algorithms, "other")).
  ]
)

@slr_algorithms_chart presents a visual representation of the distribution of the algorithms in the identified categories.

#pagebreak()

The identified classes of microservice candidate identification algorithms and the relevant publications are listed in @slr_algorithms_table.

#figure(
  table(
    columns: (20%, auto, 35%),
    inset: 10pt,
    stroke: (x: none),
    align: (left, left, left),
    [*Type*], [*Example algorithms*], [*Publications*],
    "Clustering algorithms",
    "K-Means, DBSCAN, Hierarchical Agglomerative Clustering, Affinity Propagation",
    [
      #algorithms.at("clustering").map(p => ref(label(p))).join()
    ],

    "Evolutionary algorithms",
    "NSGA-II, NSGA-III",
    [
      #algorithms.at("evolutionary").map(p => ref(label(p))).join()
    ],

    "Graph algorithms",
    "Kruskal, Louvain algorithm, Leiden algorithm, Label Propagation",
    [
      #algorithms.at("graph").map(p => ref(label(p))).join()
    ],

    "Other algorithms",
    "Linear optimization, custom algorithms",
    [
      #algorithms.at("other").map(p => ref(label(p))).join()
    ],
  ),
  caption: [Microservice candidate identification algorithm]
) <slr_algorithms_table>

==== Clustering algorithms

The first class of algorithms identified in the literature is clustering algorithms.
Clustering algorithms are unsupervised machine learning algorithms that aim to find an optimal partitioning of the graph.
Typical clustering algorithms used for this purpose are K-Means clustering and agglomerative clustering.

Examples of publications that used K-Means clustering to identify microservice candidates are #cite_full(<saidi_etal_2023>), #cite_full(<wu_zhang_2022>), #cite_full(<romani_etal_2022>), and #cite_full(<hao_etal_2023>).

#cite_full(<al_debagy_martinek_2020>) used Affinity Propagation @frey_dueck_2007 to cluster vector representations of operation names in a software system.
Affinity Propagation is a clustering algorithm that identifies exemplars in the data, which are used to represent the clusters @frey_dueck_2007.

Hierarchical clustering approaches are used in various publications @selmadji_etal_2020, @zaragoza_etal_2022, @santos_silva_2022, @ma_etal_2022, @lourenco_silva_2023, @bandara_perera_2020.
#cite_full(<lourenco_silva_2023>) used similarity between domain entities accesses and development history of source code files as a guiding measure for the clustering algorithm, while #cite_full(<zaragoza_etal_2022>) used structural and data cohesion of microservices.
#cite_full(<daoud_etal_2020>) extended the Hierarchical Agglomerative Clustering (HAC) algorithm @murtagh_legendre_2014 with a collaborative approach, where the clustering is performed by multiple homogenous clustering nodes, each responsible for a subset of the data.
They named the algorithm collaborative Hierarchical Agglomerative Clustering with Collaborative Nodes (cHAC).

#cite_full(<selmadji_etal_2020>) proposed two possible algorithms for microservice candidate identification: a hierarchical clustering algorithm, and a clustering algorithm based on gravity centers.

#cite_full(<sellami_etal_2022>) used the Density-Based Spatial Clustering of Applications with Noise (DBSCAN) algorithm @ester_etal_1996 to identify microservice candidates.

==== Evolutionary algorithms

Evolutionary algorithms are the second class of algorithms identified in the literature.
Evolutionary algorithms, and in particular genetic algorithms, are algorithms aimed at solving optimization problems by borrowing techniques from natural selection and genetics @vikhar_2016.
These algorithms typically operate iteratively, selecting the best solutions from a population at each iteration (also called a generation), and then combining the selected solutions to create new combinations for the next generation.
The process is then repeated until certain criteria are met, for example a maximum number of generations, convergence of the population, or fulfillment of a quality indicator.

Examples of publications that used Non-Dominated Sorting Algorithm II (NGSA-II) as multi-objective optimization algorithm to identify microservice candidates are #cite_full(<zhou_xiong_2022>), #cite_full(<kinoshita_kanuka_2022>), #cite_full(<zhang_etal_2020>), #cite_full(<jin_etal_2021>), and #cite_full(<li_etal_2023>).
#cite_full(<carvalho_etal_2020>) used the next generation of NSGA, NSGA-III, in order to find a solution for the problem.

#cite_full(<amiri_2018>) relied on a genetic algorithm using Turbo-MQ @mitchell_etal_2001 as fitness function to measure the quality of the clusters.

==== Graph algorithms

Another common approach to identify microservice candidates is to use classical algorithms from graph theory.

For example, #cite_full(<mazlami_etal_2017>) and #cite_full(<yang_etal_2022>) used Kruskal's algorithm @kleinberg_tardos_2006 to partition the graph into connected clusters.
Kruskal's algorithm is a greedy algorithm that finds the minimum spanning forest for an undirected weighted graph @kleinberg_tardos_2006.

#cite_full(<filippone_etal_2023>) applied the Louvain community detection algorithm @blondel_etal_2008 to obtain the granularity of the microservices, and high-cohesive communities of vertices.
The Louvain algorithm is a greedy optimization algorithm that aims to extract non-overlapping communities from a graph, using the modularity value as optimization target @blondel_etal_2008.
#cite_full(<hasan_etal_2023>) used the Leiden algorithm @traag_etal_2019, an improvement of the Louvain algorithm that uses a refinement step to improve the quality of the communities.

#cite_full(<cao_zhang_2022>) used both the Leiden algorithm and the hierarchical clustering algorithm to identify microservice candidates.
First, the Leiden algorithm is used to detect cohesive communities in static and dynamic analysis data, and then the hierarchical clustering algorithm is used to merge the communities into microservice candidates based on a call relation matrix.

#cite_full(<nitin_etal_2022>) used Context sensitive Label Propagation (CARGO), an algorithm built on the principles of the Label Propagation algorithm @zhu_ghahramani_2003.
CARGO is a community detection algorithm that is able to leverage the context embedded in the dependency graph to increase the cohesiveness of the communities.

==== Other algorithms

Other publications using algorithms that do not fit into one of the previous categories are grouped in a single category.
These algorithms are often custom algorithms, or algorithms from other domains that are adapted to the problem of microservice candidate identification.
Some authors define one or multiple objectives to optimize, then use a single- or multi-objective optimization algorithm to find a Pareto-optimal solution to the problem.

For example, the authors of #cite_full(<quattrocchi_etal_2024>) incorporated a Mixed Integer Linear Programming (MILP) solver in their solution.
The MILP solver is used to find a solution for an optimization problem that decomposes the software system into microservices, based on the placement of operations and data entities according to the users' needs.
#cite_full(<filippone_etal_2021>) used a linear optimization algorithm to solve a combinatorial optimization problem.

The approach taken by #cite_full(<kamimura_etal_2018>) is to use a custom clustering algorithm named SArF @kobayashi_etal_2012, that aims at identifying software subsystems without the need for human intervention.
#cite_full(<escobar_etal_2016>) also used a custom clustering algorithm, detecting optimal microservice candidates based on a meta-model of the class hierarchy.

#cite_full(<agarwal_etal_2021>) proposed an algorithm based on seed expansion.
The seed classes are detected by using formal concept analysis.
Then, using a seed expansion algorithm, clusters are created around the seeds by pulling in related code artefacts based on implementation structure of the software system @agarwal_etal_2021.

#cite_full(<eyitemi_reiff_marganiec_2020>) used a rule-based approach to microservice candidate identification.
The six proposed rules are based on the principles of high cohesion and low coupling, and using a step-based protocol can be used to manually decompose a monolith system into microservices.
