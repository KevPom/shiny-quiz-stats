setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(shiny)
#install.packages("shiny")
#install.packages("shinyWidgets")  # For enhanced UI elements
#install.packages("shinyjs")       # For interactivity
#install.packages("DT")            # For displaying results in tables

source("ui.R")
source("server.R")

shinyApp(ui, server)

shiny::runApp()