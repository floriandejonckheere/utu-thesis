#import "@preview/acrostiche:0.3.1": *

= Conclusion <conclusion>

This thesis discussed the problem of automated modularization of monolith applications, with a focus on the identification of microservice candidates.
In the first part of the thesis, we investigated the modular monolith architecture, and discussed the merits and demerits of the software architecture.
Then, we presented a comprehensive overview of the state of the art on (semi-)automated technologies for modularization of monolith applications.
We identified and described the most frequenty used approaches in the literature, and set out to compare them against each other.

In the third part, we presented our solution for the automated identification of microservice candidates in monolith codebases, based on the findings of our systematic literature review.
We comprehensively described the architecture of our tool, and discussed the implementation details.

Finally, we evaluated the effectiveness of our solution using a case study on a real-world monolith application.
We conclude that our solution is able to identify microservice candidates with an acceptable level of quality, and that it can be used as a basis for further research in this area.

#pagebreak()

== Future considerations

The research field of automated modularization of monolith applications is still developing, and there are many opportunities for future improvements.
In recent years, there has been a pickup in the number of publications on this topic, and we expect to see more research papers published in the near future.

On the side of our solution, there are several areas where we see potential for improvement.
As many experts have already pointed out, the information extracted from the codebase can be improved by using additional techniques.
For example, the structural coupling can be improved by dynamically collecting information during the runtime of the application, as static analysis is very limited in dynamic languages like Ruby and Python.
Furthermore, enhancing the extracted information with additional object-oriented relationships, such as inheritance and composition, can improve the accuracy of the microservice identification algorithm.
Alternatively, supplementary heuristics, such as semantic coupling, can be utilized as well.

Finally, the MOSAIK tool can be improved technically.
For instance, rewriting critical parts of the identification algorithm in another, more performant language would yield large gains in runtime performance.
Moreover, the tool can be extended to support more programming languages, as the current implementation only supports Ruby.
