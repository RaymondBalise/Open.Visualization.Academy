#' Write text to clipboard
#'
#' @name write_to_clipboard
#'
#' @description
#' This copies the output to the clipboard from btw:::write_to_clipboard()
#'
#'
#' @param x text to write
#'
#' @import cli
#' @importFrom clipr clipr_available
#' @importFrom rlang is_interactive
#'
#' @noRd
#' @keywords internal
write_to_clipboard <- function(x) {
  if (!rlang::is_interactive() || !clipr::clipr_available()) {
    if (rlang::is_interactive()) {
      cli::cli_alert_warning(
        "Clipboard is not available, copy the text above.\nCheck for sensitive data before pasting."
      )
    }
    return(invisible(x))
  }

  # nocov start
  tryCatch(
    {
      clipr::write_clip(x)
      cli::cli_alert_success("Copied to the clipboard!\nCheck for sensitive data before pasting.")
    },
    error = function(e) e
  )
  # nocov end

  invisible(x)
}
