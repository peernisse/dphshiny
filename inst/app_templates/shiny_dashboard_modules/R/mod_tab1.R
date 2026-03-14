# Demo module. Change the filename, function names, and ID used in app.R 
# to suit your personal app project

mod_tab1_UI <- function(id) {
    ns <- NS(id)
    tagList(
        uiOutput(ns('msg'))
    )
}

mod_tab1_Server <- function(id) {
    moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    output$msg <- renderUI({
        h1('I am Tab 1')
    })
    
    # END MODULE SERVER ----
    
    })
}