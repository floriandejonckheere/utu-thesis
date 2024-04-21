#import "@preview/acrostiche:0.3.1": *

= Background <background>

In this chapter background information and technical concepts related to the topic of the thesis are discussed.
We start with a brief introduction to monolith software architecture, and continue with service-oriented architecture and microservices.

==== Domain-driven design

#acr("DDD") is a software design approach that focuses on modeling business requirements and domain concepts in the design @evans_2015.
The goal of #acr("DDD") is to align the concepts in the software model with the concepts in the business domain, to allow better understanding and knowledge transfer between domain experts and developers.
For example, a e-commerce application may have domain concepts such as "Shopping cart" and "Order", which can be directly translated to software entities and classes.

==== Monolith architecture

In software engineering, a monolithic application describes a software system that consists of a single, indivisible unit.
Monolithic applications encompass all the components of the system, including the presentation layer, the business logic layer, and the data access layer @parikh_etal_2022.
Software components within a monolith are interdependent and tightly coupled, which makes development and maintenance more challenging as the system grows in size and complexity.
Changes and updates to the source code affect the entire system, and require redeployment of the entire application.
Monolith architectures are typically more prone to failure, as they have a single point of failure, and are less scalable than distributed systems.

// TODO: figure of monolith architecture

==== Modular programming

Modular programming is a software engineering technique that emphasizes the separation of concerns by dividing a software system into smaller, independent modules @dijkstra_1982.
Each module is responsible for a specific functionality of the system, and exposes a well-defined interface for communication with other modules.
Changes to one module do not affect other modules, which makes the system more maintainable and allows multiple teams to work on different modules simultaneously.
Modular programming does not make any assumptions about the underlying architecture of the system, and can be applied to both monolithic and distributed systems.

==== Service-oriented Architecture

#acr("SOA") is a software architectural style that focuses on service orientation @opengroup_2024.
Service orientation is a design paradigm that encourages thinking about a problem domain in terms of services and service-based development.
A service is a logical software unit that represents a business activity with a specified outcome, is self-contained, and its inner workings are opaque to the consumer of the services.
Domain knowledge and heuristics may be used to define services.

#acr("SOA") is an architectural style, and is not tied to any specific technology or implementation.
Services can be implemented as standalone applications, web services, or microservice components.
Following the principles of #acr("SOA"), services can be implemented in the same or in different programming languages, and can execute on the same or on different platforms.

==== Microservice architecture

// TODO: reference https://martinfowler.com/articles/microservices.html
// SOA vs microservices @cerny_etal_2017

==== Modularization

// service decomposition
// TODO: reference @mancoridis_etal_1998
