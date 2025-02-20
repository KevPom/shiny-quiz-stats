ui <- fluidPage(
  # Quiz-Titel
  titlePanel("Multi-Page Quiz"),
  # Knopf zur nächsten Aufgabe
  actionButton("next_btn", "Next"),
  #
  mainPanel(
    uiOutput("page_content")
  )
)