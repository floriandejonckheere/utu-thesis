#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": citeauthor

=== SDLC artifact

The identified #acr("SDLC") artifact categories used as input for the microservice candidate identification algorithm are described in @slr_artifacts.
The categories are based on #citeauthor(<bajaj_etal_2021>).

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (left, left, left),
    [*Artifact*], [*Type*], [*Publications*],
    "Requirements documents and models", // e.g., functional and non-functional requirements, use cases, BPMN
    "Static",
    [
      @amiri_2018
      @daoud_etal_2020
      @yang_etal_2022
      @saidi_etal_2023
      @li_etal_2023
    ],

    "Design documents", // e.g., API specifications, UML, ERD
    "Static",
    [
      @al_debagy_martinek_2020
      @zhou_xiong_2022
      @quattrocchi_etal_2024
      @wei_etal_2020
      @hasan_etal_2023
    ],

    "Codebase", // e.g., source code, revision history
    "Static",
    [
      @escobar_etal_2016
      @mazlami_etal_2017
      @kamimura_etal_2018
      @selmadji_etal_2020
      @carvalho_etal_2020
      @bandara_perera_2020
      @filippone_etal_2021
      @filippone_etal_2023
      @agarwal_etal_2021
      @kinoshita_kanuka_2022
      @wu_zhang_2022
      @zaragoza_etal_2022
      @santos_silva_2022
      @romani_etal_2022
      @lourenco_silva_2023
      @hao_etal_2023
      @brito_etal_2021
      @sellami_etal_2022
      @hasan_etal_2023
      @nitin_etal_2022
      @kalia_etal_2021
      @cao_zhang_2022
      @santos_paula_2021
    ],

    "Execution data", // e.g., log files, execution traces
    "Dynamic",
    [
      @carvalho_etal_2020
      @wu_zhang_2022
      @lourenco_silva_2023
      @hao_etal_2023
      @jin_etal_2021
      @zhang_etal_2020
      @ma_etal_2022
      @eyitemi_reiff_marganiec_2020
      @cao_zhang_2022
    ],
  ),
  caption: [SDLC artifact categories]
) <slr_artifacts>

==== Requirements documents and models

In software engineering, requirements documents and models are used to formally describe the requirements of a software system following the specification of the business or stakeholder requirements @software_requirements_specification.
They include functional and non-functional requirements, use cases, user stories, and business process models.
Approaches using requirements documents and models as input for the microservice candidate identification algorithm often times need to pre-process the documents to extract the relevant information, as they are not intended to be directly read by a machine. /* TODO: find reference */
In many cases, requirements documents and models for legacy systems are no longer available or outdated, which makes this approach less suitable for automated microservice identification.

//#include "02-artifacts-chart.typ"

#citeauthor(<amiri_2018>) and #citeauthor(<daoud_etal_2020>) model a software system as a set of business process using the industry standard #acr("BPMN"), using the machine-readable XML representation as input for the algorithm.
#citeauthor(<yang_etal_2022>) tackle requirements engineering using problem frames @jackson_2000.
Problem frames are a requirements engineering method, which emphasizes the integration of real-world elements into the software system @yang_etal_2022.

Some approaches use schematic requirements documents in XML format as input for the algorithm, as described by #citeauthor(<saidi_etal_2023>).
 The latter use domain-driven design techniques to extract functional dependencies from the software design as starting point in microservice identification.
#citeauthor(<li_etal_2023>) employ an intermediate format containing a precise definition of business functionality, generated from validated requirements documents.

==== Design documents

Design documents created by software architects are machine-readable representations of the software system.
They describe the software functionalities in detail and are used to guide the implementation of the software system.
Design documents include API specifications, UML diagrams (such as class diagrams and sequence diagrams), and entity-relationship diagrams.

Techniques using design documents either use a domain-driven approach, or a data-driven approach.
Domain-driven approaches use domain-specific knowledge to identify microservice candidates, while data-driven approaches use knowledge about data storage and data flow to identify microservice candidates.
Similar to requirements documents and models, design documents for legacy systems are often not available or outdated, although some design documents can be reconstructed from the software system (e.g., reverse engineering entity-relationship diagrams from the database schema).

For example, #citeauthor(<al_debagy_martinek_2020>) propose a data-driven method based on the analysis of the software system's external API, specified in the OpenAPI#footnote[#link("https://www.openapis.org/")[https://www.openapis.org/]] format.
The method extracts the information from the specification and converts it into vector representation for further processing.

#citeauthor(<zhou_xiong_2022>) use readily available design documents as well, in the form of UML class diagrams, use cases, and object sequence diagrams as starting point for the microservice identification algorithm.
The decomposition tool proposed by #citeauthor(<hasan_etal_2023>) uses design documents as well, although the specifications are inferred from the source code of the software system, and do not require pre-existing design documents.

#citeauthor(<quattrocchi_etal_2024>) takes a different approach to the problem, using a data-driven approach combined with a domain-driven approach.
Software architects describe the software system using a custom architecture description language, and the tool developed by the authors is able to identify microservice candidates.
The tool can be prompted to generate different, more efficient decompositions when given additional domain-driven requirements.
#citeauthor(<wei_etal_2020>) uses a similar approach, gathering a list of features from the software architect, and proposing a microservice decomposition based on pre-trained feature tables.

