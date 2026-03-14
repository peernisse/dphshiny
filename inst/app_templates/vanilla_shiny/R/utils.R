# Utility functions for shiny app
# We suggest using multiple files for your custom functions
# but at a minumum put custom functions here

# See example tests for demonstration_function() in tests/testthat/test-utils.R

# CONSTANTS ----

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
