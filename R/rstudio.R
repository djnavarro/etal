

#' Switch between RStudio themes using options
#'
#' @return As \code{rstudioapi::applyTheme()}
#' @export
#' @rdname rstudiothemes
rstudio_dark <- function() {
  rstudioapi::applyTheme(name = getOption("etal.theme.dark"))
}

#' @export
#' @name rstudiothemes
rstudio_light <- function() {
  rstudioapi::applyTheme(name = getOption("etal.theme.light"))
}

#' @export
#' @name rstudiothemes
rstudio_bright <- function() {
  rstudioapi::applyTheme(name = getOption("etal.theme.bright"))
}


#' Switch to the sink project
#'
#' @return As \code{rstudioapi::openProject()}
#' @export
use_sink_project <- function() {
  rstudioapi::openProject(getOption("etal.sink.project"))
}
