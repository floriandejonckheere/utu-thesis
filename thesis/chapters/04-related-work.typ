#import "/helpers.typ": *

= Related work <relatedwork>

In this chapter, we present related work on the topic of (semi-)automated modularization and microservice candidate identification in monolith systems, with a focus on concrete implementations of these approaches.
A number of tools have been developed to assist in the modularization of monolith applications into microservices or modular monolith architecture.

#cite_full(<gysel_etal_2016>) developed a tool called _ServiceCutter_.
The tool, implemented as a web application#footnote(link("https://servicecutter.github.io/")[https://servicecutter.github.io/]), extracts information from the domain model of the application, and uses it to identify microservice candidates.
The software architect can customize the process by changing the algorithm and several parameters used for the identification.
ServiceCutter implements a visual approach to the identification of microservices, and provides a starting point for the modularization of monolith applications.

#cite_full(<rocha_2018>) proposed a monolith decomposition tool called _Monolysis_, and introduces the _MonoBreak_ algorithm used in the tool to identify microservice candidates based on the functionalities of the application.
The tool collects execution trace data from the monolith application, and uses similarity analysis to group functionalities that are likely to be part of the same microservice.
The software architect can specify the granularity of the microservices, which provides a level of customization.

In 2019, #cite_author(<saidani_etal_2019>) introduced _MSExtractor_, an automated tool to extract microservices from legacy applications written in the Java programming language#footnote(link("https://www.java.com/")[https://www.java.com]) @saidani_etal_2019.
Using a genetic algorithm, the authors demonstrate the ability of the tool to outperform other state-of-the-art approaches in terms of the quality of the decomposition.

_Mono2Micro_ is an AI-based toolchain for the decomposition of monolith applications into microservices, developed by #cite_full(<kalia_etal_2020>).
The toolchain uses a combination of static and dynamic analysis to identify microservice candidates, and uses machine learning to generate recommendations for the decomposition.
Mono2Micro has the ability to analyze monolith applications written in Java and provides a visual interface to interact with the tool.

In #cite(<service_weaver_2023>, form: "year"), #cite_author(<service_weaver_2023>) introduced _ServiceWeaver_ @service_weaver_2023, a framework for the Go programming language#footnote(link("https://go.dev/")[https://go.dev]) that aims to introduce the concept of a modular monolith architecture.
Applications written in Go are compiled into a single, statically linked binary, which is then deployed as a single unit.
ServiceWeaver maintains the same development process as a monolith application, but the application is deployed as a set of microservices that communicate with each other over the network.
The framework leverages the Go runtime to modularize the application at runtime, by using information about the structure and dependencies of the application.
It also provides integration with cloud providers, and a set of tools to monitor and manage the deployed microservices.

_Spring Modulith_#h(.2em)#footnote(link("https://spring.io/projects/spring-modulith")[https://spring.io/projects/spring-modulith]) is another example of a framework that promotes the modular monolith approach.
The framework, written for the Java programming language, allows developers to structure the code of the application in a modular way, so that the modules can easily be broken out into microservices in the future.
_Light-hybrid-4j_#h(.2em)#footnote(link("https://networknt.github.io/light-hybrid-4j/")[https://networknt.github.io/light-hybrid-4j/]) goes a step further by allowing developers to build subsets of their applications, that can be deployed as microservices.

The _Structural Quality_ or _S-Quality_ framework, introduced by #cite_full(<hasan_etal_2023>), is a tool that uses static analysis to identify microservice candidates in monolith applications.
The tool uses structural design properties, alongside customizable architectural quality objectives, to generate recommendations for the decomposition of the monolith application.
The S-Quality application was developed using the Django#footnote(link("https://www.djangoproject.com/")[https://www.djangoproject.com/]) framework.

#cite_full(<lopes_silva_2023>) implemented an extensible multiple strategy tool for the identification of microservice candidates in monolith applications.
The application implements multiple strategies for identification in order to promote the comparison of modularization approaches.
The authors wrote the tool in multiple programming languages, exposing a web application interface to interact with the tool.

In summary, several tools and frameworks have already been developed to assist in the (semi-)automated modularization of monolith applications into microservices or modular monolith architectures.
These tools use a variety of approaches, and usually only support a specific programming language or framework.
The level of automation varies between the tools, with some only providing recommendations or visualizations of the microservice candidates, and others implementing fully automated solutions that can deploy the microservices.
