# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI --------------------------------------------------------------------

mychoices= list("Scotland"=c("Edinburgh"="edinburgh", 
                                "Glasgow"="glasgow"),
                "Switzerland" = c("Lausanne"="lausanne", 
                                     "Zurich"="zurich"))#could also use functions to title case, as an example
ui <- fluidPage(
  selectInput(inputId = "city",
              label = "Select city",
              choices = mychoices),
  strong("Selected city"),
  textOutput(outputId = "selected_city")
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  output$selected_city <- renderText(tolower(input$city))
}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
