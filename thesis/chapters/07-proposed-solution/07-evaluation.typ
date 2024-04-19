#import "/helpers.typ": *

== Evaluation

Several quality metrics were considered to evaluate the quality of the microservice decomposition.
#cite_author(<carvalho_etal_2019>) conducted an analysis of the criteria used to evaluate the quality of microservice-based architectures and found that the most common metrics are cohesion and coupling, as does our literature review win @automatedmodularization.
In addition to this, they conclude that in many cases the decomposition process is guided only by these two metrics.
In other cases, the software architects use other metrics (e.g. network overhead, CPU usage), although coupling and cohesion remain the dominant ones.
According to experts, using four quality metrics is a good balance between the number of metrics and the quality of the solution @carvalho_etal_2019.

#cite_author(<candela_etal_2016>) studied a large number of metrics to evaluate the quality of microservice-based architectures, including network overhead, CPU, and memory.
They affirmed the need for more than two metrics to ensure the quality of the decomposition.

// TODO: justify choice of metrics

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

==== Size

// https://wiki.c2.com/?AbcMetric
Size of a microservice candidate can be defined in several different ways.
In @automatedmodularization, we identified several publications that use the size metric as introduced by #cite_full(<wu_etal_2005>), who define size as the number of source code files or classes in a microservice candidate.
Other definitions of size include the number of methods, or the number of lines of code.
However, these definitions have the disadvantage that they only describe the size of a microservice candidate superficially, without considering the structure of the code.

#cite_full(<fitzpatrick_1997>) developed the ABC size metric, which takes into account the number of assignments, branches, and conditions in a method.
Using not only the number of lines of code, but also the complexity of the code, the ABC size metric describes the size of a method more accurately.
Methods with a high ABC size are harder to understand, and more prone to errors and bugs.

The ABC size of a method consists of a vector $angle.l A, B, C angle.r$, where:
- $A$ is the number of assignments (explicit transfer of data into a variable)
- $B$ is the number of branches (explicit branch out of the current scope)
- $C$ is the number of conditions in the method (logical test)

ABC sizes are written as an ordered triplet of numbers, in the form $angle.l A, B, C angle.r$, for example $angle.l 7, 12, 3 angle.r$.
To convert the ABC size vector into a scalar value, the magnitude of the vector is calculated using the Euclidean norm.

$ |"ABC"| = sqrt(A^2 + B^2 + C^2) $ <abc_formula>

The ABC size of a method can vary between programming languages due to semantic differences in the language constructs.
As such, the interpretation of ABC size values is language-dependent.
For example, in Ruby an ABC value of $<= 17$ is considered satisfactory, a value between $18$ and $30$ unsatisfactory, and $> 30$ is considered dangerous#footnote[#link("https://docs.rubocop.org/rubocop/cops_metrics.html")[https://docs.rubocop.org/rubocop/cops_metrics.html]].
In this study we do not intend to evaluate the quality of individual methods, but rather the quality of the decomposition as a whole.
As such, we use the average of the ABC sizes of all methods in a microservice candidate to calculate the size of the microservice candidate.

Formalized, the ABC size metric can be defined as in @abc_size_formula.
The functions $italic("asgn")(v_i)$, $italic("brch")(v_i)$, and $italic("cond")(v_i)$ return the number of assignments, branches, and conditions in method $v_i$ respectively.

$ italic("abc")(v_i) = sqrt(italic("asgn")(v_i)^2 + italic("brch")(v_i)^2 + italic("cond")(v_i)^2) $ <abc_size_formula>

To compute the individual size of a microservice candidate $M_c$, we sum the ABC sizes of all methods in $M_c$, and divide by the number of methods in $M_c$

$ italic("size")(M_c) = (sum_(v_i in M_c) italic("abc")(v_i))/(|v_i|) $ <individual_size_formula>

The total size of a solution is the sum of the individual sizes of all microservice candidates $M_c$.

$ italic("Size") = sum_(M_c in S) italic("size")(M_c) $ <total_size_formula>

A lower total size indicates a better decomposition, as smaller microservices are easier to understand and maintain.
However, a very low size may indicate that the microservice candidates are too small, and that the decomposition is too fine-grained.

==== Complexity

// https://wiki.c2.com/?CyclomaticComplexityMetric
Cyclomatic complexity is a metric that quantifies the number of linearly independent control paths through a program's source code @mccabe_1976.
The measure is computed by constructing a control-flow graph of the program, and counting the number of possible paths through the graph.
Each node in the graph represents a group of non-branching instructions, and each edge represents a possible transfer of control between the groups.
If the program does not contain any branching instructions, the complexity is 1 (there is only one path).

Like ABC size, cyclomatic complexity in the context of microservices can be defined as the averaged sum of the cyclomatic complexities of all methods in a microservice candidate $M_c in S$.

$ italic("complexity")(M_c) = (sum_(v_i in M_c) italic("brch")(v_i))/(|v_i|) $ <individual_complexity_formula>

Where $italic("brch")(v_i)$ returns the number of branches in method $v_i$.

The total complexity of a solution is then the sum of the individual complexities of all microservice candidates $M_c$.

$ italic("Complexity") = sum_(M_c in S) italic("complexity")(M_c) $ <total_complexity_formula>

A solution with a lower total complexity is considered to be better, as it indicates microservice candidates that are easier to understand and maintain.

// TODO: Silhouette coefficient
// TODO: Usage metric: sum of inheritance factor @bandara_perera_2020

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
