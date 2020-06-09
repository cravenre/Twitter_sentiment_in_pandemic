library(shiny)

#Creating the shiny app for twitter sentiment data

shinyServer(
    function(input, output) {
        
        sent_pic <- reactive({
            x <- paste0('plots/',input$entity,input$radio,'_sent.png')
        })
        
        vol_pic <- reactive({
            x <- paste0('plots/',input$entity,input$radio,'_vol.png')
        })
        
        dates <- reactive({
            y <- get(paste0(input$entity,'_dates'))
        })
        
        output$special_dates <- renderUI({
            imp_dates <-dates()
            var <- paste(imp_dates, collapse = ' <br> ')
            HTML(var)
        })
        
        output$sentiment <- renderImage({
            return(list(
                src = sent_pic(),
                # contentType = "image/jpeg",
                width = 500,
                height = 420,
                alt = "Face"
            ))
        }, deleteFile = FALSE)
        
        output$volume <- renderImage({
            return(list(
                src = vol_pic(),
        #contentType = "image/jpeg",
        width = 380,
        height = 360,
        alt = "Face"
            ))
        }, deleteFile = FALSE)
        
        # output$tweet_sent <- renderPlot({
        #     df <- dataset()
        #     ggplot(df, aes(x=as.Date(created_at), y=sentiment) ) +
        #         stat_density_2d(data=df[sample(nrow(df), 10000), ], aes(fill = ..level..), geom = "polygon")+
        #         stat_summary(aes(x = week_set_day, y = sentiment), 
        #                      fun.x = function(y) length(y) / length(unique(y)), 
        #                      geom = "line", color='darkblue', size=1) +
        #         scale_fill_distiller(palette=4, direction=1) +
        #         labs(fill='Density of Tweets')+
        #         ylim(-10, 10) +
        #         scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
        #                      limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
        #         theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        #               axis.text.y=element_text(size=12),
        #               axis.title.x=element_text(size=16),
        #               axis.title.y=element_text(size=16)) +
        #         labs(x='Date of Tweet (2020)', y='Sentiment Score')
        # })
        # 
        # output$tweet_vol <- renderPlot({
        #     df <- dataset()
        #     ggplot(df, aes(x = week_set_day)) +
        #         geom_bar(fill = 'darkgreen') +
        #         labs(x='Week (2020)', y='Tweet Volume')+
        #         scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
        #                      limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
        #         theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        #               axis.text.y=element_text(size=12),
        #               axis.title.x=element_text(size=16),
        #               axis.title.y=element_text(size=16)) +
        #         labs(x='Date of Tweet (2020)', y='Number of Tweets')
        # })
        
})