library(tibble)
library(hms)

# Create a tibble with all common R data types for testing
test_data <- tibble(
  # Character
  char_col = c("apple", "banana", "cherry", "damson", "elderberry"),

  # Numeric (double)
  numeric_col = c(1.5, 2.7, 3.14, 4.0, 5.9),
  numeric_col_miss = c(1.5, 2.7, 3.14, NA, 5.9),

  # Integer
  integer_col = c(1L, 2L, 3L, 4L, 5L),
  integer_col_miss = c(1L, 2L, 3L, NA, 5L),

  # Logical
  logical_col = c(TRUE, FALSE, TRUE, FALSE, TRUE),
  logical_col_miss = c(TRUE, FALSE, TRUE, NA, TRUE),

  # Factor (unordered)
  factor_col = factor(c("low", "medium", "high", "medium", "low")),
  factor_col_miss = factor(c("low", "medium", "high", NA, "low")),

  # Ordered factor
  ordered_col = ordered(c("small", "medium", "large", "medium", "small"),
                        levels = c("small", "medium", "large")),
  # Ordered factor
  ordered_col_miss = ordered(c("small", "medium", "large", NA, "small"),
                             levels = c("small", "medium", "large")),

  # Date
  date_col = as.Date(c("2034-01-01", "2034-06-15", "2034-12-31", "2033-03-20", "2035-08-10")),

  # POSIXct (datetime)
  datetime_col = as.POSIXct(c("2034-01-01 09:30:00", "2034-06-15 14:45:30",
                              "2034-12-31 23:59:59", "2033-03-20 08:15:22",
                              "2035-08-10 16:20:45")),

  # hms (time only)
  time_col = hms::as_hms(c("09:30:00", "14:45:30", "23:59:59", "08:15:22", "16:20:45")),
  time_col_miss = hms::as_hms(c("09:30:00", "14:45:30", "23:59:59", NA, "16:20:45")),

  # Complex numbers
  # complex_col = c(1+2i, 3+4i, 5+0i, 0+6i, 2-3i),

  # Raw bytes
  # raw_col = as.raw(c(65, 66, 67, 68, 69)),  # A, B, C, D, E in ASCII

  # List column (nested data)
  # list_col = list(
  #   c(1, 2, 3),
  #   c("a", "b"),
  #   c(TRUE, FALSE, TRUE),
  #   NULL,
  #   data.frame(x = 1:2, y = letters[1:2])
  # )
)
