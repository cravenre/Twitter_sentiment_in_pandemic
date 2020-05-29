library(shiny)

# Define the scatter plot to show on shiny app
shinyUI(
    navbarPage("Changing Public Sentiment During Pandemic", theme=shinytheme("flatly"),
               tabPanel('Introduction', icon=icon('book-open'),
                        fluidRow(
                          mainPanel(
                            fluidRow(
                              column(3),
                              column(9,
                                     h2("Project info here"))
                            )
                          )
                        )),
               
               tabPanel("Twitter Analysis", icon=icon("book-open"),
                        fluidRow(
                            sidebarPanel(
                                selectizeInput("entity", h3('Select Entity:'), choices = list(
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
                                )),
                                
                                radioButtons("radio", label = h3("Tweets to include:"),
                                            choices = list("Originals only"='_orig', "Include Retweets"=''))
                                ),
                            
                            mainPanel(
                                h4("Sentiment"),
                                plotOutput("tweet_sent") %>% withSpinner(color="#1C6EA1")
                            ),
                        ),
                      fluidRow(
                        sidebarPanel(
                          "What text was selected perhaps? Or key dates?"
                        ),
                        mainPanel(
                              fluidRow(
                                column(9,
                                  h4("Tweet Volume"),
                                  plotOutput("tweet_vol") %>% withSpinner(color="#1C6EA1")
                                )
                              )
                            )
                        )
                        )
               ))