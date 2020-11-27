#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(caret)
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict Iris Type"),
fluidRow(
    # Sidebar with a slider input for number of bins
    column(5, 
        wellPanel(
            sliderInput("SepalLength", "How long is the sepal?", 4.3, 7.3, value=5.8),
            sliderInput("SepalWidth", "How wide in the sepal?", 2.0, 4.4, value=3.2 ),
            sliderInput("PetalLength", "How long are the petal?", 1.0, 6.3, value=3.65),
            sliderInput("PetalWidth", "How wide are the petals?", 0.1, 2.5, value=1.3)
        )),

        # Show a plot of the generated distribution
        column(5,
            h3("With these inputs your iris has a 93.65% chance to be of species:"),
            h3(textOutput("pred1")) 
        )
    )
))
