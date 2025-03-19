server <- function(input, output, session) {
  #### Logic for rendering pages ----
  
  #### Pages ----
  ## Current Page Tracking
  current_page <- reactiveVal(1)
  
  ## TODO: Main Question Content
  
  ## Continue Button
  # Reactive to check if the answer is correct
  is_correct <- reactive({
    req(input$answer)  # Ensure input is not NULL
    input$answer == solutions[[current_page()]]
    
    ## TODO: Give Hint if answer is wrong
  })
  
  ## TODO: SweetAlert to display if answer is wrong / right
  
  ## TODO: Disable Correct Button upon completion
  
  # Observe next button click and move to the next page if correct
  observeEvent(input$next_btn, {
    if (is_correct() && current_page() < length(pages)) {
      current_page(current_page() + 1)
      updateTextInput(session, "answer", value = "")  # Reset input field
    }
  })
  # Disable/enable Next button based on correctness
  observe({
    if (is_correct()) {
      enable("next_btn")
    } else {
      disable("next_btn")
    }
  })
  
  # Logic for Tips / Sidebar Tips
  # TODO: Implement tip button
  
  ## Rendering of current page
  # TODO: Apply both UI and quiz_type logic in some way
  output$page_content <- renderUI({
    pages[[current_page()]]
  })
}