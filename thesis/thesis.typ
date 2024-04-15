#import "template.typ": *

#show: template.with(
  // Document title
  title: "Automated Microservice Identification: an Approach to Decomposition into a Modular Monolith Architecture",

  // Document subtitle
  subtitle: "Master of Science (Tech) Thesis",

  // Institution
  institution: "University of Turku",

  // Department
  department: "Department of Computing, Software Engineering",

  // Unit
  unit: "Software Engineering",

  // Author
  author: "Florian Dejonckheere",

  // Date of publication
  date: datetime.today().display("[month repr:long] [year]"),

  // Bibliography
  bibliographies: (
    "miscellaneous",
    "literature-review/ieee",
    "literature-review/acm",
    "literature-review/snowballing",
  ),

  // Institution logo (SVG)
  logo-file: "logo-en.svg",

  // Abstract
  abstract: [
    The modular monolith architecture has recently emerged as a harmonization of monolithic and microservices architectures, offering a balanced approach to modularity, scalability, and flexibility for software design.
    As simple software systems evolve into complex and hard-to-maintain monolithic applications, many actors are pivoting towards modular monoliths or full microservices architectures to meet the ever-increasing demands of modern business.

    This thesis investigates the merits of adopting a modular monolith architecture for monolithic applications, and the challenges faced during the migration process.
    Based on the findings, an automated approach is formulated to aid the modularization process, using dependency analysis and machine learning algorithms to identify module boundaries.
    The proposed solution uses a four-step approach to monolith decomposition: extraction, decomposition, visualization, and quality assessment.
    It is then implemented for a case study, and evaluated using a set of metrics to assess the effectiveness of the proposed decomposition.
    /* TODO: change if results are different */
    The results indicate that the automated approach is effective in identifying module boundaries, and can be used to aid the modularization process of monolithic applications.
    Based on the results of the evaluation, a number of optimizations are suggested to improve the effectiveness of the automated approach.
    The study concludes that using automated technologies to reduce the manual effort required for modularization can significantly improve the efficiency and accuracy of the process.
    /* TODO: expand conclusion based on results */
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
    MOSAIK: ("Modular Optimization to Service-oriented Architecture Integration Kit"),
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
    "07-proposed-solution/02-requirements",
    "07-proposed-solution/03-extraction",
    "07-proposed-solution/04-decomposition",
    "07-proposed-solution/05-visualization",
    "07-proposed-solution/06-evaluation",
    "08-case-study",
    "09-conclusion",
  ),

  // Appendix
  appendix: (
    "a-literature-review",
    "b-examples",
  ),
)
