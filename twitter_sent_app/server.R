library(shiny)

#Creating the shiny app for twitter sentiment data

shinyServer(
    function(input, output) {
        
        df <- reactive({
            x <- get(input$entity)
        })
        
        output$tweet_sent <- renderPlot({
            df <- df()
            ggplot(df) +
                stat_summary(aes(x = week, y = sentiment), 
                             fun.x = function(y) length(y) / length(unique(y)), 
                             geom = "line") +
                geom_point(data=df, aes(x=week, y=sentiment), alpha=0.005)
        })

#        output$entity <- 
        
})