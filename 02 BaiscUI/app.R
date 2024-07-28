library(shiny)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
  # free text
  textInput("text", "what's your name?", value = ""),
  textAreaInput("textArea", "Tell me about yourself", rows = 3),
  
  # numeric inputs
  sliderInput(
  "min",
  "Limit (minimun)",
  value = 5,
  min = 0,
  max = 1000
  ), 
  numericInput("numeric", "numeric", value = ""),
  sliderInput("rang", "range", value = c(2,5), min = 0, max = 100),

# Dates
  dateInput("born", "When were your born"),
  dateRangeInput("holider", "When do your want to go on vacation next?"),

# Limited choices
  selectInput("state", "What's your favourite state", state.name),
  radioButtons("animals", "What's your favourite animal", animals),
  radioButtons("rb", "Choose one:", 
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry","happy","sad")),
  
  selectInput("demo1","What's your favourite sate", state.name, multiple = TRUE),
  
  checkboxGroupInput("demo2", "What' your favourite animal", animals),

# File uploads
  fileInput("demo03", NULL),

# Action buttons
  actionButton("demo04", "Click me!"),
  actionButton("demo05", "Drink me!", icon = icon("cocktail")),

# add some css
  actionButton("demo06", "Click me!", class = "btn-danger"),
  actionButton("demo07", "Drink me!", icon = icon("cocktail"), class = "btn-lg btn-success"),
  actionButton("demo08", "Eat me!", class = "btn-block"),
  
  # output
  textOutput("demo09"),
  verbatimTextOutput("demo10"),

# 表格渲染
  tableOutput("static"),
  #dataTableOutput("dynamic"),
  DT::DTOutput("dynamic02"),
  # 图表
  plotOutput("plot", width = "400px")
  
  
)




server <- function(input, output, session) {
  output$demo09 <- renderText({"text"})
  
  output$demo10 <- renderPrint({summary(1:10)})
  
  output$static <- renderTable(head(mtcars))
  
  #output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
  output$dynamic2 <- DT::renderDT(mtcars, options = list(pageLength = 5))
  
  output$plot <- renderPlot(plot(1:5), res = 96)
  
}

shinyApp(ui, server)