#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#packages = c("caret", "plotly", "data.table", "GGally", "tidymodels", "car", "scales", "lmtest")

#package.check <- lapply(
#    packages,
#    FUN = function(x) {
#        if (!require(x, character.only = TRUE)) {
#            install.packages(x, dependencies = TRUE)
#            library(x, character.only = TRUE)
#        }
#    }
#)

shinyServer(function(input, output) {
    

    output$value <- renderText({
        
        #load trained model
        lm_pred <- readRDS("trained_prediction_model.rds")
        #create data frame
        testVal<-data.frame(year = numeric(),    # Create empty data frame
                         condition = numeric(),
                         odometer = numeric(),
                         mmr= numeric(),
                         stringsAsFactors = FALSE)
        #predict car value from model
        testVal[1,]<- list(input$year, input$condition, input$odometer,input$mmr)
        testpred<- trunc(predict(lm_pred, newdata = testVal))


        
        paste("Predicted Car Value: $", testpred)
        
        
    })

})
