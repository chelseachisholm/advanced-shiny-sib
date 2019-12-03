# Module UI --------------------------------------------------------------------
movies_module_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    ### add UI elements ###
    plotOutput(ns("scatterplot")),
    DT::dataTableOutput(ns("moviestable"))
  )
  
}

# Module server ----------------------------------------------------------------
movies_module <- function(input, output, session, data, mov_title_type, x, y, z, alpha, size, show_data) {
  # Select movies with given title type ----
  ### add UI elements ###
  movies_with_type <- reactive({
    filter(data, title_type == as.character(mov_title_type))
  })
  
  # Create scatterplot object the plotOutput function is expecting ----
  ### add plotting code ###
  output$scatterplot_doc <- renderPlot({
    ggplot(data = docs(), aes_string(x = input$x, y = input$y, color = input$z)) +
      geom_point(alpha = input$alpha, size = input$size) +
      labs(x = toTitleCase(str_replace_all(input$x, "_", " ")),
           y = toTitleCase(str_replace_all(input$y, "_", " ")),
           color = toTitleCase(str_replace_all(input$z, "_", " "))
      )
  })
  
  # Print data table if checked ----
  ### add data table code ###
  output$moviestable_doc <- DT::renderDataTable(
    if(input$show_data){
      DT::datatable(data = docs()[, 1:7], 
                    options = list(pageLength = 10), 
                    rownames = FALSE)
    }
  )
  
}