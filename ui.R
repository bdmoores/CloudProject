#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
UI<-fluidPage(

    # Application title
    titlePanel("Used Car Price Predictor"),


    sliderInput(inputId ="year",
                "Production Year:",
                min = 1990,
                max = 2015,
                value = 2000,
                sep = "",
                step = 1),
    
    sliderInput(inputId ="condition",
                "Vehicle Condition:",
                min = 1,
                max = 5,
                value = 2.5,
                step = 0.1),
    
    numericInput(inputId ="odometer",
                "Vehicle Odometer Reading:",
                value = 120000),
    
    numericInput(inputId ="mmr",
                "Vehicles MMR Index:",
                value = 10000),
    
    textOutput("value")

)
