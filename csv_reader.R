#### Function to turn CSV entries into database of questions ----
# Reads the CSV file and turns it into usable quiz data
library(readr)

read_quiz_csv <- function(file_path = "questions.csv") {
  df <- read_csv2(file_path, col_types = cols(
    # Force all columns to character format for easier processing, can be converted as needed later
    main_text = col_character(),
    type = col_character(),
    choice_1 = col_character(),
    choice_2 = col_character(),
    choice_3 = col_character(),
    choice_4 = col_character(),
    solution = col_character(),
    start_tip = col_character(),
    wrong_tip = col_character(),
    question_image = col_character(),
    question_codechunk = col_character()
  ))
  
  # Replace NAs with empty strings for optional fields
  df[is.na(df)] <- ""
  
  return(df)
}


# For testing purposes / looking at the structure of the parsed CSV as dataframe
if (sys.nframe() == 0) {
  # Code to execute only when this script is run directly
  df <- read_quiz_csv("questions.csv")
  View(df)
}
