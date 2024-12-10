
### Make a shiny app that allows the user to explore the data

### start with the boiler plate code from the shiny app template
library(shiny)
library(tidyverse)
library(DT)
library(bslib)

load("data/pop_proj.rda")

downloadButton <- function(...) {
  tag <- shiny::downloadButton(...)
  tag$attribs$download <- NULL
  tag
}

## ui
ui <- fluidPage(
  titlePanel("South Carolina Population Projection Data Explorer"),

  sidebarLayout(

    sidebarPanel(
      checkboxGroupInput(
        inputId = "vintage", label = "Choose a data vintage:",
        choices = unique(pop_proj$Edition), selected = "2022"),
      selectInput(
        inputId = 'county',
        label = 'Choose a county:',
        choices = unique(pop_proj$County),,
        selected = 'SOUTH CAROLINA'),
      sliderInput(
        inputId = "year",
        label = "Choose a range of years:",
        min = min(pop_proj$Year, na.rm=T),
        max = max(pop_proj$Year, na.rm=T),
        value = c(min(pop_proj$Year, na.rm=T), max(pop_proj$Year, na.rm=T)),
        step = 1, sep=''),
      downloadButton('downloadData', 'Download Data')),

    mainPanel(plotOutput("plot"))
  ))

server <- function(input, output, session) {

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

  output$table <- DT::renderDataTable({
    data()
  })

  output$downloadData <- downloadHandler(
    filename = function() {
      paste("scpopulation_", input$county, '_', input$vintage, ".csv", sep="")
    },
    content = function(file) {
      write.csv(data(), file)
    }
  )

}

shiny::shinyApp(ui, server)
