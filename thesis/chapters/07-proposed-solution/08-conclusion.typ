== Conclusion

In this chapter, we proposed our solution for automated identification of microservice candidates within the context of monolith applications.
We answered the following research question:

#link(<research_question_3>)[*Research Question 3*]: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?

We proposed a solution that uses a combination of static analysis techniques to identify microservice candidates within monolith applications.
Our solution uses structural information (e.g. class structure and dependencies) and evolutionary information (e.g. code changes) extracted from the codebase of the application to identify microservice candidates.
We use the Louvain community detection algorithm to identify clusters of classes that are likely to be good candidates for microservices.
The Louvain algorithm is computationally efficient and easy to implement, making it a good choice for identifying microservice candidates in large codebases.

Finally, we primarily use the cohesion and coupling metrics to evaluate the quality of the identified microservice candidates.
Secondarily, we use the size and complexity metrics to further evaluate the microservice candidate decomposition.
