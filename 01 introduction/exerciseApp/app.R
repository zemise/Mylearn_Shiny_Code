library(shiny)

ui <- fluidPage(
  textInput("name", "what's your name?"),
  
  textOutput("gretting"),
  
  tableOutput("mortgage"),
  
  sliderInput("x", label = "if x is ", min = 0, max = 100, value = 30),
  
  textOutput("product")
  
)

server <- function(input, output, session) {
  name <- reactive(input$name)
  
  x <- reactive(input$x)
  
  output$gretting <- renderText({
    paste0("Hello ", name())
  })
  
  output$product <- renderText(x() * 5)
  
}

shinyApp(ui, server)