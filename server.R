server <- function(input, output, session) {
  #### Logic for rendering pages ----
  
  #### Pages ----
  
  
  
  ## Starter Page
  
  ## Main List that reads pages / questions from database
  pages <- list(
    page1 = div(h3("Question 1"), p("What is 2 + 2?"), textInput("answer", "Your Answer:")),
    page2 = div(h3("Question 2"), p("What is the capital of France?"), textInput("answer", "Your Answer:")),
    page3 = div(h3("Question 3"), p("What is 5 * 3?"), textInput("answer", "Your Answer:"))
  )
  
  solutions <- list("4", "Paris", "15")  # Expected answers as strings
  ## End Page
  
  ## Current Page Tracking
  current_page <- reactiveVal(1)
  
  ## Continue Button
  # Reactive to check if the answer is correct
  is_correct <- reactive({
    req(input$answer)  # Ensure input is not NULL
    input$answer == solutions[[current_page()]]
  })
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
  
  
  ## Rendering of current page
  # TODO Apply both UI and quiz_type logic in some way
  output$page_content <- renderUI({
    pages[[current_page()]]
  })
}