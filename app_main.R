setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(shiny)
library(shinyjs)

#install.packages("shiny")
#install.packages("shinyWidgets")  # For enhanced UI elements
#install.packages("shinyjs")       # For interactivity and disabling UI elements
#install.packages("DT")            # For displaying results in tables

source("ui.R")
source("server.R")

shinyApp(ui, server)

shiny::runApp()