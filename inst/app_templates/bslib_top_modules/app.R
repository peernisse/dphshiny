# Modularized Shiny app.R

pkgload::load_all()

ui <- bootstrapPage(theme = app_theme,
    tags$head(
        HTML("<html lang='en'>"),
        tags$link(rel = 'stylesheet', type = 'text/css', href = 'style.css')
    ),
    bslib::page_navbar(
        title = tags$img(src="header-logo.png", height = 30, 
            alt = 'Utah department of health and human services logo'
        ),
        window_title = "Utah DHHS | App title",
        sidebar = NULL,
        nav_item("App Title", class = "dashboard-title"),
        nav_panel('Tab 1', mod_tab1_UI('tab1')),
        nav_panel('Tab 2', mod_tab2_UI('tab2'))
    ),
    tags$script(src = 'custom.js'),
    tags$script(src = 'accessibility_datatables_plotly.js')
)

server <- function(input, output, session) {
    mod_tab1_Server('tab1')
    mod_tab2_Server('tab2')
}

shinyApp(ui, server)
