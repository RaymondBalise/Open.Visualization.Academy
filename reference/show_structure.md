# Print a description of the variables in a dataset

This function prints the name of a dataset and then details on its
variables. Run this, then check the output to make sure it does not show
any sensitive information. If it does not, paste it into your favorite
AI's chat box to help it understand the problem you are solving.

## Usage

``` r
show_structure(data, display_redacted = FALSE, clipboard = TRUE)
```

## Arguments

- data:

  - The name of an R dataset

- display_redacted:

  - Logical. Option to have empty table cells for character and date
    formats (the default) or to display "\< redacted strings\|dates \>"
    for charater strings and dates, respectively.

- clipboard:

  - Copy results to clipboard (TRUE by default)

## Value

A formatted markdown table (via knitr::kable) displaying the structure
of the input dataset. The table contains three columns:

- variable:

  Column names from the input data

- type:

  Data type of each column (e.g., "numeric", "factor", "Date")

- levels:

  For factors: comma-separated factor levels; for numeric/integer: value
  range; for other types: NA

## Examples

``` r
show_structure(mtcars)
#> 
#> 
#> Table: `mtcars` looks like this
#> 
#> |variable |type    |levels             |
#> |:--------|:-------|:------------------|
#> |mpg      |numeric |range: [10.4-33.9] |
#> |cyl      |numeric |range: [4-8]       |
#> |disp     |numeric |range: [71.1-472]  |
#> |hp       |numeric |range: [52-335]    |
#> |drat     |numeric |range: [2.76-4.93] |
#> |wt       |numeric |range: [1.51-5.42] |
#> |qsec     |numeric |range: [14.5-22.9] |
#> |vs       |numeric |range: [0-1]       |
#> |am       |numeric |range: [0-1]       |
#> |gear     |numeric |range: [3-5]       |
#> |carb     |numeric |range: [1-8]       |
```
