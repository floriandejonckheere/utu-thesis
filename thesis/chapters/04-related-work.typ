#import "/helpers.typ": *

= Related work <relatedwork>

In this chapter, we present related work on the topic of automated microservice identification in monolithic systems, with a focus on concrete implementations of these methods and tools.
A number of tools have been developed to aid the modularization of monolithic applications into microservices or modular monolith architecture.

#cite_full(<gysel_etal_2016>) developed a tool called ServiceCutter.
The tool, implemented as a web application#footnote(link("https://servicecutter.github.io/")[https://servicecutter.github.io/]), extracts information from the domain model of the application, and uses it to identify microservice candidates.
The software architect can customize the process by changing the algorithm and several parameters used for the identification.
ServiceCutter implements a visual approach to the identification of microservices, and provides a starting point for the modularization of monolithic applications.

#cite_full(<rocha_2018>) proposed a monolith decomposition tool called Monolysis, and introduces the MonoBreak algorithm used in the tool to identify microservice candidates based on the functionalities of the application.
The tool collects execution trace data from the monolith application, and uses similarity analysis to group functionalities that are likely to be part of the same microservice.
The software architect can specify the granularity of the microservices, which provides a level of customization.

In 2019, #cite_author(<saidani_etal_2019>) introduced MSExtractor, an automated tool to extract microservices from legacy applications written in the Java programming language#footnote(link("https://www.java.com/")[https://www.java.com]) @saidani_etal_2019.
Using a genetic algorithm, the authors demonstrate the ability of the tool to outperform other state-of-the-art approaches in terms of the quality of the decomposition.

Mono2Micro is an AI-based toolchain for the decomposition of monolithic applications into microservices, developed by #cite_full(<kalia_etal_2020>).
The toolchain uses a combination of static and dynamic analysis to identify microservice candidates, and uses machine learning to generate recommendations for the decomposition.
Mono2Micro has the ability to analyze monolith applications written in Java and provides a visual interface to interact with the tool.

In #cite(<service_weaver_2023>, form: "year"), #cite_author(<service_weaver_2023>) introduced ServiceWeaver @service_weaver_2023, a framework for the Go programming language#footnote(link("https://go.dev/")[https://go.dev]) that aims to introduce the concept of a modular monolith architecture.
Applications written in Go are compiled into a single, statically linked binary, which is then deployed as a single unit.
ServiceWeaver maintains the same development process as a monolithic application, but the application is deployed as a set of microservices that communicate with each other over the network.
The framework leverages the Go runtime to modularize the application at runtime, by using information about the application's structure and dependencies.
It also provides integration with cloud providers, and a set of tools to monitor and manage the deployed microservices.

The Structural Quality (S-Quality) framework, introduced by #cite_full(<hasan_etal_2023>), is a tool that uses static analysis to identify microservice candidates in monolithic applications.
The tool uses structural design properties, alongside customizable architectural quality objectives, to generate recommendations for the decomposition of the monolith application.
The S-Quality application was developed using the Django#footnote(link("https://www.djangoproject.com/")[https://www.djangoproject.com/]) framework.

#cite_full(<lopes_silva_2023>) implemented an extensible multiple strategy tool for the identification of microservice candidates in monolithic applications.
The application implements multiple strategies for identification in order to promote the comparison of modularization approaches.
The authors wrote the tool in multiple programming languages, exposing a web application interface to interact with the tool.

In summary, several tools and frameworks have already been developed to aid the modularization of monolithic applications into microservices or modular monolith architecture.
These tools use a variety of approaches, and usually only support a specific programming language or framework.
The level of automation varies between the tools, with some only providing recommendations or visualizations of the microservice candidates, and others implementing fully automated solutions that can deploy the microservices.

// TODO: Spring Modulith, Light-hybrid-4j
// TODO: several vendors with custom implementation (Shopyify, AppSmith, Gusto, PlayTech)

