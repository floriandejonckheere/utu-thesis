#import "template.typ": *

#show: template.with(
  // Document title
  title: "Research Proposal",

  // Document subtitle
  subtitle: "Master's Thesis in Technology (DTEK1002)",

  // List of authors
  authors: ((name: "Florian Dejonckheere", email: "fwdejo@utu.fi"),),

  // Date of publication
  date: datetime.today().display("[month repr:long] [day], [year]"),

  // Bibliography
  bibliography-file: "proposal.yml",

  // Institution logo (SVG)
  logo-file: "logo-fi.svg",

  // Abstract
  abstract: [
    *Working title*: _A Framework for Writing Distributed Applications using the Modular Monolith
    Software Architecture_


    The advent of cloud computing has fundamentally changed the way software is deployed and managed. Nowadays, developers define the software architecture in function of the underlying infrastructure, and often decompose the application into a set of smaller applications based on logical boundaries in the domain logic, which are deployed independently of each other.

    This separation of concerns brings along a number of advantages such as scalability, fault isolation and independent deployment, over more traditional software development practices such as monolithic codebases. The adoption of a microservice-based architecture also introduces a number of challenges for the developers. Developers need to be aware of the distributed nature of the application, and need to take into account the additional complexity that comes with it. This affects in turn the development velocity and efficiency. The resulting software also increases in complexity, complicating maintenance and debugging.

    In this thesis, we investigate the modular monolith software architecture, a hybrid model between monolithic and microservice-based architectures that aims to combine the best of both worlds. We analyze the pattern and its advantages and disadvantages, and compare it to its architectural predecessors. We identify the challenges and opportunities that arise when adopting the modular monolith architecture for dynamic languages compared to statically-typed languages. Finally, the architecture is implemented as a proof-of-concept, and evaluated in the context of a real-world use case. We discuss the results and draw conclusions about the effectiveness of the architecture.
  ],
)

= Aims and goals

The thesis can be divided into two parts: a literary part and a more practical part. For the literary part, I first analyze the origins and characteristics of the modular monolith software architecture, and compare it to similar software architectures. Then, I investigate how the identification of module boundaries could be improved through using automated technologies. Finally, I design a solution in the form of a tool for developers that automatically identifies optimal module boundaries in a monolithic codebase.

For the practical part, I apply the proposed solution to a real-world use case, and evaluate how accurate and efficient it is, and how it impacts the development process. The use case I intend to use for the proof-of-concept is called NephroFlow Link, part of the #link(
  "https://www.nipro-group.com/en/our-offer/products-services/nephroflowtm-product-suite",
)[NephroFlow Product Suite].

NephroFlow Link is a middleware application written in Ruby that acts as a data broker between connected dialysis machines and the NephroFlow cloud platform. It is currently designed as a monolithic application, and is deployed as a single process on a single server. However, the application is becoming increasingly complex which slows down the development velocity and increases the maintenance burden on the developers. Furthermore, the requirements in regard to scalability and extensibility are increasing rapidly, which leads me to believe the application would benefit from a modular monolith architecture. I intend to develop the proposed solution using NephroFlow Link as a case study.

#pagebreak()

== Research questions

*Research Question 1*: What is the modular monolith architecture, and what sets it apart from monolithic and microservices architectures?

*Motivation*: Explore why the modular monolith architecture is becoming increasingly popular, and why it is considered a viable alternative to monolithic and microservices architectures.

*Research Question 2*: Which challenges and opportunities arise when considering adoption of the modular monolith architecture for an existing codebase?

*Motivation*: Investigate how restructuring an existing codebase as a modular monolith would impact the development process and resulting product.

*Research Question 3*: How can automated techniques effectively identify optimal module boundaries in a modular monolith architecture?

*Motivation*: Investigate technologies based on dependency analysis and semantic clustering to automatically determine optimal module boundaries in a modular monolith architecture. Compare to manual modularization efforts in terms of accuracy, efficiency, development velocity.

#pagebreak()

== Methodology

In order to evaluate the effectiveness of the modular monolith architecture, I will design and implement a proof-of-concept runtime for Ruby. The runtime will be used to implement a version of NephroFlow Link structured as a modular monolith. Based on existing performance tests, I will compare this version with the current version of NephroFlow Link, and evaluate the results. Non-functional requirements such as fault tolerance and flexibility will also be evaluated.

#pagebreak()

= Contents

+ *Abstract*
+ *Introduction*: general introduction to the topic, and identification of challenges and obstacles related to the topic. Explanation about why and for whom the topic is relevant, and what the expected outcome of the research is. Scope of the research thesis.
+ *Background*: historical background of the topic, and theoretical background needed to understand the thesis.
+ *Related work*: relevant work and research related to the topic.
  + *Monolithic architecture*: definition and explanation of monolithic architecture.
  + *Microservices architecture*: definition and explanation of monolithic architecture.
+ *Modular monolith*: definition and explanation of modular monolith architecture.
  + *Architecture*: definition and explanation of modular monolith architecture. Answer to Research Question 1.
  + *Challenges and opportunities*: answer to Research Question 2.
  + *Modularization*: problem statement regarding identification of optimal module boundaries.
+ *Proposed solution*: investigation and design of a proposed solution for identification of optimal boundary identification. Answer to Research Question 3.
+ *Case study*: application of the proposed solution to a real-world use case.
  + *Background*: background information about the use case.
  + *Analysis*: analysis and proposed solution to the problem, design and implementation choices.
  + *Methodology*: explanation of the research methodology used.
  + *Evaluation*: evaluation of the proposed solution in the context of the use case.
  + *Results*: results of the evaluation.
  + *Discussion*: analysis and discussion of the results.
+ *Conclusion*: summary of the thesis, and answers to the research questions.
+ *Future work*: possible future work related to the topic.
+ *Bibliography*

#pagebreak()