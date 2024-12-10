
### Make a shiny app that allows the user to explore the data

### start with the boiler plate code from the shiny app template
library(shiny)
library(tidyverse)
library(DT)

# load("data/pop19.rda")
# load("data/pop22.rda")

## ui
ui <- fluidPage(
  titlePanel("Population Data Explorer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("pop19",
                              "pop22")),
      selectInput('county', 'Choose a county:', choices = NULL)),
    mainPanel(
      DT::dataTableOutput("table")
    )))

server <- function(input, output, session) {

  # data <- reactive({
  #   switch(input$dataset,
  #          "pop19" = pop19,
  #          "pop22" = pop22)
  # })

  # observe({
  #   updateSelectInput(session, 'county', 'Choose a county:', choices = unique(data()$County))
  # })

  output$table <- DT::renderDataTable({
    iris # data()
  })
}

shinyApp(ui, server)
