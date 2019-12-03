# Load packages ----------------------------------------------------------------
library(shiny)

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  # adding the new div tag to the sidebar            
  div(class = "thumbnail",
      div(class = "embed-responsive embed-responsive-16by9",
          tags$iframe(class = "embed-responsive-item", 
                      src = "https://www.youtube.com/embed/hou0lU8WMgo", 
                      allowfullscreen = NA) #no attribute assigned, so default to 'no argument'. If you take this argument out fullscreen becomes unavailable.
      ),
      div(class = "caption",
          h3("You are technically correct"),
          div("The best kind of correct!")
      )
  )
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {}

# Create the app ---------------------------------------------------------------
shinyApp(ui, server)
