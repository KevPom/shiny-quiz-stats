ui <- fluidPage(
  useShinyjs(),  # Include shinyjs
  
  # Quiz-Titel
  titlePanel("Multi-Page Quiz"),

  # Main-Panel
  mainPanel(
    uiOutput("page_content"),
    # Knopf zur nächsten Aufgabe
    actionButton("next_btn", "Next")
  )
)