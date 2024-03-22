#import "/cite.typ": citeauthor

= Proposed solution <proposedsolution>

In this chapter, we analyze and design our solution for identification of microservice candidates.
We start by identifying the functional and non-functional requirements for the solution.

Then, we propose a microservice decomposition approach using the three-step process by #citeauthor(<abdellatif_etal_2021>).

- *Collect*: the necessary data is collected from the application and its environment.
- *Decomposition*: using the collected data, a decomposition of the application into microservices is proposed.
- *Analysis*: the proposed decomposition is analyzed to evaluate the effectiveness of the chosen approach.

== Requirements

// Functional: visualization, user-imposed priorities, gradual migration, technology
// Non-functional: usability, performance, maintainability, license

== Collection

// Static analysis of code base (because no requirements or design documents)
// Dynamic analysis, because inherent polymorphism and late binding -> through execution and also integration tests
// Version history (because strong culture of code ownership), but only from specific commits (because Link v5 refactor)

== Decomposition

// Decide on granularity: coarse-grained (class-level) or fine-grained (method-level) and motivate choice

// Decide on top-down or bottom-up approach and motivate choice
// Top-down: start with one big package, then progressively split up into smaller packages
// Bottom-up: start with small packages (every class is a package), then progressively merge into bigger packages

// Application is not stateful (or negligible), so no database dependencies

== Analysis
