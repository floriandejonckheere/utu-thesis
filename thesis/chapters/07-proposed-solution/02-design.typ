#import "/helpers/cite.typ": *

== Design

We start by identifying the functional and non-functional requirements for the solution.
Then, we propose a four-step approach to decomposition adapted from the microservice identification pipeline by #citeauthor(<lopes_silva_2023>).

- *Extraction*: the necessary information is extracted from the application and its environment.
- *Decomposition*: using the collected data, a decomposition of the application into microservices is proposed.
- *Visualization*: the proposed decomposition is visualized to facilitate the understanding of the architecture.
- *Evaluation*: the proposed decomposition is evaluated according to a set of quality metrics.

An overview of the architecture of the proposed solution is shown in @architecture.
The extraction step is comprised of two smaller steps: static analysis and evolutionary analysis.
From the extracted information, a dependency graph is visualized.
The decomposition step is based on the graph partitioning algorithm, which is used to identify the microservice candidates.
Finally, the proposed decomposition is evaluated using a set of quality metrics.

#figure(
  include("/figures/architecture.typ"),
  caption: [Architectural overview of the proposed solution]
) <architecture>

#v(2em)

The next sections detail each of these steps, providing a comprehensive overview of the proposed solution.
The process we describe is generic and not tied to any specific programming language or paradigm.
We implemented a prototype of the proposed solution in Ruby, as the monolithic application we use for evaluation is written in Ruby.
The implementation is available online#footnote[#link("https://github.com/floriandejonckheere/mosaik")[https://github.com/floriandejonckheere/mosaik]].
// TODO: something about type checking
