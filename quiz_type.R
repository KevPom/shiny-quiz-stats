#### Function to apply the right questionnaire UI for a given question
# Function to apply the appropriate questionnaire UI for a given question
library(shiny)
library(shinyWidgets)

quiz_ui <- function(question) {
  switch(question$type,
         #### Multiple Choice (Single Answer) ----
         "mcsa3" = awesomeRadio(
           inputId = "user_answer",
           label = "Wähle die zutreffende Antwort:",
           choices = c(question$choice_1, question$choice_2, question$choice_3),
           selected = NULL,
           status = "primary"
         ),
         
         "mcsa4" = awesomeRadio(
           inputId = "user_answer",
           label = "Wähle die zutreffende Antwort:",
           choices = c(question$choice_1, question$choice_2, question$choice_3, question$choice_4),
           selected = NULL,
           status = "primary"
         ),
         
         #### Multiple Selection (Multiple Answers) ----
         "mcma3" = awesomeCheckboxGroup(
           inputId = "user_answer",
           label = "Wähle alle, die zutreffen:",
           choices = c(question$choice_1, question$choice_2, question$choice_3),
           status = "primary"
         ),
         
         "mcma4" = awesomeCheckboxGroup(
           inputId = "user_answer",
           label = "Wähle alle, die zutreffen:",
           choices = c(question$choice_1, question$choice_2, question$choice_3, question$choice_4),
           status = "primary"
         ),
         
         #### Text Input ----
         "text" = textInput(
           inputId = "user_answer",
           label = "Gib hier deine Antwort ein:"
         ),
         
         #### Numeric Input ----
         "numeric" = numericInput(
           inputId = "user_answer",
           label = "Gib das Ergebnis ein (mind. 2 Nachkommastellen):",
           value = NULL
         )
  )
}

# For testing purposes / looking at the UI Elements of Input
if (sys.nframe() == 0) {
  # Code to execute only when this script is run directly
  # UI with 4 different question types
  ui <- fluidPage(
    # Multiple Choice Question (Radio Buttons)
    quiz_ui(list(
      type = "mcsa4", 
      choice_1 = "Option 1", 
      choice_2 = "Option 2", 
      choice_3 = "Option 3", 
      choice_4 = "Option 4"
    )),
    
    # Multiple Selection Question (Checkboxes)
    quiz_ui(list(
      type = "mcma4", 
      choice_1 = "Option A", 
      choice_2 = "Option B", 
      choice_3 = "Option C", 
      choice_4 = "Option D"
    )),
    
    # Text Input Question
    quiz_ui(list(
      type = "text", 
      choice_1 = "", 
      choice_2 = "", 
      choice_3 = "", 
      choice_4 = ""
    )),
    
    # Numeric Input Question
    quiz_ui(list(
      type = "numeric", 
      choice_1 = "", 
      choice_2 = "", 
      choice_3 = "", 
      choice_4 = ""
    ))
  )
  
  server <- function(input, output, session) {}
  
  # Run the application
  shinyApp(ui, server)
}


