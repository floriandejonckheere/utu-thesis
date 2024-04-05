== Evaluation

// Metrics: functional (cohesion, coupling) and non-functional (network overhead, CPU, memory)
// Lots of metrics were studied by @candela_etal_2016

// Cohesion: number of static calls between methods within microservice boundary over all possible existing static calls (@carvalho_etal_2020)
// Coupling: sum of static calls from within microservice boundary to methods outside (@carvalho_etal_2020)
// Network overhead: size of primitive types in method calls over microservice boundaries (@carvalho_etal_2020, @filippone_etal_2021)
// => Not really probable due to dynamic nature of Ruby, and no dynamic analysis
// Modularization: user provides set of labels (features), algorithm labels vertices (@carvalho_etal_2020)

// Evaluation for different scenarios
// Different weights for structural, logical, and contributor coupling (@santos_paula_2021)w
