library(shiny)

# Simple idea:
# Convert user input text to uppercase, and print it out.

# Define UI ----
ui <- fluidPage(
    # "textin" becomes the name of a list element in input to server.
    textInput("textin", "enter your text", value = "hello"),
    mainPanel(
        # Everything we display is the name of a list element in output from server
        textOutput("static"),
        textOutput("capital_textin")
    )
)

# We are manipulating objects that come through functions, rather
# than returning new objects (like in regular R)
# This is reference semantics.

# input - first arg, is everything came through UI
# output - second arg, is everything we're generating
server <- function(input, output) {
    output$static <- renderText({
        msg = "this is static, meaning it won't ever change."
        toupper(msg)
    })
    output$capital_textin <- renderText({ # <-- {braces}
        # Inside here is like being inside the body of a function
        toupper(input$textin)
    })
}

# Run the app ----
shinyApp(ui = ui, server = server)