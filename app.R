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
        "University of Chicago - Medically-Necessary, Time-Sensitive Procedures Calculator"
    ),
    fluidRow(p(textOutput("ments_score"))),
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
                       "4 121-179 min" = "4",
                       "5 >= 180 min" = "5"
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
                       "5 >4 days" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vpostopICU",
                   "Post-Op ICU Need",
                   c(
                       "Not Scored" = "6",
                       "1 Very Unlikely" = "1",
                       "2<5%" = "2",
                       "3 5-10%" = "3",
                       "4 10-25%" = "4",
                       "5 >25%" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vabl",
                   "Anticipated Blood Loss",
                   c(
                       "Not Scored" = "6",
                       "<100 cc" = "1",
                       "100-250cc" = "2",
                       "251-500cc" = "3",
                       "500-750cc" = "4",
                       ">751cc" = "5"
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
                       "1" = "1",
                       "2" = "2",
                       "3" = "3",
                       "4" = "4",
                       ">4" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vintube",
                   "Intubation Probability",
                   c(
                       "Not Scored" = "6",
                       "<1%" = "1",
                       "1-5%" = "2",
                       "6-10%" = "3",
                       "11-25%" = "4",
                       ">25%" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vsurgsite",
                   "Surgical Site",
                   c(
                       "Not Scored" = "6",
                       "None of the following" = "1",
                       "Abdominopelvic MIS" = "2",
                       "Abdominopelvic Open Surgery, Infraumbilical" = "3",
                       "Abdominopelvic Open Surgery, Supraumbilical" = "4",
                       "Open Head and Neck, Upper GI, Thoracic" = "5"
                   )
               )),
        
    ),
    fluidRow(column(
        6,
        selectInput(
            "vnonopeffect",
            "Effectiveness of Non-operative Treatment",
            c(
                "Not Scored" = "6",
                "None available" = "1",
                "Available, <40% as effective as surgery" = "2",
                "Available, 40-60% as effective as surgery" = "3",
                "Available, 61-95% as effective as surgery" = "4",
                "Available, equally effective as surgery" = "5"
            )
        )
    ),
    column(
        6,
        selectInput(
            "vresourceuse",
            "Resource/Exposure Risk of Non-operative Treatment",
            c(
                "Not Scored" = "6",
                "Significantly worse/not applicable" = "1",
                "Somewhat worse" = "2",
                "Equivalent" = "3",
                "Somewhat better" = "4",
                "Significantly better" = "5"
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
                    "Significantly worse" = "1",
                    "Worse" = "2",
                    "Moderately worse" = "3",
                    "Slightly worse" = "4",
                    "No worse" = "5"
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
                    "Significantly worse" = "1",
                    "Worse" = "2",
                    "Moderately worse" = "3",
                    "Slightly worse" = "4",
                    "No worse" = "5"
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
                    "Significantly worse" = "1",
                    "Worse" = "2",
                    "Moderately worse" = "3",
                    "Slightly worse" = "4",
                    "No worse" = "5"
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
                    "Significantly worse" = "1",
                    "Worse" = "2",
                    "Moderately worse" = "3",
                    "Slightly worse" = "4",
                    "No worse" = "5"
                )
            )
        )
    ),
    fluidRow(
        column(3,
               selectInput(
                   "vage",
                   "Age",
                   c(
                       "Not Scored" = "6",
                       "<20" = "1",
                       "21-40" = "2",
                       "41-50" = "3",
                       "51-65" = "4",
                       ">65" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vlung",
                   "Lung Disease (Asthma, COPD, CF)",
                   c(
                       "Not Scored" = "6",
                       "None" = "1",
                       "Minimal (rare inhaler)" = "4",
                       ">Minimal" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vosa",
                   "Obstructive Sleep Apnea",
                   c(
                       "Not Scored" = "6",
                       "Not Present" = "1",
                       "Mild/Moderate (no CPAP)" = "4",
                       "On CPAP" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vcv",
                   "CV Disease (HTN, CHF, CAD)",
                   c(
                       "Not Scored" = "6",
                       "None" = "1",
                       "Minimal (no meds)" = "2",
                       "Mild (<=1 Med)" = "3",
                       "Moderate (2 meds)" = "4",
                       "Severe (>= 3 meds)" = "5"
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
                       "None" = "1",
                       "Mild (no meds)" = "3",
                       "Moderate (PO meds only)" = "4",
                       ">Moderate (insulin)" = "5"
                   )
               )),
        column(3,
               selectInput(
                   "vimmuno",
                   "Immunocompromised",
                   c(
                       "Not Scored" = "6",
                       "No" = "1",
                       "Moderate" = "4",
                       "Severe" = "5"
                   )
               )),
        column(
            3,
            selectInput(
                "vILI",
                "Influenza-like Illness (fever, cough, sore throat, body aches, diarrhea",
                c(
                    "Not Scored" = "6",
                    "None (Asymptomatic)" = "1",
                    "Yes" = "5"
                )
            )
        ),
        column(3,
               selectInput(
                   "vCOVID",
                   "COVID-19 Exposure",
                   c(
                       "Not Scored" = "6",
                       "No" = "1",
                       "Probarbly Not" = "2",
                       "Possibly" = "3",
                       "Probably" = "4",
                       "Yes" = "5"
                   )
               )),
    ),
    p("This calculator implements the Medically-Necessary, Time-Sensitive Prodcedures: 
      A Scoring System described in the the JACS paper by Prachand VN, Milner R, Angelos P, Posner MC, Fung JJ, Agrawal N,
Jeevanandam V, Matthews JB, Medically-Necessary, Time-Sensitive Procedures: A Scoring System
to Ethically and Efficiently Manage Resource Scarcity and Provider Risk During the COVID-19
Pandemic, Journal of the American College of Surgeons (2020)."),
    a(href="https://doi.org/10.1016/j.jamcollsurg.2020.04.011","JACS DOI Link")
)




# Define server logic required to draw a histogram
server <- function(input, output) {
    output$ments_score <- renderPrint({
        mentsscore = strtoi(input$vortime) + strtoi(input$velos) +
            strtoi(input$vpostopICU) +
            strtoi(input$vabl) +
            strtoi(input$vteamsizel) +
            strtoi(input$vintube) +
            strtoi(input$vsurgsite) +
            strtoi(input$vnonopeffect) +
            strtoi(input$vresourceuse) +
            strtoi(input$v2wkdisease) +
            strtoi(input$v2wkdifficulty) +
            strtoi(input$v6wkdisease) +
            strtoi(input$v6wkdifficulty) +
            strtoi(input$vage) +
            strtoi(input$vlung) +
            strtoi(input$vosa) +
            strtoi(input$vcv) +
            strtoi(input$vdm) +
            strtoi(input$vimmuno) +
            strtoi(input$vILI) +
            strtoi(input$vCOVID)
        #print(input$vortime)
        cat(sprintf("*** The MeNTS score is %i out of 105. ***", mentsscore))
    })
}

# Run the application
shinyApp(ui = ui, server = server)
