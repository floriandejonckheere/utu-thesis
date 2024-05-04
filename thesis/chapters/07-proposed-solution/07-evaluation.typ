#import "/helpers.typ": *

== Evaluation

Several quality metrics were considered to evaluate the quality of the microservice decomposition.
#cite_full(<carvalho_etal_2019>) conducted an analysis of the criteria used to evaluate the quality of microservices architectures and found that the most common metrics are cohesion and coupling, as does our literature review win @automatedmodularization.
In addition to this, they conclude that in many cases the decomposition process is guided only by these two metrics.
In other cases, the software architects use other metrics (e.g. network overhead, CPU usage), although cohesion and coupling remain the dominant ones.
According to experts, using four quality metrics is a good balance between the number of metrics and the quality of the solution @carvalho_etal_2019.

#cite_full(<candela_etal_2016>) studied a large number of metrics to evaluate the quality of microservices architectures, including network overhead, CPU, and memory.
They affirmed the need for more than two metrics to ensure the quality of the decomposition.

Four metrics were selected to evaluate the quality of the microservice decomposition: cohesion, coupling, size, and complexity.
We chose cohesion and coupling as they are the most common metrics used to evaluate the quality of microservices architectures.
Size and complexity were chosen as they are important metrics to assess the maintainability and comprehensibility of the microservices @parnas_1972.

==== Cohesion

Cohesion is a measure of the degree to which internal elements of a module in a software system are related to each other @software_engineering_vocabulary_2017.
Cohesion of microservice candidates is defined as the number of static calls between methods within a microservice candidate $M_c$ in a solution $S$, divided by the total number of possible static method calls in $M_c$ @carvalho_etal_2020.
The metric indicates how strongly related the methods internal to a microservice candidate are.

To compute the individual cohesion of a microservice candidate $M_c$, we first introduce the boolean function $italic("ref")$, which indicates the existence of at least one method call between methods $v_i$ and $v_j$ in $M_c$.

$ italic("ref")(v_i, v_j) = cases(1 "if" italic("calls")(v_i, v_j) > 0, 0 "otherwise") $ <cohesion_formula>

The cohesion of a microservice candidate $M_c$ is then calculated as described in @individual_cohesion_formula, where $|M_c|$ is the cardinality of all method calls in $M_c$.

$ italic("coh")(M_c) = ( sum_(v_i in M_c, v_j in M_c) italic("ref")( v_i, v_j) ) / ( |M_c| ( |M_c| - 1) / 2 ) $ <individual_cohesion_formula>

The total cohesion of a solution is the sum of the individual cohesion of all microservice candidates $M_c$.
A higher total cohesion indicates a better decomposition.

$ italic("Cohesion") = sum_(M_c in S) italic("coh")(M_c) $ <total_cohesion_formula>

==== Coupling

Coupling is a measure of the degree of interdependence between modules in a software system @software_engineering_vocabulary_2017.
In the context of microservices, individual coupling is defined as the sum of static calls from methods within a microservice candidate $M_c$ in a solution $S$ to another microservice candidate $M_c in S$ @carvalho_etal_2020.

$ italic("coup")(M_c) = sum_(v_i in M_c, v_j in.not M_c) italic("calls")(v_i, v_j) $ <individual_coupling_formula>

Where $v_i$ and $v_j$ are methods belonging and not belonging to $M_c$ respectively, and $italic("calls")(v_i, v_j)$ returns the number of method calls present in the body of method $v_i$ made to method $v_j$.

The total coupling of a solution is the sum of the individual couplings of all microservice candidates $M_c$.
A lower total coupling indicates a better decomposition.

$ italic("Coupling") = sum_(M_c in S) italic("coup")(M_c) $ <total_coupling_formula>

==== Size

// https://wiki.c2.com/?AbcMetric
Size of a microservice candidate can be defined in several different ways.
In @automatedmodularization, we identified several publications that use the size metric as introduced by #cite_full(<wu_etal_2005>), defined size as the number of source code files or classes in a service.
Other definitions of size include the number of methods, or the number of lines of code.
However, these definitions have the disadvantage that they
  describe the size of a microservice candidate without considering the structure of the code.

#cite_full(<fitzpatrick_1997>) developed the ABC size metric, which takes into account the number of assignments, branches, and conditions in a method.
Using the number of lines of code, as well as the structure, the ABC size metric describes the size of a method more accurately.
Methods with a high ABC size are harder to understand, and more prone to errors and bugs.

The ABC size of a method consists of a vector $angle.l A, B, C angle.r$, where:
- $A$ is the number of assignments (explicit transfer of data into a variable)
- $B$ is the number of branches (explicit branch out of the current scope)
- $C$ is the number of conditions in the method (logical test)

ABC sizes are written as an ordered triplet of numbers, in the form $angle.l A, B, C angle.r$, for example $angle.l 7, 12, 3 angle.r$.
To convert the ABC size vector into a scalar value, the magnitude of the vector is calculated using the Euclidean norm.

$ |"ABC"| = sqrt(A^2 + B^2 + C^2) $ <abc_formula>

The interpretation of the ABC size value is language-dependent, as some language constructs differ semantically between programming languages.
For example, in the Ruby programming language an ABC value of $<= 17$ is considered satisfactory, a value between $18$ and $30$ unsatisfactory, and $>$~$30$ is considered dangerous#footnote[#link("https://docs.rubocop.org/rubocop/cops_metrics.html")[https://docs.rubocop.org/rubocop/cops_metrics.html]].
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
Cyclomatic complexity is a metric that quantifies the number of linearly independent control paths through the source code of a program @mccabe_1976.
The measure is computed by constructing a control-flow graph of the program, and counting the number of possible paths through the graph.
Each vertex in the graph represents a group of non-branching instructions, and each edge represents a possible transfer of control between the groups.
If the program does not contain any branching instructions, the complexity is 1 (there is only one path).

Like ABC size, cyclomatic complexity in the context of microservices can be defined as the averaged sum of the cyclomatic complexities of all methods in a microservice candidate $M_c in S$.

$ italic("complexity")(M_c) = (sum_(v_i in M_c) italic("brch")(v_i))/(|v_i|) $ <individual_complexity_formula>

Where $italic("brch")(v_i)$ returns the number of branches in method $v_i$.

The total complexity of a solution is then the sum of the individual complexities of all microservice candidates $M_c$.

$ italic("Complexity") = sum_(M_c in S) italic("complexity")(M_c) $ <total_complexity_formula>

A solution with a lower total complexity is considered to be better, as it indicates microservice candidates that are easier to understand and maintain.
