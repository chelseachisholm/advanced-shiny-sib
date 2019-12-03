# Load packages ----------------------------------------------------------------
library(shiny)
library(tidyverse)
library(DT)
library(tools)

# Load data --------------------------------------------------------------------
load("movies.Rdata")
source("02-moviesmodule.R")

# Define UI --------------------------------------------------------------------
ui <- fluidPage(
  tags$style(type="text/css", ".recalculating { opacity: 1.0; }"),
  titlePanel("Gapminder"),
  tabsetPanel(id = "continent", 
              tabPanel("Documentaries", gapModuleUI("Documentary")),
              tabPanel("Feature Films", gapModuleUI("Feature Film")),
              tabPanel("TV movies", gapModuleUI("TV Movie"))
            
  )
)

# Define server ----------------------------------------------------------------
server <- function(input, output, session) {
  callModule(moviesmodule, "Documentary")
  callModule(moviesmodule, "Feature Film")
  callModule(moviesmodule, "TV Movie")
   
}

# Create the app ---------------------------------------------------------------
shinyApp(ui = ui, server = server)
