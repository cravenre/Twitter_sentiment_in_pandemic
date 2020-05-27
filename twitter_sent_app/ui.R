library(shiny)

# Define the scatter plot to show on shiny app
shinyUI(
    navbarPage("Changing Public Sentiment During Pandemic", theme=shinytheme("flatly"),
               tabPanel("Introduction", icon=icon("book-open"),
                        fluidRow(
                            sidebarPanel(
                                selectizeInput("entity", 'Select Entity:', choices = list(
                                    Person = c(`Donald Trump` = 'trump', `Barack Obama` = 'obama',
                                               `Boris Johnson`='boris', `Nancy Pelosi`='pelosi',
                                               `Anthony Fauci`='fauci'
                                               ),
                                    Location = c(`New York` = 'nyc', `United States` = 'usa',
                                                 `China`='china', `Italy`='italy', `Spain`='spain'),
                                    Organization = c(`European Union`='eu', `White House`='whitehouse',
                                                     `Centers for Disease Control`='cdc',
                                                     `World Health Organization`='who',
                                                     `Congress`='congress', `National Health Service`='nhs'),
                                    Sports = c(`Football`='football', `Soccer`='soccer', `Hockey`='hockey',
                                               `Basketball`='basketball', `Baseball`='baseball')
                                ))),
                            mainPanel(
                                h4("test"),
                                plotOutput("tweet_sent")
                            )
                            
                        )
                        ),
               
               tabPanel("Graphs"),
                    fluidRow(
                        sidebarPanel(
                            "testing"
                        ),
                        mainPanel(
                            fluidRow(
                                column(9, h4("still testing"))
                            )
                        )
                    )
               ))