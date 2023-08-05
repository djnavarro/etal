
#' Quit R without asking to save
#'
#' Equivalent to base::q() but with more convenient defaults
#'
#' @param save Character string indicating whether the workspace should be saved
#'   (one of "no", "yes", "ask" or "default")
#' @param status Error status to be returned to the operating system, where
#'   relevant. Conventionally 0 indicates successful completion.
#' @param runLast Should .Last() be executed?
#'
#' @return Same as \code{q()}.
#' @export
exit <- function(save = "no", status = 0, runLast = TRUE) {
  q(save, status, runLast)
}


#' Clear the console
#'
#' This can be handy to suppress messages at startup even when R has been
#' started without the --quiet flag
#'
#' @return Invisibly returns NULL
#' @export
clear_console <- function() {
  system2("clear")
  cat("\014")
  invisible(NULL)
}


#' Concisely report session status information
#'
#' @return Invisibly returns NULL
#' @export
session_status <- function() {
  cli::cli_alert(R.version.string)
  cli::cli_alert(paste("Running under", utils::osVersion))
  cli::cli_alert(paste("System time is", as.character(Sys.time())))
  invisible(NULL)
}

#' Print a rainbow banner to the console
#'
#' @return Invisibly returns NULL
#' @export
rainbow_banner <- function() {
  shades <- c("#e50000", "#ff8d00", "#ffee00", "#028121", "#004cff", "#770088")
  styles <- lapply(shades, cli::make_ansi_style)
  lapply(styles, function(style_fun) {
    cat(style_fun(paste0(rep("\u2583", 6), collapse = "")))
  })
  invisible(NULL)
}


