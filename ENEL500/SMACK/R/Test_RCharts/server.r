## server.r
library(shiny)
library(ggplot2)
library(rCharts)

# Begin Shiny Server Call
shinyServer(function(input, output) {
  	output$myChart <- renderChart({
  	data <- 1:100
  	y <- sin(data)
  	p1 <- qplot(data, y, geom="smooth")
  	print(p1)
	})
})