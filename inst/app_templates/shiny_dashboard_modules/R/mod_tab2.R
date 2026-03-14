# Demo module. Change the filename, function names, and ID used in app.R 
# to suit your personal app project

mod_tab2_UI <- function(id) {
    ns <- NS(id)
    tagList(
        uiOutput(ns('msg'))
    )
}

mod_tab2_Server <- function(id) {
    moduleServer(id, function(input, output, session) {
        ns <- session$ns
        
        output$msg <- renderUI({
            h1('I am Tab 2')
        })
        
        # END MODULE SERVER ----
        
    })
}