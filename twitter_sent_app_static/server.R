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
                width = 500,
                height = 420,
                alt = "Face"
            ))
        }, deleteFile = FALSE)
        
        output$volume <- renderImage({
            return(list(
                src = vol_pic(),
        width = 380,
        height = 360,
        alt = "Face"
            ))
        }, deleteFile = FALSE)
})