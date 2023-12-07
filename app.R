# activate shiny pkg
library(shiny)

# build user interface
ui <- fluidPage(
  # input element
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  # output element
  plotOutput(outputId = "hist")
  
)

# server script
server <- function(input, output) {
  # build output
  output$hist <- 
    renderPlot({
      hist(rnorm(input$num))
    })
}

shinyApp(ui = ui, server = server)