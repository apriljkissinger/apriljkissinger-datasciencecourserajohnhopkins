#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    rpartout <- train(Species ~ .,method="rpart",data=iris.train, tuneLength=7)
    
    pred.rpart <- reactive({
        Sepal.Length <- input$SepalLength
        Sepal.Width <- input$SepalWidth
        Petal.Length <- input$PetalLength
        Petal.Width <- input$PetalWidth
        
        inputs <- as.data.frame(Sepal.Length)
        inputs <- cbind(inputs, Sepal.Width, Petal.Length, Petal.Width)
        as.character(predict(rpartout, newdata = inputs))
        # cmatrix.tree <-  confusionMatrix(pred.tree, iris.valid$Species)
        
    })
    
    
   output$pred1 <- renderText({
        pred.rpart()
    })
})
