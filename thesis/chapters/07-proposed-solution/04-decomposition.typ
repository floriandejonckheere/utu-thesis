== Decomposition

// 1. more automated means less work for the architect
// 2. use knowledge of experts when available
// 3. recommendations should be specified without knowledge of source code or intensive intervention of the architect

// Decide on top-down or bottom-up approach and motivate choice
// Top-down: start with one big package, then progressively split up into smaller packages
// Bottom-up: start with small packages (every class is a package), then progressively merge into bigger packages

// Application is not stateful (or negligible), so no database dependencies

// Strategies:
// - Logical coupling: classes that are often changed together are likely to be part of the same microservice
// - Semantic coupling: classes that are often mentioned together in documentation are likely to be part of the same microservice
// - Contributor coupling: classes that are often changed by the same developer are likely to be part of the same microservice

// Algorithms:
// - NSGA-II
// - NSGA-III (@carvalho_etal_2020)
// - Affinity Propagation (@al_debagy_martinek_2020)
//    - Advantages: no need to define amount of clusters before
// Comparison of community detection algorithms: @rahiminejad_etal_2019 @brito_etal_2021

// Algorithms:
// - Clustering: cannot use algorithms that require specifying the number of clusters up-front, because not automated enough (e.g. Spectral Clustering, K-Means, Agglomerative Clustering)
//   Affinity Propagation: no need to define amount of clusters before
// - Genetic algorithms: need to define a fitness function, but can be used to optimize multiple objectives
//   Require a lot of resources (slow), and proper fine-tuning of parameters (population size, mutation rate, crossover rate)
// - Graph algorithms: Kruskal is MST (not adjustable, does not optimize for quality metrics), Label Propagation may not always work on this type of graph
//   Louvain/Leiden: designed for optimizing modularity, multiple objectives

// Summary:
// Louvain/Leiden, because designed for this kind of clustering application
// Iterative and hierarchical, so they are fast
// Good balance between efficiency and effectiveness
// Also proposed as best algorithm by @rahiminejad_etal_2019 and @brito_etal_2021

// LOUVAIN/LEIDEN ALGORITHM
// Explain algorithm, define modularity
// Difference between Louvain and Leiden (@hairol_anuar_etal_2021)
// Drawbacks: generation of small communities (@fortunato_barthelemy_2007), only non-overlapping communities
