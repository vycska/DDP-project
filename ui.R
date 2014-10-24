library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Angles"),
  sidebarPanel(
    p("Use slider bar to set the desired angle value. Mark the check box to show the angles and their types."),
    sliderInput("d", 'Angle size',value = 0, min = 0, max = 360, step = 5,animate=TRUE),
    checkboxInput("l","Show angles",FALSE)
  ),
  mainPanel(
    plotOutput('newPlot')
  )
))