## ui.R
library(shiny)
library(rCharts)
require(rCharts)
shinyUI(fluidPage(
  headerPanel("rCharts: Interactive Charts from R using polychart.js"),
  mainPanel(
    showOutput("myChart", "polycharts")
  )
))