library(shiny)

#Creating the shiny app for twitter sentiment data

shinyServer(
    function(input, output) {
        
        dataset <- reactive({
            x <- get(paste0(input$entity,input$radio))
#             x <- get(input$entity)
        })
        
        output$tweet_sent <- renderPlot({
            df <- dataset()
            ggplot(df, aes(x=as.Date(created_at), y=sentiment) ) +
                # stat_density_2d(aes(fill = ..level..), geom = "polygon")+
                stat_summary(aes(x = week_set_day, y = sentiment), 
                             fun.x = function(y) length(y) / length(unique(y)), 
                             geom = "line", color='darkblue', size=1) +
                scale_fill_distiller(palette=4, direction=1)
        })
        
        output$tweet_vol <- renderPlot({
            df <- dataset()
            ggplot(df, aes(x = week_set_day)) +
                geom_bar(fill = 'darkgreen') +
                labs(x='Week (2020)', y='Tweet Volume') #+
                # xlim(2,18)
        })
        
})