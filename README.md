
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rcalpuff

<!-- badges: start -->

[![R-CMD-check](https://github.com/maxbre/rcalpuff/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/maxbre/rcalpuff/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

A collection of my handy R functions for post-processing the output of
Calpuff modeling system.

Beware: all the material must be considered experimental, in full
development, not yet tested.

Caveat emptor: use it at your own risk.

### Installation

You can install the development version of the package ‘rcalpuff’ from
the repository at [GitHub](https://github.com/maxbre/rcalpuff/) with:

``` r
if(!require("devtools")) install.packages("devtools")
devtools::install_github("maxbre/rcalpuff")
```

### Pay attention!

This package is dependent by some functions provided by another package
(of mine), that needs to be installed first!

So, here again, it goes like:

``` r
if(!require("devtools")) install.packages("devtools")
devtools::install_github("maxbre/rfunctions")
```
