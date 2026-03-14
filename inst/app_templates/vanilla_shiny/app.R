# Vanilla Shiny app.R no modules

pkgload::load_all()

ui <- navbarPage(
    title = 'App Title',
    windowTitle = 'Utah DHHS | App Title',
    header = tags$head(
        HTML("<html lang='en'>"),
        tags$link(rel = 'stylesheet', type = 'text/css', href = 'style.css')
    ),
    tabPanel('Tab 1',
        h1('I am tab 1'),
        selectInput('choose_item', 'Choose item!',
            choices = c('A', 'B', 'C'), selected = 'A'
        ),
        textOutput('msg1')
    ),
    tabPanel('Tab 2',
        h1('I am tab 2'),
        checkboxGroupInput('choose_items', 'Choose items!',
            choices = c('A', 'B', 'C'), selected = 'A'
        ),
        actionButton('btn_update', 'Update'),
        textOutput('msg2')
    ),
    footer = tagList(
        tags$script(src = 'custom.js'),
        tags$script(src = 'accessibility_datatables_plotly.js')
    )
)

server <- function(input, output, session) {

    output$msg1 <- renderText({ paste('You selected:', input$choose_item ) })

    observeEvent(input$btn_update, {
        items <- paste(input$choose_items, collapse = '|')
        output$msg2 <- renderText({
            paste('You selected:', items)
        })
    })

}

shinyApp(ui, server)
