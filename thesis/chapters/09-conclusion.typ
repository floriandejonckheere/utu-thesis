#import "@preview/acrostiche:0.3.1": *

= Conclusion <conclusion>

This thesis discussed the problem of (semi-)automated modularization of monolith applications, with a focus on the automated identification of microservice candidates.
In the first part of the thesis, we investigated the modular monolith architecture, and discussed the advantages and drawbacks of the software architecture.
Then, we presented a comprehensive overview of the state of the art on (semi-)automated technologies for modularization of monolith applications.
We identified and described the most frequently used approaches in the literature, and compared them against each other.

In the third part, we presented our solution for the automated identification of microservice candidates in monolith codebases, based on the findings of our systematic literature review.
We comprehensively described the architecture of our tool, and discussed the technical implementation details.

Finally, we evaluated the effectiveness of our solution using a case study on a real-world monolith application.
We concluded that our solution is able to meet the requirements we set for it, and that it generates a decomposition of suitable quality.
The tool is flexible in use, and can be easily extended to support other programming languages, and clustering algorithms.

#pagebreak()

== Future considerations

The research field of (semi-)automated modularization of monolith applications is still developing, and there are many opportunities for improvements.
In recent years, there has been a pickup in the number of publications on this topic, and we expect to see more research papers published in the near future.

There are several areas where we see potential for improvement in our proposed solution.
As many experts have already pointed out, the information extracted from the codebase can be improved by using additional techniques.
For example, the structural coupling can be improved by dynamically collecting information during the runtime of the application, as static analysis is very limited in highly dynamic languages such as Ruby and Python.
Furthermore, enhancing the extracted information with additional object-oriented relationships (e.g. inheritance and composition) can improve the accuracy of the microservice candidate identification algorithm.
Alternatively, supplementary heuristics, such as semantic coupling, can be utilized as well.

A case can be made for considering alternative microservice candidate identification algorithms as well, such as clustering algorithms that work top-down instead of the bottom-up approach we opted for in our solution.

Finally, the MOSAIK tool can be improved technically.
For instance, rewriting critical parts of the identification algorithm in another, more performant language could yield large gains in runtime performance.
Moreover, the tool can be extended to support more programming languages, as the current implementation only supports Ruby.
