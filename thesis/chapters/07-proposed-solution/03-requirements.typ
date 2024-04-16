#import "/helpers/cite.typ": *

== Requirements

Our approach needs to fulfill certain requirements.
We make a distinction between functional and non-functional requirements.
In software engineering, functional requirements describe requirements that impact the design of the application in a functional way /* TODO: reference */.
Non-functional requirements are additional requirements imposed at design-time that do not directly impact the functionality of the application /* TODO: reference */.

// Quality requirements: @abdellatif_etal_2021

The functional requirements we pushed forward for our proposed solution are as follows:

+ *Quality*: the solution provides a high-quality decomposition of the monolithic application, based on a set of quality metrics
+ *Automation*: the solution automates the decomposition process as much as possible
+ *Technology*: the solution can analyze applications written in the Ruby programming language#footnote[#link("https://www.ruby-lang.org/")[https://www.ruby-lang.org/]]
+ *Visual*: the solution can output the proposed decomposition in a visual manner, to aid understanding of the process

#v(1em)
The non-functional requirements identified for our solution are:

+ *Usability*: a software architect or senior software engineer can reasonably quickly get started with the solution
+ *Performance*: the solution performs the analysis, decomposition, and evaluation reasonably fast on the source code of a larger application /* TODO: define larger application */
+ *Reuse*: The solution can successfully be reused for untested monolithic applications
