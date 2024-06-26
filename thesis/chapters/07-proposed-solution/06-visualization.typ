#import "@preview/acrostiche:0.3.1": *

== Visualization

MOSAIK can generate visualizations of the steps in the microservice decomposition process.
The information extraction step outputs a dependency graph, where the vertices represent the classes of the monolith application, and the edges represent the dependencies between the classes.

#figure(
  image("/figures/07-proposed-solution/extraction.svg", width: 60%),
  caption: [Visualization of information extraction step],
) <information_extraction_graph>

As each coupling strategy can create one or more edges, the graph can contain significant visual cluttering and can be difficult to interpret.
The graph visualization implementation accepts several parameters to control the layout and appearance of the graph, such as aggregating the edges between two vertices, filtering out edges with a low weight, and hiding vertices with no outgoing or incoming edges.
The application offers multiple renderers to visualize the graph, using different layout algorithms and styles.

@information_extraction_graph illustrates the visualization of the information extraction step applied to the source code of MOSAIK.

The decomposition step does not modify the graph structure, but adds subgraphs to the visualization to indicate the microservice candidates.
@decomposition_graph illustrates the visualization of the decomposition step.

#figure(
  image("/figures/07-proposed-solution/decomposition.svg", width: 60%),
  caption: [Visualization of decomposition step],
) <decomposition_graph>

The graphs are rendered using the open-source Graphviz software#footnote[#link("https://graphviz.org/")[https://graphviz.org/]], which provides a set of tools for generating and manipulating graph visualizations using the DOT language#footnote[#link("https://graphviz.org/doc/info/lang.html")[https://graphviz.org/doc/info/lang.html]].
