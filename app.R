#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(readr)

# Define UI for application
ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    menuItem("Choix des paramètres", tabName = "tabParam"),
    menuItem("Filtre", tabName = "tabFiltre")
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "tabParam", 
              box(title = "Paramètres",
                  uiOutput("listParam")
                  )
              )
    )
  )
)



# Define server logic required to draw a histogram
server <- function(input, output) {
  data <- read_csv("data.csv")
  output$listParam - renderUI ({
    lapply(seq(names(data)), function(i){
      radioButtons(inputId = names(data)[i], label = names(data)[i], choices = c(1,2,3), inline = TRUE )
    })
  })
}



# Run the application 
shinyApp(ui = ui, server = server)

