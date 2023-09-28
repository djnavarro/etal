

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

#' Switch to a new folder using its nickname
#'
#' @param name Nickname used to refer to the folder
#' @param folders Named vector of folder paths
#' @param new_session Should a new session be started? (default = TRUE)
#'
#' @return Path to the folder
#' @export
use_folder <- function(id,
                       folders = getOption("etal.folders"),
                       new_session = TRUE) {

  if(!is.character(folders) | is.null(names(folders))) {
    stop("`folders` must be a named character vector", call. = FALSE)
  }
  if(!is.character(id) | length(id) != 1) {
    stop("`id` must be a single string", call. = FALSE)
  }
  if(!utils::hasName(folders, id)) {
    stop("`id` must exist as a name in `folders`", call. = FALSE)
  }
  if(!is.logical(new_session) | length(new_session) != 1) {
    stop("`new_session` must be a single logical value", call. = FALSE)
  }

  dir <- folders[id]

  if(!dir.exists(dir)) {
    stop(paste0("directory \"", dir, "\" does not exist"), call. = FALSE)
  }

  if (!new_session) return(setwd(dir))
  rstudioapi::restartSession(command = paste0("setwd(\"", dir, "\")"))
}
