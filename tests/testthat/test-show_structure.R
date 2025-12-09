library(testthat)
library(tibble)
library(hms)
library(knitr)

# Create test data
test_data <- tibble(
  char_col = c("apple", "banana", "cherry", "damson", "elderberry"),
  numeric_col = c(1.5, 2.7, 3.14, 4.0, 5.9),
  numeric_col_miss = c(1.5, 2.7, 3.14, NA, 5.9),
  integer_col = c(1L, 2L, 3L, 4L, 5L),
  integer_col_miss = c(1L, 2L, 3L, NA, 5L),
  logical_col = c(TRUE, FALSE, TRUE, FALSE, TRUE),
  logical_col_miss = c(TRUE, FALSE, TRUE, NA, TRUE),
  factor_col = factor(c("low", "medium", "high", "medium", "low")),
  factor_col_miss = factor(c("low", "medium", "high", NA, "low")),
  ordered_col = ordered(c("small", "medium", "large", "medium", "small"),
                        levels = c("small", "medium", "large")),
  ordered_col_miss = ordered(c("small", "medium", "large", NA, "small"),
                             levels = c("small", "medium", "large")),
  date_col = as.Date(c("2034-01-01", "2034-06-15", "2034-12-31", "2033-03-20", "2035-08-10")),
  datetime_col = as.POSIXct(c("2034-01-01 09:30:00", "2034-06-15 14:45:30",
                              "2034-12-31 23:59:59", "2033-03-20 08:15:22",
                              "2035-08-10 16:20:45")),
  time_col = hms::as_hms(c("09:30:00", "14:45:30", "23:59:59", "08:15:22", "16:20:45")),
  time_col_miss = hms::as_hms(c("09:30:00", "14:45:30", "23:59:59", NA, "16:20:45"))
)

test_that("show_structure prints output without error", {
  expect_no_error(show_structure(test_data))
})

test_that("show_structure output contains dataset name", {
  output <- capture.output(show_structure(test_data))
  # The caption should contain the dataset name
  expect_true(any(grepl("`test_data` looks like this", output)))
})

test_that("show_structure output contains table headers", {
  output <- capture.output(show_structure(test_data))
  output_text <- paste(output, collapse = " ")

  # Check for markdown table headers
  expect_true(grepl("variable", output_text))
  expect_true(grepl("type", output_text))
  expect_true(grepl("levels", output_text))
})

test_that("show_structure correctly identifies character columns", {
  simple_data <- tibble(char_col = c("a", "b", "c"))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("char_col", output_text))
  expect_true(grepl("character", output_text))
})

test_that("show_structure correctly identifies numeric columns", {
  simple_data <- tibble(num_col = c(1.5, 2.7, 3.14))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("num_col", output_text))
  expect_true(grepl("numeric", output_text))
  expect_true(grepl("range: \\[1.5-3.14\\]", output_text))
})

test_that("show_structure correctly identifies numeric columns with NA", {
  simple_data <- tibble(num_col = c(1.5, 2.7, NA))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("numeric", output_text))
  expect_true(grepl("range: \\[1.5-2.7\\], NA", output_text))
})

test_that("show_structure correctly identifies integer columns", {
  simple_data <- tibble(int_col = c(1L, 2L, 3L))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("int_col", output_text))
  expect_true(grepl("integer", output_text))
  expect_true(grepl("range: \\[1-3\\]", output_text))
})

test_that("show_structure correctly identifies integer columns with NA", {
  simple_data <- tibble(int_col = c(1L, 2L, NA))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("integer", output_text))
  expect_true(grepl("range: \\[1-2\\], NA", output_text))
})

test_that("show_structure correctly identifies logical columns", {
  simple_data <- tibble(log_col = c(TRUE, FALSE, TRUE))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("log_col", output_text))
  expect_true(grepl("logical", output_text))
  expect_true(grepl("TRUE", output_text))
  expect_true(grepl("FALSE", output_text))
})

test_that("show_structure correctly identifies logical columns with NA", {
  simple_data <- tibble(log_col = c(TRUE, FALSE, NA))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("logical", output_text))
  expect_true(grepl("TRUE", output_text))
  expect_true(grepl("FALSE", output_text))
  expect_true(grepl("NA", output_text))
})

