#import "/helpers.typ": *

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

$ italic("coup")(M_c) = sum_(v_i in M_c, v_j in.not M_c) italic("calls")(v_i, v_j) $ <individual_coupling_formula>

Where $v_i$ and $v_j$ are methods belonging and not belonging to $M_c$ respectively, and $italic("calls")(v_i, v_j)$ returns the number of method calls present in the body of method $v_i$ made to method $v_j$.

The total coupling of a solution is the sum of the individual couplings of all microservice candidates $M_c$.

$ italic("Coupling") = sum_(M_c in S) italic("coup")(M_c) $ <total_coupling_formula>

A lower total coupling indicates a better decomposition.

==== Cohesion

Cohesion is a measure of the degree to which internal elements of a module in a software system are related to each other @software_engineering_vocabulary_2017.
Cohesion of microservice candidates is defined as the number of static calls between methods within a microservice candidate $M_c$ in a solution $S$, divided by the total number of possible static method calls in $M_c$ @carvalho_etal_2020.
The metric indicates how strongly related the methods internal to a microservice candidate are.

To compute the individual cohesion of a microservice candidate $M_c$, we first introduce the boolean function $italic("ref")$, which indicates the existence of at least one method call between methods $v_i$ and $v_j$ in $M_c$.

$ italic("ref")(v_i, v_j) = cases(1 "if" italic("calls")(v_i, v_j) > 0, 0 "otherwise") $ <cohesion_formula>

The cohesion of a microservice candidate $M_c$ is then calculated as described in @individual_cohesion_formula, where $|M_c|$ is the cardinality of method calls in $M_c$.

$ italic("coh")(M_c) = ( sum_(v_i in M_c, v_j in M_c) italic("ref")( v_i, v_j) ) / ( |M_c| ( |M_c| - 1) / 2 ) $ <individual_cohesion_formula>

The total cohesion of a solution is the sum of the individual cohesion of all microservice candidates $M_c$.

$ italic("Cohesion") = sum_(M_c in S) italic("coh")(M_c) $ <total_cohesion_formula>

A higher total cohesion indicates a better decomposition.

==== Complexity

Complexity is a measure of the number of operations performed by a method in a class @al_debagy_martinek_2020.
We use the number of operations to compute the individual complexity of a microservice candidate $M_c$ in a solution $S$.
The metric is based on the Weighted Methods per Class (WMC) metric, which is the sum of the complexities of all methods in a class @chidamber_kemerer_1994.
Classes and methods with lower complexity are associated with better maintainability and understandability.

$ italic("numops")(M_c) = sum_(v_i in M_c) italic("ops")(v_i) $ <complexity_formula>

Where $italic("ops")$ returns the number of operations performed by method $v_i$.

The total complexity of a solution is the sum of the individual complexities of all microservice candidates $M_c$.

$ italic("Complexity") = sum_(M_c in S) italic("numops")(M_c) $ <total_complexity_formula>

A lower total complexity indicates a better decomposition.

// TODO: Silhouette coefficient
// TODO: Usage metric: sum of inheritance factor @bandara_perera_2020
// TODO: Size: @hasan_etal_2023 @kalia_etal_2021 @wu_etal_2005

=== Non-functional metrics

==== Network overhead

Microservices communicate over a network with one another, which introduces overhead in terms of latency and bandwidth.
In order to keep this overhead low, it is important that method calls between microservices are kept to a minimum, and that the size of the data exchanged (e.g. parameters and return values) is kept small.
Using the source code of the monolith application, we can estimate the network overhead of a method call by inspecting the primitive types of the parameters and return values of the methods involved in the call @filippone_etal_2021.

The heuristic function $h(v_i, v_j)$ estimates the network overhead of a method call from a method $v_i$ to a method $v_j$, as described by @overhead_formula.
The value for $h(v_i, v_j)$ is calculated by summing the size of the primitive types of the parameters and return values of the method call. The heuristic does not take into account the overhead of the communication protocol (e.g. HTTP headers) or data management overhead (e.g. (de-)serialization).

$ h(v_i, v_j) = sum_(p in cal(P)(v_i)) italic("size")(p) + sum_(r in cal(R)(v_j)) italic("size")(r) $ <overhead_formula>

$cal(P)(v_i)$ returns the set of parameters of method $v_i$, and $cal(R)(v_j)$ returns the return value(s) of method $v_j$.
The $italic("size")$ function returns the size of the primitive type of the given parameter.

The individual network overhead of a microservice candidate $M_c$ can be written as the sum of the network overheads of all method calls between methods in $M_c$ and methods not in $M_c$.

$ italic("ovh")(M_c) = sum_(v_i in M_c, v_j in.not M_c) h(v_i, v_j) $ <individual_overhead_formula>

The total network overhead of a solution is the sum of the individual network overheads of all method calls between microservice candidates $M_c$ and $M_c$ in solution $S$.

$ italic("Overhead") = sum_(M_c in S) italic("ovh")(M_c) $ <total_overhead_formula>

However, this method has severe limitations in a dynamic language such as Ruby, where the types of the parameters and return values are not explicitly declared and may vary at runtime.
In some cases, the primitive types can be inferred from the method body, but in general, this is a difficult problem to solve.