==== Codebase

A third category of #acr("SDLC") artifacts is the codebase of the software system.
This can be the source code of the software system, or a binary distribution (e.g. a JAR file).
For example, the implementation in @agarwal_etal_2021 accepts either source code or compiled binary code for analysis.

As the source code of the software system is the most detailed representation of how the software system works, it is most often used as input for the microservice candidate identification algorithm.
The source code can be analyzed using static analysis (i.e., without executing the software system), dynamic analysis (i.e., during the execution of the software system or test suite), or a combination of both.
Dynamic analysis has the advantage that it can be used if the source code is not available.

Additionally, the revision history of the source code can also be used as source for valuable information about the behaviour of the software system.
#citeauthor(<mazlami_etal_2017>) originally proposed the use of the revision history of the source code to identify couplings between classes.
/* TODO: reference "CVS release history data for detecting logical couplings" */
The authors suggest multiple strategies that can be used to extract information from the revision history.
Others have built upon this approach, using the revision history to identify the authors of the source code, and use this information to drive the identification algorithm @lourenco_silva_2023 @santos_paula_2021

#citeauthor(<escobar_etal_2016>) use the source code of the software system to construct an #acr("AST"), and map the dependencies between the business and data layer.
#citeauthor(<kamimura_etal_2018>) use a more data-driven approach, and statically trace data access calls in the source code.

Many publications @selmadji_etal_2020 @agarwal_etal_2021 @wu_zhang_2022 @zaragoza_etal_2022 @santos_silva_2022 @kalia_etal_2021 @cao_zhang_2022 @santos_paula_2021 construct a dependency graph from Java source code, and use the graph as input for a clustering algorithm.
#citeauthor(<bandara_perera_2020>) map object-oriented classes in the source code to specific microservices, but require a list of microservices to be specified before the decomposition is performed.

#citeauthor(<filippone_etal_2021>) concentrate on the API controllers as entrypoints into the software system.
A later paper by the same authors @filippone_etal_2023 builds on top of this approach by using the API endpoints as entrypoints, and then ascending into the source code by separating the presentation and logic layer.
Likewise, #citeauthor(<zaragoza_etal_2022>) make a distinction between presentation, business, and data layer.

Most of the publications tracing dependencies between classes (or modules) do this at the level of the classes (or modules).
As #citeauthor(<mazlami_etal_2017>) remark, using a more granular approach at the level of methods (or functions) and attributes has the potential to improve the quality of the decomposition.
#citeauthor(<carvalho_etal_2020>) use a more granular approach, identifying dependencies between methods in the source code.
On the other hand, #citeauthor(<kinoshita_kanuka_2022>) do not automatically extract information from the source code, but rely on a software architect to decompose the software system on the basis of business capability.

#citeauthor(<romani_etal_2022>) propose a data-centric microservice candidate identification method based on knowledge gathered from the database schema.
The authors extract table and column methods from the database schema, and use the semantically enriched information as input for the identification algorithm.
#citeauthor(<hao_etal_2023>) construct access patterns from both the database schema (static) and the database calls during execution of the software system (dynamic).

A unique approach to constructing a call graph is proposed by #citeauthor(<nitin_etal_2022>), who make a distinction between context-insensitive and context-sensitive dependency graphs.
While the former captures the dependencies between classes using simple method calls, the latter also includes the context (i.e., the arguments) of the method call in the dependency graph.

==== Execution

As the last category, information about the behaviour of the system can also be collected during the runtime of the software system.
Execution data includes log files, execution traces, and performance metrics.
This category is often combined with static analysis on source code, as the execution data can provide additional information to the identification algorithm.
In dynamic languages such as Java, dynamic analysis can trace access patterns that static analysis cannot (e.g., due to late binding and polymorphism).
Additionally, execution data can be collected when the source code of the software system is not available.

Examples of approaches using execution traces are #citeauthor(<jin_etal_2021>) and #citeauthor(<eyitemi_reiff_marganiec_2020>).
Using software probes inserted into the bytecode of respectively Java and .NET applications, the authors are able to monitor execution paths.
#citeauthor(<zhang_etal_2020>) collect the execution traces of the software system, in combination with performance logs.

#citeauthor(<ma_etal_2022>) use a data-centric approach based on the analysis of database access requests.

==== Hybrid approach

Some publications suggest a hybrid approach using both static and dynamic analysis.
For instance, #citeauthor(<wu_zhang_2022>), #citeauthor(<carvalho_etal_2020>) and #citeauthor(<cao_zhang_2022>) collect information statically from the source code (entity classes and databases), as well as dynamically from the execution of the software system (execution traces).
The approach proposed by #citeauthor(<lourenco_silva_2023>) uses either static of the source code or dynamic analysis of the system execution to gather access patterns.

#citeauthor(<hao_etal_2023>) use both static and dynamic analysis, albeit aimed at the database schema and database calls, respectively.
