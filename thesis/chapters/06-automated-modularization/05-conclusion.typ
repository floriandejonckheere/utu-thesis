== Conclusion

In this chapter, we presented the state of the art in automated microservice modularization, and answered the research questions posed in the introduction.

#link(<research_question_2>)[*Research Question 2*]: What are the existing approaches for (semi-)automated microservice candidate identification in monolith codebases?

We identified 43 approaches for (semi-)automated modularization in the literature.
The majority the approaches are based on static analysis of the source code, sometimes enriched with information acquired through dynamic analysis of the application.
The other approaches use the requirements and design documents of the application to identify microservice candidates.

Clustering algorithms are a popular choice for microservice candidate identification, with more than 40% of the approaches using them.
The other big groups of algorithms are graph algorithms and evolutionary algorithms, taking up 17% of the approaches each.

The microservice candidates are evaluated using a variety of metrics, with the cohesion and coupling metrics being the clear winners in the literature.
Other metrics used by several publications are the size of the microservices, the complexity, and resource usage.
