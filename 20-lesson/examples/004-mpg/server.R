library(shiny)
library(ggplot2)
library(datasets)
library(dplyr)

# Change all the variables on the x-axis to factors
mpgData <- mtcars %>% 
  mutate(am = factor(am, labels = c("Automatic", "Manual")),
         cyl = factor(cyl),
         gear = factor(gear))

# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {

  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  # Generate a plot of the requested variable against mpg and
  # only include outliers if requested
  output$mpgPlot <- renderPlot({
    ggplot(mpgData, aes_string(x = input$variable, y = "mpg")) +
      geom_boxplot(outlier.size = ifelse(input$outliers, NA, 1.5))
  })
})
