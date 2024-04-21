#import "template.typ": *

#show: template.with(
  // Document title
  title: "Automated Microservice Identification in Modular Monolith Architectures",

  // Document subtitle
  subtitle: "Master of Science (Tech) Thesis",

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
  logo-file: "logo-en.svg",

  // Abstract
  abstract: [
    The modular monolith architecture has recently emerged as a harmonization of the classical monolithic and more modern microservices architectures. It offers a balanced approach to modularity, scalability, and flexibility for software design.
    As simple software systems evolve into complex and hard-to-maintain monoliths, many professionals are pivoting towards modular monoliths or full microservices architectures to meet the ever-increasing demands of modern business.

    This thesis investigates the modular monolith architecture and its benefits for monolithic applications, as well as the challenges faced during the migration process.
    It explores the concept of automated modularization, and the techniques for identification of module boundaries in software systems.
    Based on a literature review, a four-step approach to automated modularization is designed, and a case study is conducted to evaluate its effectiveness using the coupling and cohesion quality metrics.
    The results of the case study indicate that the automated approach is effective in identifying module boundaries, and can be used to modularize monolithic applications.
    Reflecting upon the results of the evaluation, a number of optimizations are suggested to improve the effectiveness of the automated approach.
    The study concludes that using automated technologies to reduce the manual effort required for modularization can significantly improve the efficiency and accuracy of the process.
    /* TODO: concrete results */
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
    AST: ("Abstract Syntax Tree"),
    BPMN: ("Business Process Model and Notation"),
    DSRM: ("Design Science Research Methodology"),
    DSRP: ("Design Science Research Process"),
    SDLC: ("Software Development Life Cycle"),
    SLOC: ("Source Lines of Code"),
    SLR: ("Systematic Literature Review"),
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
    "07-proposed-solution/01-introduction",
    "07-proposed-solution/02-design",
    "07-proposed-solution/03-requirements",
    "07-proposed-solution/04-extraction",
    "07-proposed-solution/05-decomposition",
    "07-proposed-solution/06-visualization",
    "07-proposed-solution/07-evaluation",
    "08-case-study",
    "09-conclusion",
  ),

  // Appendix
  appendix: (
    "a-literature-review",
  ),
)
