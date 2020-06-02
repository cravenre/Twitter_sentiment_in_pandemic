library(shiny)

#Creating the shiny app for twitter sentiment data

shinyServer(
    function(input, output) {
        
        dataset <- reactive({
            x <- get(paste0(input$entity,input$radio))
        })
        
        dates <- reactive({
            y <- get(paste0(input$entity,'_dates'))
        })
        
        output$special_dates <- renderUI({
            imp_dates <-dates()
            var <- paste(imp_dates, collapse = ' <br> ')
            HTML(var)
        })
        
        output$tweet_sent <- renderPlot({
            df <- dataset()
            ggplot(df, aes(x=as.Date(created_at), y=sentiment) ) +
                stat_density_2d(data=df[sample(nrow(df), 10000), ], aes(fill = ..level..), geom = "polygon")+
                stat_summary(aes(x = week_set_day, y = sentiment), 
                             fun.x = function(y) length(y) / length(unique(y)), 
                             geom = "line", color='darkblue', size=1) +
                scale_fill_distiller(palette=4, direction=1) +
                labs(fill='Density of Tweets')+
                scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
                             limits=as.Date(c("2020-01-01 00:00", "2020-05-01 00:00")))+
                theme(axis.text.x=element_text(angle=90,hjust=1)) +
                labs(x='Date of Tweet (2020)', y='Sentiment Score')
        })
        
        output$tweet_vol <- renderPlot({
            df <- dataset()
            ggplot(df, aes(x = week_set_day)) +
                geom_bar(fill = 'darkgreen') +
                labs(x='Week (2020)', y='Tweet Volume')+
                scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
                             limits=as.Date(c("2020-01-01 00:00", "2020-05-01 00:00")))+
                theme(axis.text.x=element_text(angle=90,hjust=1)) +
                labs(x='Date of Tweet (2020)', y='Number of Tweets')
        })
        
        # sent_plot <- ggplot(df, aes(x=as.Date(created_at), y=sentiment) ) +
        #     stat_density_2d(data=df[sample(nrow(df), 10000), ], aes(fill = ..level..), geom = "polygon")+
        #     stat_summary(aes(x = week_set_day, y = sentiment), 
        #                  fun.x = function(y) length(y) / length(unique(y)), 
        #                  geom = "line", color='darkblue', size=1) +
        #     scale_fill_distiller(palette=4, direction=1) +
        #     labs(fill='Density of Tweets')+
        #     scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
        #                  limits=as.Date(c("2020-01-01 00:00", "2020-05-01 00:00")))+
        #     theme(axis.text.x=element_text(angle=90,hjust=1)) +
        #     labs(x='Date of Tweet (2020)', y='Sentiment Score')
        # 
        # vol_plot <- ggplot(df, aes(x = week_set_day)) +
        #     geom_bar(fill = 'darkgreen') +
        #     labs(x='Week (2020)', y='Tweet Volume')+
        #     scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
        #                  limits=as.Date(c("2020-01-01 00:00", "2020-05-01 00:00")))+
        #     theme(axis.text.x=element_text(angle=90,hjust=1)) +
        #     labs(x='Date of Tweet (2020)', y='Number of Tweets')
        # 
        # g1grob <- ggplotGrob(sent_plot)
        # g2grob <- ggplotGrob(vol_plot)
        # 
        # output$plots <- renderPlot({
        #     grid.arrange(g1grob, g2grob)
        # })
        
})