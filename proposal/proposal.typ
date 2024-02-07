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
    *Working title*: _Identification of Module Boundaries in a Modular Monolith Architecture using Automated Techniques_

    The modular monolith architecture emerged in recent years as the harmonization of the monolithic and microservices architectures. The paradigm offers a compromise between modularity, flexibility, and scalability. Many monolithic applications are being migrated to modular monoliths or microservices entirely, to satisfy increasingly complex and volatile business requirements. This process is labour-intensive, slow, and may take months to years for larger codebases. Modularization of a codebase typically requires the developer to have an intimate knowledge of both the application code and domain.

    In this thesis, we investigate the modular monolith software architecture, and how modules are typically determined as part of the modularization efforts. We propose an automated solution based on dependency analysis and machine learning algorithms to aid in the identification of module boundaries, and evaluate its effectiveness using a case study. We discuss the results and draw conclusions about the propsed solution.
  ],
)

= Aims and goals

The thesis can be divided into two parts: a literary part and a more practical part. For the literary part, I first analyze the origins and characteristics of the modular monolith software architecture, and compare it to similar software architectures. Then, I investigate how the identification of module boundaries is typically done, and how it could be improved through using automated technologies.

For the practical part, I design a solution in the form of a tool for developers that automatically identifies optimal module boundaries in a monolithic codebase. Then, I apply the proposed solution to a real-world use case, and evaluate how effective it is.

The use case I intend to use for the proof-of-concept is called NephroFlow Link, part of the #link(
  "https://www.nipro-group.com/en/our-offer/products-services/nephroflowtm-product-suite",
)[NephroFlow Product Suite]. NephroFlow Link is a middleware application written in Ruby that acts as a data broker between connected dialysis machines and the NephroFlow cloud platform. It is currently designed as a monolithic application, and is deployed as a single process on a single server. However, the application is becoming increasingly complex which slows down the development velocity and increases the maintenance burden on the developers. Furthermore, the requirements in regard to scalability and extensibility are increasing rapidly, which leads me to believe the application would benefit from a modular monolith architecture. I intend to develop the proposed solution using NephroFlow Link as a case study.

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

Based on the principles of the modular monolith architecture, module boundaries are manually identified within the application. This is done by experienced developers that have an intimate knowledge of both the codebase and the application domain.
Next, using the proposed solution, module boundaries are automatically identified within the application.

To evaluate the effectiveness of the proposed solution, key criteria are identified:

+ *Accuracy*: how close do the module boundaries of the automated techniques align with the manually identified ones? The degree of alignment is measured using metrics such as Jaccard similarity.
+ *Modularity*: how modular are the boundaries identified by the automated techniques? The degree of modularity is measured using metrics such as the modularity $Q$, the clustering coefficient, and the Fenton and Melton metric.
+ *Efficiency*: how much effort is required to implement the automatically identified module boundaries compared to manual modularization? Feedback from experienced developers is gathered using surveys and interviews.
+ *Adaptibility*: how well do the modules react to changes in the codebase and evolving requirements? The impact is measured empirically by introducing changes in the environment or requirements, and observing how well the boundaries adapt to the change using metrics such as code churn and defect density.

By measuring these key criteria quantitatively and qualitatively for the module boundaries of the automated and the manual modularization, I can assess the effectiveness of the automated techniques in a thorough and objective manner.

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