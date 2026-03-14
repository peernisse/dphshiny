# Modularized Shiny app.R with shiny dashboard

pkgload::load_all()

ui <- dashboardPage(
    dashboardHeader(title = "App Title"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Tab 1", tabName = "tab1", icon = icon("dashboard")),
            menuItem("Tab 2", tabName = "tab2", icon = icon("th"))
        )
    ),
    dashboardBody(
        tags$head(
            HTML("<html lang='en'>"),
            tags$link(rel = 'stylesheet', type = 'text/css', href = 'style.css')
        ),
        tabItems(
            tabItem(tabName = "tab1", mod_tab1_UI('tab1')),
            tabItem(tabName = "tab2", mod_tab2_UI('tab2'))
        ),
        tags$script(src = 'custom.js'),
        tags$script(src = 'accessibility_datatables_plotly.js')
    )
)

server <- function(input, output, session) {
    mod_tab1_Server('tab1')
    mod_tab2_Server('tab2')
}

shinyApp(ui, server)
