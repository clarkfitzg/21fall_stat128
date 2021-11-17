#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

  sidebarPanel(
        fileInput("file", "file"),
  ),
  mainPanel(
    plotOutput("histogram")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    d = reactive({
        if(is.null(input$file)){
            rnorm(100)
        } else {
            read.csv(input$file$datapath)[, 1]
        }
    })
    
    output$histogram <- renderPlot({
        hist(d())
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
