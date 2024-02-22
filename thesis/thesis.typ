#import "template.typ": *

#show: template.with(
  // Document title
  title: "Identification of Module Boundaries in a Modular Monolith Architecture using Automated technologies",

  // Document subtitle
  subtitle: "Master of Science (Tech) Thesis",

  // Institution
  institution: "University of Turku",

  // Department
  department: "Department of Computing",

  // Author
  author: "Florian Dejonckheere",

  // Date of publication
  date: datetime.today().display("[month repr:long] [year]"),

  // Bibliography
  bibliography-file: "thesis.yml",

  // Institution logo (SVG)
  logo-file: "logo-fi.svg",

  // Abstract
  abstract: [
    The modular monolith architecture emerged in recent years as the harmonization of the monolithic and microservices architectures. The paradigm offers a compromise between modularity, flexibility, and scalability. Many monolithic applications are being migrated to modular monoliths or microservices entirely, to satisfy increasingly complex and volatile business requirements. This process is labour-intensive, slow, and may take months to years for larger codebases. Modularization of a codebase typically requires the developer to have an intimate knowledge of both the application code and domain.

    In this thesis, we investigate the modular monolith software architecture, and how modules are typically determined as part of the modularization efforts. We propose an automated solution based on dependency analysis and machine learning algorithms to aid in the identification of module boundaries, and evaluate its effectiveness using a case study. We discuss the results and draw conclusions about the propsed solution.
  ],

  // Keywords
  keywords: (
    "software architecture",
    "monolith",
    "microservices",
    "modular monolith",
  ),

  // Acronyms
  acronyms: (
    API: "Application Programming Interface",
    UI: "User Interface",
  )
)

#include "chapters/01-introduction.typ"
#include "chapters/02-background.typ"
#include "chapters/03-related-work.typ"