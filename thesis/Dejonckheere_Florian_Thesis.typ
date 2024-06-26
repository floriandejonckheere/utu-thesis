#import "template.typ": *

#show: template.with(
  // Document title
  title: "Automated Microservice Identification in Modular Monolith Architectures",

  // Document subtitle
  subtitle: "Master of Science (Tech.) Thesis",

  // Institution
  institution: "University of Turku",

  // Department
  department: "Department of Computing",

  // Unit
  unit: "Software Engineering",

  // Author
  author: "Florian Dejonckheere",

  // Date of publication
  date: datetime.today().display("[month repr:long] [year]"),

  // Bibliography
  bibliographies: (
    "01-introduction",
    "02-methodology",
    "03-background",
    "04-related-work",
    "05-modular-monolith",
    "06-automated-modularization",
    "07-proposed-solution",
    "08-case-study",
    "09-conclusion",
  ),

  // Institution logo (SVG)
  logo-file: "logo-fi.svg",

  // Abstract
  abstract: [
    // Background
    The modular monolith software architecture has recently emerged as a hybrid solution, combining the simplicity and development velocity of the traditional monolith, with the scalability and flexibility of the microservices architecture.
    As simple software systems evolve into complex and tightly coupled monoliths, organizations are pivoting towards modular monoliths or full microservices architectures to address the challenges of web-scale software development.

    // Objective
    This thesis investigates the benefits and drawbacks of the modular monolith architecture, and the challenges faced when migrating monolith applications to a modular software architecture.
    It explores the concept of (semi-)automated modularization of software systems, and proposes an approach to automated microservice candidate identification in modular monolith architectures.

    // Method
    Based on a literature review, a four-step approach is designed, and a case study is conducted to evaluate its effectiveness using the cohesion and coupling quality metrics.
    The results indicate that the approach is effective in identifying microservice candidates, and can be used to assist in automating modularization of monolithic applications.
    // Results
    Reflecting upon the results of the evaluation, a number of optimizations are suggested to improve the effectiveness of the approach.
    The study concludes that using automated technologies to reduce the manual effort required for modularization can significantly improve the efficiency and accuracy of the process.
  ],

  // Keywords
  keywords: (
    "software architecture",
    "monolith",
    "microservices",
    "modular monolith",
    "modularization",
  ),

  // Acronyms
  acronyms: (
    API: ("Application Programming Interface"),
    AST: ("Abstract Syntax Tree"),
    BPMN: ("Business Process Model and Notation"),
    DDD: ("Domain-Driven Design"),
    DSRM: ("Design Science Research Methodology"),
    DSRP: ("Design Science Research Process"),
    ERD: ("Entity-Relationship Diagram"),
    SDLC: ("Software Development Life Cycle"),
    SLOC: ("Source Lines of Code"),
    SLR: ("Systematic Literature Review"),
    SRP: ("Single Responsibility Principle"),
    SOA: ("Service-Oriented Architecture"),
    UML: ("Unified Modeling Language"),
  ),

  // Chapters
  chapters: (
    "01-introduction",
    "02-methodology",
    "03-background",
    "04-related-work",
    "05-modular-monolith",
    "06-automated-modularization/01-introduction",
    "06-automated-modularization/02-artifacts",
    "06-automated-modularization/03-algorithms",
    "06-automated-modularization/04-metrics",
    "06-automated-modularization/05-conclusion",
    "07-proposed-solution/01-introduction",
    "07-proposed-solution/02-design",
    "07-proposed-solution/03-requirements",
    "07-proposed-solution/04-extraction",
    "07-proposed-solution/05-decomposition",
    "07-proposed-solution/06-visualization",
    "07-proposed-solution/07-evaluation",
    "07-proposed-solution/08-conclusion",
    "08-case-study",
    "09-conclusion",
  ),

  // Appendix
  appendix: (
    "a-literature-review",
  ),
)
