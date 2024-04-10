#import "/helpers.typ": citeauthor

== Evaluation

Several quality metrics were considered to evaluate the quality of the microservice decomposition.
#citeauthor(<carvalho_etal_2019>) conducted an analysis of the criteria used to evaluate the quality of microservice-based architectures and found that the most common metrics are cohesion and coupling, as does our literature review win @automatedmodularization.
In addition to this, they conclude that in many cases the decomposition process is guided only by these two metrics.
In other cases, the software architects use other metrics (e.g. network overhead, CPU usage), although coupling and cohesion remain the dominant ones.
According to experts, using four quality metrics is a good balance between the number of metrics and the quality of the solution @carvalho_etal_2019.

#citeauthor(<candela_etal_2016>) studied a large number of metrics to evaluate the quality of microservice-based architectures, including network overhead, CPU, and memory.
They affirmed the need for more than two metrics to ensure the quality of the decomposition.

// TODO: justify choice of metrics

We distinguish between functional and non-functional metrics.

=== Functional metrics

==== Coupling

Coupling is a measure of the degree of interdependence between modules in a software system @software_engineering_vocabulary_2017.
In the context of microservices, individual coupling is defined as the sum of static calls from methods within a microservice candidate $M_c$ in a solution $S$ to another microservice candidate $M_c in S$ @carvalho_etal_2020.

$ italic("coup") (M_c) = sum_(v_i in M_c, v_j in.not M_c) italic("calls") (v_i, v_j) $ <individual_coupling_formula>

Where $v_i$ and $v_j$ are methods belonging and not belonging to $M_c$ respectively, and $italic("calls")$ returns the number of method calls present in the body of method $v_i$ made to method $v_j$.

The total coupling of a solution is the sum of the individual couplings of all microservice candidates $M_c$.

$ italic("Coupling") = sum_(M_c in S) italic("coup") (M_c) $ <total_coupling_formula>

A lower total coupling indicates a better decomposition.

==== Cohesion

Cohesion is a measure of the degree to which internal elements of a module in a software system are related to each other @software_engineering_vocabulary_2017.
Microservice candidates cohesion is defined as the number of static calls between methods within a microservice candidate $M_c$ in a solution $S$, divided by all possible existing static calls in $S$ @carvalho_etal_2020.
The metric indicates how strongly related the methods internal to a microservice candidate are.

To compute the individual cohesion of a microservice candidate $M_c$, we first introduce the boolean function $italic("ref")$, which indicates the existence of at least one static call between methods $v_i$ and $v_j$ in $D$.

$ italic("ref") (v_i, v_j) = cases(1 "if" italic("calls") (v_i, v_j) > 0, 0 "otherwise") $ <cohesion_formula>

The cohesion of a microservice candidate $M_c$ is then calculated as described in @individual_cohesion_formula.

$ italic("coh") (M_c) = ( sum_(v_i in M_c, v_j in M_c) italic("ref") ( v_i, v_j) ) / ( |M_c| ( |M_c| - 1) / 2 ) $ <individual_cohesion_formula>

The total cohesion of a solution is the sum of the individual cohesion of all microservice candidates $M_c$.

$ italic("Cohesion") = sum_(M_c in S) italic("coh") (M_c) $ <total_cohesion_formula>

A higher total cohesion indicates a better decomposition.

==== Complexity

Complexity is a measure of the number of operations performed by a method in a class @al_debagy_martinek_2020.
We use the number of operations to compute the individual complexity of a microservice candidate $M_c$ in a solution $S$.
The metric is based on the Weighted Methods per Class (WMC) metric, which is the sum of the complexities of all methods in a class @chidamber_kemerer_1994.
Classes and methods with lower complexity are associated with better maintainability and understandability.

$ italic("numops") (M_c) = sum_(v_i in M_c) italic("ops") (v_i) $ <complexity_formula>

Where $italic("ops")$ returns the number of operations performed by method $v_i$.

The total complexity of a solution is the sum of the individual complexities of all microservice candidates $M_c$.

$ italic("Complexity") = sum_(M_c in S) italic("numops") (M_c) $ <total_complexity_formula>

A lower total complexity indicates a better decomposition.

// TODO: Silhouette coefficient
// TODO: Usage metric: sum of inheritance factor @bandara_perera_2020
// TODO: Size: @hasan_etal_2023 @kalia_etal_2021 @wu_etal_2005

=== Non-functional metrics

==== Network overhead

// Network overhead: size of primitive types in method calls over microservice boundaries (@carvalho_etal_2020, @filippone_etal_2021)


// Modularization: user provides set of labels (features), algorithm labels vertices (@carvalho_etal_2020)
