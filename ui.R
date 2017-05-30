library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Brain and body weight"),
  sidebarLayout( 
    sidebarPanel(
      sliderInput("sliderbody","What is body weight in KG?", 0,250 ,step = 10,value = 125),
      checkboxInput("showModel1","show/Hide Model 1",value = TRUE),
      textInput("box1","Enter the name of animal",value = "Name of animal"),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted weight of brain from Model1:"),
      textOutput("pred1")
    )
  )
))
