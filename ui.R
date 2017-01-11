library(shiny)
library(ggplot2)  

shinyUI(pageWithSidebar(
        headerPanel('Analyse Iris Data'),
        sidebarPanel(
                checkboxGroupInput('show_vars', 
                                   'Columns in iris to show:', 
                                   names(iris),
                                   selected = names(iris)),
                helpText('For the iris data, we customize the 
                         length menu so we can display 5 rows per page.')
                ),
                mainPanel(
                  tabsetPanel(
                      tabPanel('Iris data',
                                 dataTableOutput("mytable"))
                )
        )
                ))