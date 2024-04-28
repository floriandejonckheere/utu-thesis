#import "@preview/acrostiche:0.3.1": *

#import "/helpers.typ": *

#let stats = (
  sloc: 9288, // cloc . --exclude-dir spec
  files: 204, // find . -iname '*.rb' -not -path './spec/*' | wc -l
  classes: 207, // grep -hro 'class [A-Z][A-Za-z0-9]*' lib | wc -l
  methods: 840, // grep -hro 'def [a-z][A-Za-z0-9]*' lib | wc -l
  commits: 277, // git rev-list v5.0.0...45b0f99 --count --grep dependabot --invert-grep
  contributors: ( // git shortlog -sn v5.0.0...45b0f99 --grep dependabot --invert-grep
    A: 139,
    B: 83,
    C: 15,
    D: 14,
    E: 8,
    F: 7,
    G: 6,
    H: 5,
    I: 1,
    J: 1,
  )
)

= Case study <casestudy>

In this chapter, we present a case study to evaluate the proposed solution in the context of a real-word use case.
We aim to answer the following research question:

*Research Question 3*: How can static analysis of source code identify module boundaries in a modular monolith architecture that maximize internal cohesion and minimize external coupling?

We start by presenting the background information about the use case, followed by a description of the experimental setup.
Next, we utilize MOSAIK on the use case application, evaluate the effectiveness, and present the results.
Finally, we discuss the results and analyze the implications of the proposed solution in a broader context.

== Background

The case study is based on an application written called NephroFlow™ Link.
The application is developed by Nipro Digital Technologies Europe NV#footnote[#link("https://niprodigital.com")[https://niprodigital.com]], a subsidiary of Nipro Europe Group Companies#footnote[#link("https://www.nipro-group.com")[https://www.nipro-group.com]].
Nipro Group is a leading global manufacturer of medical devices, specialized in renal care products.
NephroFlow™ Link, part of the NephroFlow™ Product Suite#footnote[#link("https://www.nipro-group.com/en/our-offer/products-services/NephroFlow™tm-product-suite")[https://www.nipro-group.com/en/our-offer/products-services/NephroFlow™tm-product-suite]], is a monolith application that allows the NephroFlow™ Healthcare Platform to communicate with the dialysis machines installed at dialysis centers, and vice versa.
NephroFlow™ Link is responsible for collecting data from the dialysis machines, processing it, and sending it to the NephroFlow™ Platform for storage and visualization.

#figure(
  include("/figures/08-case-study/link.typ"),
  caption: [NephroFlow™ Link architecture]
) <link_architecture>

Dialysis machines typically measure data essential for the dialysis treatment, such as vital signs, blood flow rate, and dialyzer efficiency.
Nurses and practitioners use this information to evaluate the condition of the patient, and the effectiveness of the treatment.

Nipro Group has deployed NephroFlow™ Link in several dialysis centers and hospitals across Europe, Central America, and India, collectively ensuring connection to hundreds of dialysis machines.
To ensure the information security of the patient, the application is usually deployed per dialysis center, and the data is stored in a secure cloud environment.

The application is written in the Ruby programming language#footnote[#link("https://www.ruby-lang.org")[https://www.ruby-lang.org]] as a single-threaded process, deployed as a single unit.
The choice of Ruby as programming language is influenced by the Ruby on Rails framework#footnote[#link("https://rubyonrails.org")[https://rubyonrails.org]], which is used for the NephroFlow™ Platform.
In theory, it is not a stateful application, as it only stores transitional data (e.g. for rate-limiting purposes) using the Redis key-value datastore#footnote[#link("https://www.redis.com")[https://www.redis.com]].
The source code of the application is hosted in a private Github repository#footnote[#link("https://github.com")[https://github.com]], and is not publicly available.

The codebase of the application is rapidly becoming increasingly complex, which decreases the development velocity of new features and device integrations.
When it is deployed at bigger sites with up to 400 dialysis machines, the throughput and latency suffer and performance issues arise.
For these reasons, the application would benefit from a software architectural overhaul.
While microservices-based architecture would allow the application to scale efficiently, it also introduces a maintenance overhead for the software developers.
Since the number of developers working on NephroFlow™ Link is limited, the extra burden on the software developers should be low.
Hence, decomposing this application into a modular monolith architecture would prove beneficial.

// TODO: explain how security and patient safety are improved by the modular monolith architecture

== Experimental setup

