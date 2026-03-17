
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dphshiny

<!-- badges: start -->

[![Version:
0.1.0](https://img.shields.io/badge/Version-0.1.0-blue)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of dphshiny is to provide shiny app templates by using the New
Project interface in RStudio.

## Installation

You can install the development version of dphshiny from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("peernisse/dphshiny")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dphshiny)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.
