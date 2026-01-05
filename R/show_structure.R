#' @title Print a description of the variables in a dataset
#'
#' @name show_structure
#'
#' @description
#' This function prints the name of a dataset and then details on its variables.
#' Run this, then check the output to make sure it does not show any sensitive
#' information.  If it does not, paste it into your favorite AI's chat box to
#' help it understand the problem you are solving.
#'
#'
#' @param data - The name of an R dataset
#' @param display_redacted - Logical. Option to have empty table cells for character
#'   and date formats (the default) or to display "< redacted strings|dates >" for
#'   charater strings and dates, respectively.
#' @param clipboard - Copy results to clipboard (TRUE by default)
#' 
#' @return A formatted markdown table (via knitr::kable) displaying the
#'   structure of the input dataset. The table contains three columns:
#'   \item{variable}{Column names from the input data}
#'   \item{type}{Data type of each column (e.g., "numeric", "factor", "Date")}
#'   \item{levels}{For factors: comma-separated factor levels;
#'   for numeric/integer: value range; for other types: NA}
#'
#' @import hms
#' @importFrom knitr kable
#'
#' @export
#'
#' @examples
#' show_structure(mtcars)

show_structure <- function(data, display_redacted = FALSE, clipboard = TRUE) {
  # Get the name of the dataset passed to the function
  data_name <- deparse(substitute(data))

  # Initialize vectors to store results
  variables <- character(0)
  types <- character(0)
  levels_info <- character(0)

  # Loop through each column in the data
  for (i in seq_along(data)) {
    col_name <- names(data)[i]
    col_data <- data[[i]]

    variables <- c(variables, col_name)

    if (is.factor(col_data)) {
      type_label <- if (is.ordered(col_data)) "ordered factor" else "factor"
      types <- c(types, type_label)

      # Get factor levels
      factor_levels <- levels(col_data)

      # Check if there are any NA values in the data
      if (any(is.na(col_data))) {
        # Combine levels with NA
        all_values <- c(factor_levels, "NA")
      } else {
        all_values <- factor_levels
      }

      levels_info <- c(levels_info, paste(all_values, collapse = ", "))
    } else if (inherits(col_data, "hms")) {
      type_label <- "time (hrs:min:sec)"
      types <- c(types, "time (hrs:min:sec)")

      # Calculate range for time data
      if (all(is.na(col_data))) {
        levels_info <- c(levels_info, "all NA")
      } else {
        range_vals <- range(col_data, na.rm = TRUE)
        # Convert back to hms objects
        range_hms <- hms::as_hms(range_vals)
        range_text <- paste0(
          "range: [",
          as.character(range_hms[1]),
          " - ",
          as.character(range_hms[2]),
          "]"
        )

        # Add NA if there are any NA values
        if (any(is.na(col_data))) {
          range_text <- paste0(range_text, ", NA")
        }

        levels_info <- c(levels_info, range_text)
      }
  } else if (inherits(col_data, c("POSIXct", "POSIXlt"))) {
      type_label <- "datetime"
      types <- c(types, type_label)
      #levels_info <- c(levels_info, "")
      levels_info <- if (!display_redacted) {
        c(levels_info, "") 
      } else {
        c(levels_info, "< redacted date-times >") 
      }
    } else if (inherits(col_data, "Date")) {
      type_label <- "Date"
      types <- c(types, "Date")
      levels_info <- if (!display_redacted) {
        c(levels_info, "") 
      } else {
        c(levels_info, "< redacted dates >") 
      }
    } else if (is.logical(col_data)) {
      types <- c(types, "logical")

      # Get unique logical values including NA
      unique_vals <- unique(col_data)
      # Convert to character, preserving NA
      unique_chars <- as.character(unique_vals)
      unique_chars[is.na(unique_vals)] <- "NA"

      levels_info <- c(levels_info, paste(unique_chars, collapse = ", "))
    } else if (is.numeric(col_data) | is.integer(col_data)) {
      type_label <- if (is.integer(col_data)) "integer" else "numeric"
      types <- c(types, type_label)

      # Calculate range
      if (all(is.na(col_data))) {
        levels_info <- c(levels_info, "all NA")
      } else {
        range_vals <- range(col_data, na.rm = TRUE)
        range_text <- paste0(
          "range: [",
          format(range_vals[1], nsmall = 0, digits = 3),
          "-",
          format(range_vals[2], nsmall = 0, digits = 3),
          "]"
        )

        # Add NA if there are any NA values
        if (any(is.na(col_data))) {
          range_text <- paste0(range_text, ", NA")
        }

        levels_info <- c(levels_info, range_text)
      }
    } else {
      types <- c(types, class(col_data)[1])
      levels_info <- if (!display_redacted) {
        c(levels_info, "")
      } else {
        c(levels_info, "< redacted strings >")
      }
    }
  }

  # Create the structure data frame
  structure_df <- data.frame(
    variable = variables,
    type = types,
    levels = levels_info,
    stringsAsFactors = FALSE
  )

  # Create the caption and return table with title
  caption <- paste0("`", data_name, "` looks like this")
  x <- knitr::kable(structure_df, format = "markdown", caption = caption)

  print(x)

  #-------------------------------------------------------------------------------
  # Add a warning message for factor columns that may unintentionally
  # be imported as character strings. This could compromise data integrity
  # and expose sensitive information.

  # First check the number of rows in data. Without this, the check() fails one
  # of the unit tests.
  

  if (clipboard == TRUE) {
    write_to_clipboard(x)

    if (nrow(data) > 0) {
      factor_cols <- names(data)[sapply(data, is_dangerous_factor)]
      if (length(factor_cols) > 0) {
        message("")
        cli::cli_alert_warning(
          paste0(
            "Review factor levels for sensitive information:",
            "\n{col_red(paste(factor_cols, collapse = ', '))}"
          )
        )
      }
    }
  }

}


#' Function to check if any of the factor levels contain potentially dangerous words.
#' @details
#' Will return FALSE if no potentially dangerous words are found. If TRUE, then
#' the show_structure function will output a message and list the variables that
#' contain the "dangerous" words.
#' @param thingy The variable to check for no-no words.
#' @noRd
is_dangerous_factor <- function(thingy) {

  safe_words <- c(
    'yes','no', 
    'checked', 'unchecked', 
    'TRUE', 'FALSE',
    'male', 'female'
  )

  if (is.factor(thingy)) {
    if (length(setdiff(tolower(levels(thingy)), tolower(safe_words))) > 0) {
      return(TRUE)
    }
  } 

  return(FALSE)
}