test_that("show_structure correctly identifies factor columns", {
  simple_data <- tibble(fac_col = factor(c("low", "medium", "high")))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("fac_col", output_text))
  expect_true(grepl("factor", output_text))
  expect_true(grepl("high", output_text))
  expect_true(grepl("low", output_text))
  expect_true(grepl("medium", output_text))
})

test_that("show_structure correctly identifies factor columns with NA", {
  simple_data <- tibble(fac_col = factor(c("low", "medium", NA)))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("factor", output_text))
  expect_true(grepl("NA", output_text))
})

test_that("show_structure correctly identifies ordered factors", {
  simple_data <- tibble(
    ord_col = ordered(c("small", "medium", "large"),
                      levels = c("small", "medium", "large"))
  )
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("ord_col", output_text))
  expect_true(grepl("ordered factor", output_text))
  expect_true(grepl("small", output_text))
  expect_true(grepl("medium", output_text))
  expect_true(grepl("large", output_text))
})

test_that("show_structure correctly identifies ordered factors with NA", {
  simple_data <- tibble(
    ord_col = ordered(c("small", "medium", NA),
                      levels = c("small", "medium", "large"))
  )
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("ordered factor", output_text))
  expect_true(grepl("NA", output_text))
})

test_that("show_structure correctly identifies Date columns", {
  simple_data <- tibble(date_col = as.Date(c("2034-01-01", "2034-12-31")))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("date_col", output_text))
  expect_true(grepl("Date", output_text))
})

test_that("show_structure correctly identifies datetime columns", {
  simple_data <- tibble(dt_col = as.POSIXct("2034-01-01 12:00:00"))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("dt_col", output_text))
  expect_true(grepl("datetime", output_text))
})

test_that("show_structure correctly identifies hms time columns", {
  simple_data <- tibble(time_col = hms::as_hms(c("09:30:00", "14:45:30")))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("time_col", output_text))
  expect_true(grepl("time \\(hrs:min:sec\\)", output_text))
  expect_true(grepl("range:", output_text))
})

test_that("show_structure correctly identifies hms time columns with NA", {
  simple_data <- tibble(time_col = hms::as_hms(c("09:30:00", NA, "14:45:30")))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("time \\(hrs:min:sec\\)", output_text))
  expect_true(grepl("NA", output_text))
})

test_that("show_structure handles all NA numeric columns", {
  simple_data <- tibble(all_na = c(NA_real_, NA_real_, NA_real_))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("all NA", output_text))
})

test_that("show_structure handles all NA time columns", {
  simple_data <- tibble(all_na_time = hms::as_hms(c(NA, NA, NA)))
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("all NA", output_text))
})

test_that("show_structure handles empty data frame", {
  empty_data <- tibble()
  output <- capture.output(show_structure(empty_data))
  output_text <- paste(output, collapse = " ")

  # Should still have headers but no data rows
  expect_true(grepl("variable", output_text))
  expect_true(grepl("type", output_text))
  expect_true(grepl("levels", output_text))
})

test_that("show_structure works with single column data frame", {
  single_col <- tibble(x = 1:5)
  output <- capture.output(show_structure(single_col))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("x", output_text))
  expect_true(grepl("integer", output_text))
  expect_true(grepl("range: \\[1-5\\]", output_text))
})

test_that("show_structure maintains correct order of variables", {
  ordered_data <- tibble(z_col = 1:3, a_col = letters[1:3], m_col = month.name[1:3])
  output <- capture.output(show_structure(ordered_data))
  output_text <- paste(output, collapse = "\n")

  # Check that z_col appears before a_col in the output
  z_pos <- regexpr("z_col", output_text)
  a_pos <- regexpr("a_col", output_text)
  m_pos <- regexpr("m_col", output_text)

  expect_true(z_pos < a_pos)
  expect_true(a_pos < m_pos)
})

test_that("show_structure output is properly formatted markdown", {
  simple_data <- tibble(x = 1:3, y = letters[1:3])
  output <- capture.output(show_structure(simple_data))
  output_text <- paste(output, collapse = "\n")

  # Check for markdown table formatting (pipes)
  expect_true(grepl("\\|", output_text))
  # Check for header separator line
  expect_true(grepl("---", output_text))
})

test_that("show_structure handles data frames with unusual names", {
  # Test with data frame that has a complex name
  `complex-name.data` <- tibble(x = 1:3)
  output <- capture.output(show_structure(`complex-name.data`))
  output_text <- paste(output, collapse = " ")

  expect_true(grepl("`complex-name.data`", output_text))
})
