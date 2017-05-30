library(shiny)
shinyServer(function(input, output) {
  model1 <- lm(brain ~ body , data = mammals)
  model1pred <- reactive({
    bodyInput <- input$sliderbody
    predict(model1 ,newdata = data.frame(body = bodyInput))
  })
  output$plot1 <- renderPlot({
    bodyInput <- input$sliderbody
    plot(mammals$body, mammals$brain,xlab = "Body weight in Kg",
         ylab = "Brain weight in grams",bty = "n",pch = 16,
         xlim = c(0,250),ylim = c(0,400))
    if(input$showModel1){
      abline(model1 , col = "Green" , lwd = 2)
      points(bodyInput,model1pred(),col = "black",pch = 16 ,cex = 2)
    }
    
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
})
 
