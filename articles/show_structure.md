# Creating Copy-Paste Friendly Table Summaries in R

## The Problem

To get the most helpful answers to analysis questions from AI tools
(like ChatGPT, Claude, Copilot, and Gemini), the tools need to know
about your data but uploading datasets is often problematic or even
illegal. Other summaries like the `skim()` function in the
[skimr](https://docs.ropensci.org/skimr/) package or
[`str()`](https://rdrr.io/r/utils/str.html) from base R will print
potentially sensitive data like character strings or dates. To learn
more about de-identification and protected health information (PHI) in
the United States, visit the Health and Human Services webpage on
De-Identification of PHI at
`https://www.hhs.gov/hipaa/for-professionals/special-topics/de-identification/index.html#rationale`.

## The Solution

It would be useful to have a function that prints a description of
datasets that **excludes** details that are known to be, or are likely
to be, sensitive. For example, dates are protected health information;
free-form text is also problematic. While the output from the function
needs to be checked to make sure there is no sensitive data, it is
useful to have a function that prints variable names, variable types and
the values for categorical data.

To have R print a description of your dataset — for example, for a
dataset named `test_data` — you can first tell R to load the
`Open.Visualization.Academy` package into its thinking memory and then
use the [`show_structure()`](../reference/show_structure.md) function
like this:

``` r
library(Open.Visualization.Academy)
show_structure(test_data)
```

or you can tell R to use the function with only one line, like this:

``` r
Open.Visualization.Academy::show_structure(test_data)
```

The result will look like this:

``` markdown
Table: `test_data` looks like this

|variable         |type               |levels                           |
|:----------------|:------------------|:--------------------------------|
|char_col         |character          |                                 |
|numeric_col      |numeric            |range: [1.5-5.9]                 |
|numeric_col_miss |numeric            |range: [1.5-5.9], NA             |
|integer_col      |integer            |range: [1-5]                     |
|integer_col_miss |integer            |range: [1-5], NA                 |
|logical_col      |logical            |TRUE, FALSE                      |
|logical_col_miss |logical            |TRUE, FALSE, NA                  |
|factor_col       |factor             |high, low, medium                |
|factor_col_miss  |factor             |high, low, medium, NA            |
|ordered_col      |ordered factor     |small, medium, large             |
|ordered_col_miss |ordered factor     |small, medium, large, NA         |
|date_col         |Date               |                                 |
|datetime_col     |datetime           |                                 |
|time_col         |time (hrs:min:sec) |range: [08:15:22 - 23:59:59]     |
|time_col_miss    |time (hrs:min:sec) |range: [09:30:00 - 23:59:59], NA |
✔ Copied to the clipboard!
Remove any sensitive data before pasting and sharing.
Look for: names, dates, locations, phone numbers, IDs, emails, etc.

! Review factor levels for sensitive information:
factor_col, factor_col_miss, ordered_col, ordered_col_miss
```

If your operating system allows you to copy and paste, the report will
be copied automatically onto your clipboard.

The report is designed to not print sensitive data like names (which are
likely character variables) and dates. It will print the names of
categorical factor variables along with their levels. The bottom of the
report lists categorical factor variables which contain text *other*
than:
`"yes", "no", "checked", "unchecked", "TRUE", "FALSE", "male", "female"`.
Carefully check these variables for potentially sensitive information
before pasting the output into any AI tools or sharing with the public.

### Extra option: `display_redacted`

By default, [`show_structure()`](../reference/show_structure.md)
hides/suppresses/redacts character variables, dates, and datetime
variables from the levels column. We prefer this format because it makes
it quicker to review the output. However, if you don’t like to see blank
lines for the redacted data, use the `display_redacted = TRUE` argument
within the [`show_structure()`](../reference/show_structure.md)
function. Setting the value to `TRUE` prints `< redacted strings >` for
variables of type “character”, `< redacted dates >` for date variables,
and `< redacted date-times >` for datetime variables.

For example:

- `display_redacted = TRUE`:

``` markdown
Table: `example_data` looks like this

|variable       |type      |levels                                    |
|:--------------|:---------|:-----------------------------------------|
|mrn            |numeric   |range: [123456790-123456796]              |
|sex            |factor    |Female, Male                              |
|first_name     |character |< redacted strings >                      |
|last_name      |factor    |Balise, Feaster, Grealis, Luo, Maya, Odom |
|city           |factor    |Coral Gables, Dallas, Miami, New York     |
|package_author |factor    |none, other, this                         |
|visit_date     |Date      |< redacted dates >                        |
✔ Copied to the clipboard!
Remove any sensitive data before pasting and sharing.
Look for: names, dates, locations, phone numbers, IDs, emails, etc.

! Review factor levels for sensitive information:
last_name, city, package_author
```

- `display_redacted = FALSE` (default):

``` markdown
Table: `example_data` looks like this

|variable       |type      |levels                                    |
|:--------------|:---------|:-----------------------------------------|
|mrn            |numeric   |range: [123456790-123456796]              |
|sex            |factor    |Female, Male                              |
|first_name     |character |                                          |
|last_name      |factor    |Balise, Feaster, Grealis, Luo, Maya, Odom |
|city           |factor    |Coral Gables, Dallas, Miami, New York     |
|package_author |factor    |none, other, this                         |
|visit_date     |Date      |                                          |
✔ Copied to the clipboard!
Remove any sensitive data before pasting and sharing.
Look for: names, dates, locations, phone numbers, IDs, emails, etc.

! Review factor levels for sensitive information:
last_name, city, package_author
```

Note that [`show_structure()`](../reference/show_structure.md) is not
smart enough to notice that some numeric values, like the medical record
number variable named `mrn`, and factor levels for `last_name` and
`city` may be sensitive. Carefully check the report and remove ***all***
sensitive data before pasting and sharing.

|       mrn | sex    | first_name | last_name | city         | package_author | visit_date |
|----------:|:-------|:-----------|:----------|:-------------|:---------------|:-----------|
| 123456790 | Male   | Kyle       | Grealis   | Dallas       | this           | 2034-01-15 |
| 123456791 | Male   | Raymond    | Balise    | Miami        | this           | 2034-02-20 |
| 123456792 | Female | Lori       | Balise    | Miami        | none           | 2034-02-20 |
| 123456793 | Male   | Danny      | Maya      | Coral Gables | none           | 2034-03-10 |
| 123456794 | Male   | Dan        | Feaster   | Dallas       | none           | 2034-04-05 |
| 123456795 | Male   | Sean       | Luo       | New York     | none           | 2034-05-12 |
| 123456796 | Male   | Gabriel    | Odom      | Miami        | other          | 2034-06-18 |

So, before sharing the report you would want to edit it to show this:

``` markdown
Table: `example_data` looks like this

|variable       |type      |levels                                    |
|:--------------|:---------|:-----------------------------------------|
|mrn            |numeric   |                                          |
|sex            |factor    |Female, Male                              |
|first_name     |character |                                          |
|last_name      |factor    |                                          |
|city           |factor    |                                          |
|package_author |factor    |none, other, this                         |
|visit_date     |Date      |                                          |
```

### What is the example data?

If you are curious, the `test_data` used for the first report above
contains all the types of data you are likely to see. Notice there are
columns that were designed to have no missing data (like `numeric_col`)
and columns that contain missing values (like `numeric_col_miss`).

| char_col   | numeric_col | numeric_col_miss | integer_col | integer_col_miss | logical_col | logical_col_miss | factor_col | factor_col_miss | ordered_col | ordered_col_miss | date_col   | datetime_col        | time_col | time_col_miss |
|:-----------|:------------|:-----------------|:------------|:-----------------|:------------|:-----------------|:-----------|:----------------|:------------|:-----------------|:-----------|:--------------------|:---------|:--------------|
| apple      | 1.5         | 1.5              | 1           | 1                | TRUE        | TRUE             | low        | low             | small       | small            | 2034-01-01 | 2034-01-01 09:30:00 | 09:30:00 | 09:30:00      |
| banana     | 2.7         | 2.7              | 2           | 2                | FALSE       | FALSE            | medium     | medium          | medium      | medium           | 2034-06-15 | 2034-06-15 14:45:30 | 14:45:30 | 14:45:30      |
| cherry     | 3.14        | 3.14             | 3           | 3                | TRUE        | TRUE             | high       | high            | large       | large            | 2034-12-31 | 2034-12-31 23:59:59 | 23:59:59 | 23:59:59      |
| damson     | 4           | NA               | 4           | NA               | FALSE       | NA               | medium     | NA              | medium      | NA               | 2033-03-20 | 2033-03-20 08:15:22 | 08:15:22 | NA            |
| elderberry | 5.9         | 5.9              | 5           | 5                | TRUE        | TRUE             | low        | low             | small       | small            | 2035-08-10 | 2035-08-10 16:20:45 | 16:20:45 | 16:20:45      |
