#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

=== SDLC artifact

The identified #acr("SDLC") artifact categories used as input for the microservice candidate identification algorithm are described in @slr_artifacts.
The categories are adapted from a study by #cite_full(<bajaj_etal_2021>).

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
      #artifacts.at("requirements").map(p => ref(label(p))).join()
    ],

    "Design documents", // e.g., API specifications, UML, ERD
    "Static",
    [
      #artifacts.at("design").map(p => ref(label(p))).join()
    ],

    "Codebase", // e.g., source code, revision history
    "Static",
    [
      #artifacts.at("codebase").map(p => ref(label(p))).join()
    ],

    "Execution data", // e.g., log files, execution traces
    "Dynamic",
    [
      #artifacts.at("execution").map(p => ref(label(p))).join()
    ],
  ),
  caption: [SDLC artifact categories]
) <slr_artifacts>

Of the four categories, requirements documents and models, design documents, and codebase are static artifacts, while execution data is a dynamic artifact.
Hybrid approaches using both static and dynamic analysis are categorized according to the artifact used in the respective analysis.
The majority of the #total(artifacts) identified approaches use the codebase as input for the algorithm (#count(artifacts, "codebase")\; #percentage(artifacts, "codebase")), followed by execution data (#count(artifacts, "execution")\; #percentage(artifacts, "execution")).
#count(artifacts, "requirements") publications (#percentage(artifacts, "requirements")) use requirements documents an models, and #count(artifacts, "design") (#percentage(artifacts, "design")) use design documents.

#figure(
  include("/figures/06-automated-modularization/artifacts.typ"),
  caption: [SDLC artifact categories]
) <slr_artifacts_chart>

==== Requirements documents and models

In software engineering, requirements documents and models are used to formally describe the requirements of a software system following the specification of the business or stakeholder requirements @software_requirements_specification.
They include functional and non-functional requirements, use cases, user stories, and business process models.
Approaches using requirements documents and models as input for the microservice candidate identification algorithm often times need to pre-process the documents to extract the relevant information, as they are not always in a machine-readable format.
In many cases, requirements documents and models for legacy systems are no longer available or outdated @bajaj_etal_2021, which makes this approach less suitable for automated microservice candidate identification.

#cite_full(<amiri_2018>) and #cite_full(<daoud_etal_2020>) modeled a software system as a set of business processes using the industry standard #acr("BPMN"), adopting the machine-readable XML representation as input for the algorithm.
#cite_full(<yang_etal_2022>) tackled requirements engineering using problem frames.
Problem frames are a requirements engineering method, which emphasizes the integration of real-world elements into the software system @jackson_2000.

Some approaches use schematic requirements documents in XML format as input for the algorithm, as described by #cite_full(<saidi_etal_2023>).
 The authors used domain-driven design techniques to extract functional dependencies from the software design as starting point in microservice candidate identification.
#cite_full(<li_etal_2023>) employed an intermediate format containing a precise definition of business functionality, generated from validated requirements documents.

==== Design documents

Design documents created by software architects are machine-readable representations of the software system.
They describe the software functionalities in detail and are used to guide the implementation of the software system.
Design documents include #acr("API") specifications, #acr("UML") diagrams (such as class diagrams and sequence diagrams), and #acr("ERD").

