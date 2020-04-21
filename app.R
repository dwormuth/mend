#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    # tags$head(tags$style("
    #                      .selectize-control .option:nth-child(1) {
    #                      background-color: rgba(30,144,255,0.5);
    #                      }
    #                      ")
    #
    # ),
    # Application title
    h1(
        "Medically-Necessary, Time-Sensitive Procedures Calculator"
    ),
    h2("University of Chicago"),
    h3(fluidRow(p(textOutput("ments_score")))),
    hr(),
    fluidRow(
        column(3,
               selectInput(
                   "vortime",
                   "OR Time",
                   c(
                       "Not Scored" = "6",
                       "1 <30 min" = "1",
                       "2 30-60 min" = "2",
                       "3 61-120 min" = "3",
                       "4 121-180 min" = "4",
                       "5 >= 181 min" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "velos",
                   "Estimated Length of Stay",
                   c(
                       "Not Scored" = "6",
                       "1 Outpatient" = "1",
                       "2 23 hours" = "2",
                       "3 24-48 hours" = "3",
                       "4 <= 3 days" = "4",
                       "5 >=4 days" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vpostopICU",
                   "Post-Op ICU Need",
                   c(
                       "Not Scored" = "6",
                       "1 Very Unlikely" = "1",
                       "2 <5%" = "2",
                       "3 5-10%" = "3",
                       "4 11-25%" = "4",
                       "5 >25%" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vabl",
                   "Anticipated Blood Loss",
                   c(
                       "Not Scored" = "6",
                       "1 <100 cc" = "1",
                       "2 100-250cc" = "2",
                       "3 251-500cc" = "3",
                       "4 501-750cc" = "4",
                       "5 >750cc" = "5"
                   )
               ))
        
    ),
    fluidRow(
        column(3,
               selectInput(
                   "vteamsizel",
                   "Surgical Team Size",
                   c(
                       "Not Scored" = "6",
                       "1 1 person" = "1",
                       "2 2 people" = "2",
                       "3 3 people" = "3",
                       "4 4 people" = "4",
                       "5 >4 people" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vintube",
                   "Intubation Probability",
                   c(
                       "Not Scored" = "6",
                       "1 <1%" = "1",
                       "2 1-5%" = "2",
                       "3 6-10%" = "3",
                       "4 11-25%" = "4",
                       "5 >25%" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vsurgsite",
                   "Surgical Site",
                   c(
                       "Not Scored" = "6",
                       "1 None of the following" = "1",
                       "2 Abdominopelvic MIS" = "2",
                       "3 Abdominopelvic Open Surgery, Infraumbilical" = "3",
                       "4 Abdominopelvic Open Surgery, Supraumbilical" = "4",
                       "5 Open Head and Neck, Upper GI, Thoracic" = "5"
                   )
               )),
        
    ),
    hr(),
    fluidRow(column(
        6,
        selectInput(
            "vnonopeffect",
            "Effectiveness of Non-operative Treatment",
            c(
                "Not Scored" = "6",
                "1 None available" = "1",
                "2 Available, <40% as effective as surgery" = "2",
                "3 Available, 40-60% as effective as surgery" = "3",
                "4 Available, 61-95% as effective as surgery" = "4",
                "5 Available, equally effective as surgery" = "5"
            )
        )
    ),
    column(
        6,
        selectInput(
            "vresourceuse",
            "Resource Use/Exposure Risk of Non-operative Treatment",
            c(
                "Not Scored" = "6",
                "1 Significantly worse/not applicable" = "1",
                "2 Somewhat worse" = "2",
                "3 Equivalent" = "3",
                "4 Somewhat better" = "4",
                "5 Significantly better" = "5"
            )
        )
        
    )),
    fluidRow(
        column(
            3,
            selectInput(
                "v2wkdisease",
                "Impact of 2 week delay in Disease Outcome",
                c(
                    "Not Scored" = "6",
                    "1 Significantly worse" = "1",
                    "2 Worse" = "2",
                    "3 Moderately worse" = "3",
                    "4 Slightly worse" = "4",
                    "5 Minimally worse" = "5"
                )
            )
            
        ),
        column(
            3,
            selectInput(
                "v2wkdifficulty",
                "Impact of 2 week delay in Surgical Difficulty/Risk",
                c(
                    "Not Scored" = "6",
                    "1 Significantly worse" = "1",
                    "2 Worse" = "2",
                    "3 Moderately worse" = "3",
                    "4 Slightly worse" = "4",
                    "5 Minimally worse" = "5"
                )
            )
            
        ),
        column(
            3,
            selectInput(
                "v6wkdisease",
                "Impact of 6 week delay in Disease Outcome",
                c(
                    "Not Scored" = "6",
                    "1 Significantly worse" = "1",
                    "2 Worse" = "2",
                    "3 Moderately worse" = "3",
                    "4 Slightly worse" = "4",
                    "5 Minimally worse" = "5"
                )
            )
        ),
        column(
            3,
            selectInput(
                "v6wkdifficulty",
                "Impact of 6 week delay in Surgical Difficulty/Risk",
                c(
                    "Not Scored" = "6",
                    "1 Significantly worse" = "1",
                    "2 Worse" = "2",
                    "3 Moderately worse" = "3",
                    "4 Slightly worse" = "4",
                    "5 Minimally worse" = "5"
                )
            )
        )
    ),
    hr(),
    fluidRow(
        column(3,
               selectInput(
                   "vage",
                   "Age",
                   c(
                       "Not Scored" = "6",
                       "1 <20" = "1",
                       "2 21-40" = "2",
                       "3 41-50" = "3",
                       "4 51-65" = "4",
                       "5 >65" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vlung",
                   "Lung Disease (Asthma, COPD, CF)",
                   c(
                       "Not Scored" = "6",
                       "1 None" = "1",
                       "4 Minimal (rare inhaler)" = "4",
                       "5 >Minimal" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vosa",
                   "Obstructive Sleep Apnea",
                   c(
                       "Not Scored" = "6",
                       "1 Not Present" = "1",
                       "4 Mild/Moderate (no CPAP)" = "4",
                       "5 On CPAP" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vcv",
                   "CV Disease (HTN, CHF, CAD)",
                   c(
                       "Not Scored" = "6",
                       "1 None" = "1",
                       "2 Minimal (no meds)" = "2",
                       "3 Mild (<=1 Med)" = "3",
                       "4 Moderate (2 meds)" = "4",
                       "5 Severe (>= 3 meds)" = "5"
                   )
               )),
    ),
    fluidRow(
        column(3,
               selectInput(
                   "vdm",
                   "Diabetes",
                   c(
                       "Not Scored" = "6",
                       "1 None" = "1",
                       "3 Mild (no meds)" = "3",
                       "4 Moderate (PO meds only)" = "4",
                       "5 >Moderate (insulin)" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vimmuno",
                   "Immunocompromised",
                   c(
                       "Not Scored" = "6",
                       "1 No" = "1",
                       "4 Moderate" = "4",
                       "5 Severe" = "5"
                   )
               )),
        column(
            3,
            selectInput(
                "vILI",
                "Influenza-like Illness (fever, cough, sore throat, body aches, diarrhea",
                c(
                    "Not Scored" = "6",
                    "1 None (Asymptomatic)" = "1",
                    "5 Yes" = "5"
                )
            )
        ),
        column(3,
               selectInput(
                   "vCOVID",
                   "COVID-19 Exposure",
                   c(
                       "Not Scored" = "6",
                       "1 No" = "1",
                       "2 Probarbly Not" = "2",
                       "3 Possibly" = "3",
                       "4 Probably" = "4",
                       "5 Yes" = "5"
                   )
               )),
    ),
    hr(),
    p("This WWW site  ", strong("DOES NOT STORE ANY"), " information. The following optional fields are presented as a convenience for those that want to print 
      the calcualted results for whatever purpose."),
    fluidRow(
      column(3,
             textInput("PtNameID","Optional Patient Name:","")),
      column(3,
             textInput("PtDOBID","Optional Patient Date of Birth:","")),
      column(3,
             textInput("PtSurgeonID","Optional Surgeon:","")),
    ),
    fluidRow(
      column(6,
             textInput("PtProccedureID","Optional Procedure:",width="100%")),
      column(6,
             textInput("PtRATID","Optional Rationale:",width="100%"))
    ),
    p("This calculator implements the Medically-Necessary, Time-Sensitive Prodcedures: 
      A Scoring System described in the the JACS paper by Prachand VN, Milner R, Angelos P, Posner MC, Fung JJ, Agrawal N,
Jeevanandam V, Matthews JB, Medically-Necessary, Time-Sensitive Procedures: A Scoring System
to Ethically and Efficiently Manage Resource Scarcity and Provider Risk During the COVID-19
Pandemic, Journal of the American College of Surgeons (2020)."),
    a(href="https://doi.org/10.1016/j.jamcollsurg.2020.04.011","JACS DOI Link"),
    p("NB: Unscored fields have a weight of 6 for maximum penalty")
)




# Define server logic required to draw a histogram
server <- function(input, output) {
    output$ments_score <- renderPrint({
      procscore = strtoi(input$vortime) + strtoi(input$velos) +
        strtoi(input$vpostopICU) +
        strtoi(input$vabl) +
        strtoi(input$vteamsizel) +
        strtoi(input$vintube) +
        strtoi(input$vsurgsite)
      disscore = strtoi(input$vnonopeffect) +
        strtoi(input$vresourceuse) +
        strtoi(input$v2wkdisease) +
        strtoi(input$v2wkdifficulty) +
        strtoi(input$v6wkdisease) +
        strtoi(input$v6wkdifficulty)
      patscore = strtoi(input$vage) +
        strtoi(input$vlung) +
        strtoi(input$vosa) +
        strtoi(input$vcv) +
        strtoi(input$vdm) +
        strtoi(input$vimmuno) +
        strtoi(input$vILI) +
        strtoi(input$vCOVID)
      if (procscore > 35) procscore <- 35
      if (disscore > 30) disscore <- 30
      if (patscore > 40) patscore <- 40
      mentsscore =  procscore + disscore + patscore
    
        cat(sprintf("*** The MeNTS score is %i (Procedure (%i) + Disease (%i) + Patient (%i)) out of 105. ***", mentsscore,procscore,disscore,procscore))
    })
}

# Run the application
shinyApp(ui = ui, server = server)
