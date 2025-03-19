ui <- fluidPage(
  useShinyjs(),  # Include shinyjs
  
  # Title of whole quiz, could be removed
  titlePanel("Multi-Page Quiz"),

  # Main part per question
  mainPanel(
    uiOutput(), # dynamic input choice based on question type
    # TODO: Confirm Button
    # TODO: Next Button
    # TODO: Progress Bar
  ),
  
  # Container for both sidebars
  sidebarLayout(
    # Left sidebar: previous questions
    sidebarPanel(
      width = 3,
      h3("Vorherige Fragen"), # general title for this sidebar
      # List previous questions dynamically
      uiOutput("previous_questions"),  
      br(),
    ),
    
    # Right sidebar: Collapsible tips section
    sidebarPanel(
      width = 3,
      collapsible = TRUE,
      collapsed = TRUE,
      h3("Hinweise"), # general title for this sidebar
      # TODO: Hint Button
      uiOutput("tip")  # Dynamically display tips based on the question
    )
  )
)



