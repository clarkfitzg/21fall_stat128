library(shiny)

# Goal: Linear model display

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Linear Models"),

    # Want to plot and fit a linear model for simulated data:
    # y = ax + b + e
    
    # User inputs
    # a: slope (any number)
    # b: intercept (any number)
    # e: noise positive number for SD
    # n: number of data points, positive integer
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("slope", "slope", 0),
            numericInput("intercept", "intercept", 0),
            numericInput("noise", "standard deviation of error", 1),
            numericInput("npoints", "number of data points", 20)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           # camelcase: linearPlot
           # snakecase: linear_plot
           plotOutput("linearPlot"),
           verbatimTextOutput("summary")
        )
    )
)

server <- function(input, output) {
    
    # Data generation
    # Think of it as fetching data from a server
    # Takes a long time, so we only want to do it once.
    xy = reactive({
        x = rnorm(input$npoints)
        noise = rnorm(input$npoints, sd = input$noise)
        
        # y = ax + b + e
        y = input$slope * x + input$intercept + noise
        data.frame(x = x, y = y)
    })

    output$linearPlot <- renderPlot({
        x = xy()$x
        y = xy()$y
        plot(x, y)
        abline(model(), col = "blue", lwd = 3)
    })
    
    model = reactive({
        # lm is for "linear model"
        lm(y ~ x, data = xy())
    })
        
    output$summary <- renderPrint({
        summary(model())
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
