server <- function(input, output, session) {
  #### Logic for rendering pages ----
  
  #### Pages ----
  
  
  
  ## Starter Page
  
  ## Main List that reads pages / questions from database
  pages <- list(
    page1 = div(h3("Question 1"), p("This is the first question.")),
    page2 = div(h3("Question 2"), p("This is the second question.")),
    page3 = div(h3("Question 3"), p("This is the third question."))
  )
  ## End Page
  
  ## Current Page
  current_page <- reactiveVal(1)
  
  ## Continue Button
  # TODO Conditional that result needs to be correct for button to work
  observeEvent(input$next_btn, {
    if (current_page() < length(pages)) {
      current_page(current_page() + 1)
    }
  })
  
  ## Rendering of current page
  # TODO Apply both UI and quiz_type logic in some way
  output$page_content <- renderUI({
    pages[[current_page()]]
  })
}