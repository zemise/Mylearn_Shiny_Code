library(shiny)

ui <- fluidPage(
  textInput("demo01", "",placeholder = "your name", value = ""),
  
  # 用滑块实现日期滑块
  sliderInput("demo02", "When should we deliver?", 
              min = Sys.Date() - 365, 
              max = Sys.Date(), 
              value = Sys.Date() - 30),
  
  sliderInput("demo03", "What number do you want?", min = 0, max = 100, step = 5, value = 5, animate = TRUE)
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)