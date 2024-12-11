
## Make a shiny app that allows the user to explore the data
## This app is meant to be deployed in github pages.

# library(shiny)
# library(tidyverse)
# library(bslib)
#
load("data/pop_proj.rda")

downloadButton <- function(...) {
  tag <- shiny::downloadButton(...)
  tag$attribs$download <- NULL
  tag
}

## ui
scpopulation_app_ui <- shiny::fluidPage(
  shiny::titlePanel("South Carolina Population Projection Data Explorer"),

  shiny::sidebarLayout(

    shiny::sidebarPanel(
      shiny::downloadButton('downloadAllData', 'Download All Data'),
      shiny::checkboxGroupInput(
        inputId = "vintage", label = "Choose a data vintage:",
        choices = unique(pop_proj$Edition), selected = "2022"),
      shiny::selectInput(
        inputId = 'county',
        label = 'Choose a county:',
        choices = unique(pop_proj$County),,
        selected = 'SOUTH CAROLINA'),
      shiny::sliderInput(
        inputId = "year",
        label = "Choose a range of years:",
        min = min(pop_proj$Year, na.rm=T),
        max = max(pop_proj$Year, na.rm=T),
        value = c(min(pop_proj$Year, na.rm=T), max(pop_proj$Year, na.rm=T)),
        step = 1, sep=''),
      shiny::downloadButton('downloadSelectedData', 'Download Selected Data')),

    shiny::mainPanel(shiny::plotOutput("plot"))
  ))

scpopulation_app_server <- function(input, output, session) {

  output$downloadAllData <- shiny::downloadHandler(
    filename = "scpopulation_ALL.csv",
    content = function(file) {
      write.csv(data(), file)
    })

   data <- shiny::reactive({
    pop_proj |>
       dplyr::filter(
         Edition %in% input$vintage &
           County %in% input$county &
           Year >= input$year[1] & Year <= input$year[2])
  })

  output$plot <- shiny::renderPlot({
    ggplot2::qplot(1:10, 1:10)
  })

  output$downloadSelectedData <- shiny::downloadHandler(
    filename = function() {
      paste("scpopulation_", input$county, '_', input$vintage, ".csv", sep="")
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )

}

scpopulation_app <- function(...) {
  shiny::shinyApp(
    ui = scpopulation_app_ui,
    server = scpopulation_app_server)
}

# shinylive::export(appdir='myapp', destdir='docs')