#cite_full(<lourenco_silva_2023>) analyzed multiple source code repositories and concluded that repositories with a large number of committers perform better when considering the contributor coupling in various scenarios.
Approaches using contributor coupling achieve comparable results as approaching using a structural coupling on source code repositories with a large number of committers.
Since the number of committers to NephroFlow™ Link is limited, we use multiple coupling strategies to decompose the application.
Four test scenarios were designed by combining configurations obtained through varying the weights of the coupling strategy @santos_paula_2021.
The weights $omega_s$, $omega_c$, and $omega_d$ refer to the structural, logical, and contributor coupling respectively.
Refer to @test_configurations for a list of the test configurations.
Strategies using a single coupling are not considered, as they extract limited information by themselves, and are not expected to perform well in the context of NephroFlow™ Link.

#let scenarios = (
  "scn_structural_logical": (1, 1, 0, [_structural-logical_]),
  "scn_structural_contributor": (1, 0, 1, [_structural-contributor_]),
  "scn_logical_contributor": (0, 1, 1, [_logical-contributor_]),
  "scn_structural_logical_contributor": (1, 1, 1, [_structural-logical-contributor_]),
)

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    inset: 10pt,
    stroke: (x: none),
    align: (right, center, center, center, left),
    // TODO: row span first three columns: Weights
    [*ID*], [$omega_s$], [$omega_c$], [$omega_d$], [*Scenario*],
    ..for (key, scenario) in scenarios.pairs() {
      (
        [*#ref(label(key), supplement: none)*],
        [#scenario.at(0)],
        [#scenario.at(1)],
        [#scenario.at(2)],
        scn_reference([*#scenario.at(3)*], key),
      )
    },
  ),
  caption: [Test configurations]
) <test_configurations>

// Structural
The source code repository of NephroFlow™ Link is hosted in a private Github#footnote[#link("https://github.com")[https://www.github.com]] organization.
The application contains #stats.at("files") Ruby source code files, with a total of #stats.at("sloc") #acr("SLOC"), as measured by the `cloc` tool#footnote[#link("https://github.com/AlDanial/cloc")[https://github.com/AlDanial/cloc]].
Only the application code is considered, excluding the test code and configuration files.

// Evolutionary
The repository contains a `main` branch with the latest code, and several branches for released and maintained versions.
For the purpose of this study, we only consider the `main` branch, from the release of NephroFlow™ Link version 5.0 on October 27, 2023 up until the pre-release of NephroFlow™ Link version 5.2 on April 25, 2024, which is the most recent commit in the repository at the time of writing.
The static analysis is performed on the source code as it appears in the most recent commit.
The commits from the `dependabot` contributor are omitted, as they are automatically generated by Github to update the dependencies of the application#footnote[#link("https://github.com/features/security")[https://github.com/features/security]].


#grid(
  columns: (60%, 40%),
  gutter: 1em,
  [
    We identified #stats.at("contributors").len() software developers that have contributed to the software in the analyzed timespan, although only five developers have more than ten commits attributed to them.
    The top two contributors are responsible for #(calc.round(100 * (stats.at("contributors").at("A") + stats.at("contributors").at("B")) / stats.at("commits"), digits: 0))% of the commits, while the other eight contributors account for the remaining #(calc.round(100 - (100 * (stats.at("contributors").at("A") + stats.at("contributors").at("B")) / stats.at("commits")), digits: 0))% of the commits.
  ],
  [
    #figure(
      include("/figures/08-case-study/contributors.typ"),
      caption: [Contributors],
    ) <contributor_statistics>
  ],
)

An overview of the source code repository is presented in @source_code_statistics.

#figure(
  table(
    columns: 5,
    inset: 10pt,
    stroke: (x: none),
    [*#acr("SLOC")*], [*Classes*], [*Methods*], [*Commits*], [*Contributors*],
    [#stats.at("sloc")],
    [#stats.at("classes")],
    [#stats.at("methods")],
    [#stats.at("commits")],
    [#stats.at("contributors").len()],
  ),
  caption: [Source code statistics]
) <source_code_statistics>

#pagebreak()

== Evaluation and results

In this section, we present the results of the decomposition of NephroFlow™ Link using MOSAIK.
The results are based on the four test scenarios described in the previous section.

@coupling_statistics, @cohesion_statistics, @abc_size_statistics, and @complexity_statistics display the coupling, cohesion, ABC size, and complexity metrics, respectively, for each scenario using a box plot.
The plots indicate the distribution of the metrics for each scenario, calculated from the individual metrics of each service in the decomposition.

#import "/figures/08-case-study/statistics.typ": *
#grid(
  columns: (50%, 50%),
  [
    #figure(
      statistics_chart("coupling", 50),
      caption: [Coupling]
    ) <coupling_statistics>
  ],
  [
    #figure(
      statistics_chart("cohesion", 0.05),
      caption: [Cohesion]
    ) <cohesion_statistics>
  ],
)

The coupling metric measures how loosely coupled the services are to each other, with a lower value indicating a better modularization.
@scn_logical_contributor and @scn_structural_logical_contributor have a similar mean coupling value at 227 and 222.5 respectively, with few outliers.
@scn_structural_logical has a much lower mean coupling value at 72, indicating that the services are more loosely coupled, and the decomposition is more modular.
On the other hand, @scn_structural_contributor has a mean coupling value of zero, which means that the services are not coupled at all.
This can happen when the decomposition is too fine-grained, and the services are too small to be useful.
Looking at the size of the services in @structural_contributor_service_size, we see that the services are indeed very small, with the exception of one service that is significantly larger than the others.

The cohesion metric measures how well the services are internally cohesive and group related functionality together.
A higher value indicates a better modularization.
All scenarios have a similar mean cohesion value, ranging from 0.04 to 0.07 for scenario @scn_structural_contributor.
The latter is likely caused by the significantly larger service, which raises the mean cohesion value.

#grid(
  columns: (50%, 50%),
  [
    #figure(
      statistics_chart("abc_size", 50),
      caption: [ABC size]
    ) <abc_size_statistics>
  ],
  [
    #figure(
      statistics_chart("complexity", 50),
      caption: [Complexity]
    ) <complexity_statistics>
  ],
)

ABC size measures the size of a service given the assignments, branches, and conditions in the code.
A lower value indicates a smaller service, which is generally preferred.
In @abc_size_statistics, we see that the extrema of the ABC size metric are quite high for all scenarios, indicating that some services are significantly larger than others.
As the number of services in the decomposition of @scn_logical_contributor is quite small, it has the least variation in the ABC size metric, with a mean value of 153.
The other scenarios have mean ABC size values ranging from 24 to 67, indicating that the services in these decompositions are on average smaller in size, but with more variation.

@complexity_statistics shows the cyclomatic complexity of the services in the decomposition.
A lower value indicates a simpler service, which is generally preferred.
The statistical values for the complexity metric are similar to the ABC size metric, with the mean complexity values ranging from 21 to 59, with @scn_logical_contributor being an outlier with a mean complexity value of 135.
ABC size and complexity are closely related, as they both measure the perceived complexity of the code, but they do so in different ways.

#grid(
  columns: (50%, 50%),
  gutter: 1em,
  [
     @mean_metrics lists the mean values of the metrics for each scenario.
    The mean value of each metric indicates the average value of the metric for all services in the decomposition, and can be used as a reference to compare the scenarios.
  ],
  [
    #figure(
      table(
        columns: (auto, auto, auto, auto, auto),
        inset: 10pt,
        stroke: (x: none),
        align: (right, left),
        [*ID*], [*Coup*], [*Coh*], [*Size*], [*Cplx*],
        [#ref(<scn_structural_logical>, supplement: none)],
          [#calc.round(yaml("/data/structural_logical.yml").at("coupling").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/structural_logical.yml").at("cohesion").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/structural_logical.yml").at("abc_size").at("mean"), digits: 0)],
          [#calc.round(yaml("/data/structural_logical.yml").at("complexity").at("mean"), digits: 0)],
        [#ref(<scn_structural_contributor>, supplement: none)],
          [#calc.round(yaml("/data/structural_contributor.yml").at("coupling").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/structural_contributor.yml").at("cohesion").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/structural_contributor.yml").at("abc_size").at("mean"), digits: 0)],
          [#calc.round(yaml("/data/structural_contributor.yml").at("complexity").at("mean"), digits: 0)],
        [#ref(<scn_logical_contributor>, supplement: none)],
          [#calc.round(yaml("/data/logical_contributor.yml").at("coupling").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/logical_contributor.yml").at("cohesion").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/logical_contributor.yml").at("abc_size").at("mean"), digits: 0)],
          [#calc.round(yaml("/data/logical_contributor.yml").at("complexity").at("mean"), digits: 0)],
        [#ref(<scn_structural_logical_contributor>, supplement: none)],
          [#calc.round(yaml("/data/structural_logical_contributor.yml").at("coupling").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/structural_logical_contributor.yml").at("cohesion").at("mean"), digits: 2)],
          [#calc.round(yaml("/data/structural_logical_contributor.yml").at("abc_size").at("mean"), digits: 0)],
          [#calc.round(yaml("/data/structural_logical_contributor.yml").at("complexity").at("mean"), digits: 0)],
      ),
      caption: [Mean of metric per scenario]
    ) <mean_metrics>
  ]
)

#v(2em)

#import "/figures/08-case-study/service-size.typ": *
#grid(
  columns: (50%, 50%),
  gutter: 1em,
  [
    #figure(
      service_size_chart("structural_logical"),
      caption: [Service size distribution of @scn_structural_logical]
    ) <structural_logical_service_size>
  ],
  [
    #figure(
      service_size_chart("structural_contributor"),
      caption: [Service size distribution of @scn_structural_contributor]
    ) <structural_contributor_service_size>
  ]
)

@scn_structural_logical and @scn_structural_contributor each have 18 services, with a mean size of 6.1 and 4.4 classes per service respectively.
@scn_structural_logical_contributor has slightly fewer at 14 services, with a larger mean size of 9.2 classes per service.
These decompositions consists of several larger services, and a fair amount of smaller services that contain only a few classes.

#grid(
  columns: (50%, 50%),
  gutter: 1em,
  [
    #figure(
      service_size_chart("logical_contributor"),
      caption: [Service size distribution of @scn_logical_contributor]
    ) <logical_contributor_service_size>
  ],
  [
    #figure(
      service_size_chart("structural_logical_contributor"),
      caption: [Service size distribution of @scn_structural_logical_contributor]
    ) <structural_logical_contributor_service_size>
  ],
)

#v(2em)

#grid(
  columns: (30%, 70%),
  gutter: 1em,
  [
    #figure(
      table(
        columns: (auto, auto, auto),
        inset: 10pt,
        stroke: (x: none),
        align: (right, left, left),
        [*ID*], [$bold(\#M_c)$], [$overline(bold(\#M_c))$],
        [#ref(<scn_structural_logical>, supplement: none)], [#yaml("/data/structural_logical.yml").at("clusters").at("count")], [#calc.round(yaml("/data/structural_logical.yml").at("clusters").at("mean"), digits: 1)],
        [#ref(<scn_structural_contributor>, supplement: none)], [#yaml("/data/structural_contributor.yml").at("clusters").at("count")], [#calc.round(yaml("/data/structural_contributor.yml").at("clusters").at("mean"), digits: 1)],
        [#ref(<scn_logical_contributor>, supplement: none)], [#yaml("/data/logical_contributor.yml").at("clusters").at("count")], [#calc.round(yaml("/data/logical_contributor.yml").at("clusters").at("mean"), digits: 1)],
        [#ref(<scn_structural_logical_contributor>, supplement: none)], [#yaml("/data/structural_logical_contributor.yml").at("clusters").at("count")], [#calc.round(yaml("/data/structural_logical_contributor.yml").at("clusters").at("mean"), digits: 1)],
      ),
      caption: [Number of services per scenario]
    ) <services_per_scenario>
  ],
  [
    @services_per_scenario lists the number of services identified by MOSAIK for each scenario.
    Aside from @scn_logical_contributor, the number of services identified by MOSAIK is consistent across the scenarios.
    @scn_logical_contributor, which consists of a test setup using only evolutionary coupling, identified a significantly lower number, five services.
    The lack of structural coupling information has a significant impact on the coupling of the services.
  ],
)

#v(1em)

Investigating further into the services identified in @scn_logical_contributor, we observe that the granularity of the services is significantly lower than in other scenarios, with some services containing seemingly unrelated functionality.
Some of the services include a mix of data processing code, utility functions, and data access code.
The other scenarios, which do include structural coupling information, identified services that have more related functionality grouped together.
Due to the restricted nature of the source code, precise information about the functionality for each service cannot be included in this report.

#grid(
  columns: (60%, 40%),
  gutter: 1em,
  [
     @runtime_statistics depicts the runtime of the analysis for each scenario.
     Each execution is divided into three phases: extraction, decomposition, and evaluation.
     The extraction step is equal for all scenarios, as it is based on the same input data.
     The second step, decomposition, is the most time-consuming step, as it involves the iterative process of identifying the services.
     Finally, the evaluation step executes in nearly the same time for all scenarios.
  ],
  [
    #figure(
      include("/figures/08-case-study/runtime.typ"),
      caption: [Runtime (in seconds)]
    ) <runtime_statistics>
  ]
)

The decomposition in scenarios #ref(<scn_structural_logical>, supplement: none), #ref(<scn_logical_contributor>, supplement: none), and #ref(<scn_structural_logical_contributor>, supplement: none) had a similar runtime (157, 148, and 128 seconds respectively), while the scenario #ref(<scn_structural_contributor>, supplement: none) executed in less than half the time: 72 seconds.
@scn_structural_contributor is the fastest scenario, as it does not consider the logical coupling, which contains a lot of information that needs to be processed.

== Discussion

// Analysis and discussion of the results
// Justify the reason for existence of the modular monolith paradigm

// Refer back to the (non-)functional requirements
// Functional requirements: quality, automation, technology, visual
// Non-functional requirements: usability, performance, reuse

// Ability of the proposal solution to generalize
