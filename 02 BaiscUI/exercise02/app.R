library(shiny)

ui <- fluidPage(
  # dataTableOutput("table")
  DT::DTOutput("table")
)

server <- function(input, output, session){
  # output$table <- renderDataTable(
  #  mtcars, options = list(pageLength = 5)
  #)
  
  output$table <- DT::renderDT(
    mtcars, options = list(pageLength = 5)
  )
}

shinyApp(ui, server)