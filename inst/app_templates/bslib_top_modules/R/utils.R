# Utility functions for shiny app
# We suggest using multiple files for your custom functions
# but at a minumum put custom functions here

# See example tests for demonstration_function() in tests/testthat/test-utils.R

# CONSTANTS ----

## bslib CSS theme ----

app_theme <- bslib::bs_theme(version = bslib::version_default(),
    bg = "#ffffff",
    fg = "#000000",
    primary = "#4E2D53",
    secondary = "#1C8478",
    default = "#474747",
    base_font = "'Source Sans 3', 'Source Sans Pro', 'Helvetica Neue',Helvetica, sans-serif",
    code_font = "'Source Code Pro', monospace",
    heading_font = "'Source Sans 3', 'Source Sans Pro', 'Helvetica Neue',Helvetica, sans-serif"
)

# FUNCTIONS ----

## demonstration_function() ----

#' A function to demonstrate a custom function and associated tests with {testthat}
#' See example tests for demonstration_function() in tests/testthat/test-utils.R
#' @param x Character A character string to append with a message
#' @examples
#' x <- 'My message'
#' demonstration_function(x)
#'
demonstration_function <- function(x) {
    out <- paste('The message is:', x)
    return(out)
}