Techniques using design documents either use a domain-driven approach, or a data-driven approach.
Domain-driven approaches use domain-specific knowledge to identify microservice candidates, while data-driven approaches use knowledge about data storage and data flow to identify microservice candidates.
Similar to requirements documents and models, design documents for legacy systems are often not available or outdated, although some design documents can be reconstructed from the software system (e.g., reverse engineering #acr("ERD")s from the database schema).

For example, #cite_full(<al_debagy_martinek_2020>) proposed a data-driven method based on the analysis of the external #acr("API") exposed by the application, specified in the OpenAPI#footnote[#link("https://www.openapis.org/")[https://www.openapis.org/]] format.
The method extracts the information from the specification file and converts it into a vector representation for further analysis.

#cite_full(<zhou_xiong_2022>) used readily available design documents as well, in the form of #acr("UML") class diagrams, use cases, and object sequence diagrams as starting point for the microservice candidate identification algorithm.
The decomposition tool proposed by #cite_full(<hasan_etal_2023>) used design documents as well, although the specifications are inferred from the source code of the software system, and do not require pre-existing design documents.

#cite_full(<quattrocchi_etal_2024>) took a different approach to the problem, using a data-driven approach combined with a domain-driven approach.
Software architects describe the software system using a custom architecture description language, and the tool developed by the authors is able to identify microservice candidates based on the given description.
The tool can be prompted to generate different, more efficient decompositions when given additional domain-driven requirements.
#cite_full(<wei_etal_2020>) used a similar approach, gathering a list of features from the software architect, and proposing a microservice decomposition based on pre-trained feature tables.

==== Codebase

A third category of #acr("SDLC") artifacts is the codebase of the software system.
This can be the source code of the software system, or a binary distribution (e.g. a JAR file).
For example, the implementation by #cite_full(<agarwal_etal_2021>) accepts either source code or compiled binary code for analysis.

As the source code of the software system is the most detailed representation of how the software system works, it is most often used as input for the microservice candidate identification algorithm.
The source code can be analyzed using static analysis (i.e., without executing the software system), dynamic analysis (i.e., during the execution of the software system or test suite), or a combination of both.
Dynamic analysis has the advantage that it can be used if the source code is not available.

Additionally, the revision history of the source code can also be used as source for valuable information about the behaviour of the software system.
#cite_full(<mazlami_etal_2017>) proposed the use of the revision history of the source code to identify couplings between software components, based on a prior publication by #cite_full(<gall_etal_2003>).
The authors suggested multiple strategies that can be used to extract information from the revision history.
Others have built upon this approach, using the revision history to identify the authors of the source code, and use this information to drive the identification algorithm @lourenco_silva_2023, @santos_paula_2021

#cite_full(<escobar_etal_2016>) used the source code of the software system to construct an #acr("AST"), and mapped the dependencies between the business and data layer.
#cite_full(<kamimura_etal_2018>) used a more data-driven approach, and statically traced data access calls in the source code.

Many publications @selmadji_etal_2020, @wu_zhang_2022, @zaragoza_etal_2022, @santos_silva_2022, @agarwal_etal_2021, @cao_zhang_2022, @santos_paula_2021, @kalia_etal_2021 construct a dependency graph from Java source code, and use the graph as input for a clustering algorithm.
#cite_full(<bandara_perera_2020>) mapped object-oriented classes in the source code to specific microservices, but required a list of microservices to be specified before the decomposition can be performed.

#cite_full(<filippone_etal_2021>) concentrated on #acr("API") controllers as entrypoints into the software system.
A later paper by the same authors @filippone_etal_2023 built on top of this approach by using the API endpoints as entrypoints, and then ascending into the source code by making a distinction between the presentation and logic layer.
Likewise, #cite_full(<zaragoza_etal_2022>) made a distinction between presentation, business, and data layer in their analysis.

Most of the publications tracing dependencies between software components do it at the level of the software component (classes or packages).
As #cite_full(<mazlami_etal_2017>) remarked, using a more granular approach at the level of methods (or functions) and attributes has the potential to improve the quality of the decomposition.
#cite_full(<carvalho_etal_2020>) used a more granular approach, identifying dependencies between methods in the source code.
On the other hand, #cite_full(<kinoshita_kanuka_2022>) did not automatically extract information from the source code, but relied on a software architect to decompose the software system on the basis of business capabilities.

#cite_full(<romani_etal_2022>) proposed a data-centric microservice candidate identification method based on knowledge gathered from the database schema.
The authors extracted table and column methods from the database schema, and used the semantically enriched information as input for the identification algorithm.
#cite_full(<hao_etal_2023>) constructed access patterns from both the database schema (static) and the database calls during execution of the software system (dynamic).

A unique approach to constructing a call graph was proposed by #cite_full(<nitin_etal_2022>), who made a distinction between context-insensitive and context-sensitive dependency graphs.
While the former captures the dependencies between software components using simple method calls, the latter also includes the context (i.e., the arguments) of the method call in the dependency graph.

==== Execution data

Information about the behaviour of the system can also be collected during the runtime of the software system.
Execution data includes log files, execution traces, and performance metrics.
This category is often combined with static analysis on source code, as the execution data can provide additional information to the identification algorithm.
In dynamic languages such as Java, dynamic analysis can trace access patterns that static analysis cannot (e.g., due to late binding and polymorphism).
Additionally, execution data can be collected when the source code of the software system is not available, by using software probes or monitoring tools.

Examples of approaches that used execution traces are proposed by #cite_full(<jin_etal_2021>) and #cite_full(<eyitemi_reiff_marganiec_2020>).
Using software probes inserted into the bytecode of respectively Java and .NET applications, the authors were able to monitor execution paths.
#cite_full(<zhang_etal_2020>) collected the execution traces of the software system, in combination with performance logs.

#cite_full(<ma_etal_2022>) used a data-centric approach based on the analysis of database access requests.

==== Hybrid approach

Some publications suggest a hybrid approach using both static and dynamic analysis.
For instance, #cite_full(<wu_zhang_2022>), #cite_full(<carvalho_etal_2020>), and #cite_full(<cao_zhang_2022>) collected information statically from the source code (entity classes and databases), as well as dynamically from the execution of the software system (execution traces).
The approach proposed by #cite_full(<lourenco_silva_2023>) uses either static of the source code or dynamic analysis of the system execution to gather access patterns.

#cite_full(<hao_etal_2023>) used both static and dynamic analysis, albeit aimed at the database schema and database calls, respectively.
