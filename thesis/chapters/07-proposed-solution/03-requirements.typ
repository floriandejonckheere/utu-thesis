#import "/helpers.typ": *

== Requirements

Our approach needs to fulfill certain requirements.
We make a distinction between functional and non-functional requirements.
In software engineering, functional requirements describe requirements that impact the design of the application in a functional way @software_engineering_body_of_knowledge_2001.
Non-functional requirements are additional requirements imposed at design-time that do not directly impact the functionality of the application @software_engineering_body_of_knowledge_2001.

// Quality requirements: @abdellatif_etal_2021

The functional requirements we pushed forward for our proposed solution are as follows:

+ *Quality*: the solution provides a high-quality decomposition of the monolith application, based on a set of quality metrics
+ *Automation*: the solution automates the decomposition process as much as possible
+ *Visual*: the solution can output the proposed decomposition in a visual manner, to aid understanding of the process and the results

#v(1em)
The non-functional requirements identified for our solution are:

+ *Performance*: the solution performs the analysis, decomposition, and evaluation reasonably fast
