
# set the RNG tracker:
# https://www.jottr.org/2020/09/21/detect-when-the-random-number-generator-was-used/


#' Set RNG tracker
#'
#' @return Something
#' @export
set_rng_tracker <- function() {
  invisible(addTaskCallback(local({
    last <- .GlobalEnv$.Random.seed
    function(...) {
      curr <- .GlobalEnv$.Random.seed
      if (!identical(curr, last)) {
        message("TRACKER: .Random.seed changed")
        last <<- curr
      }
      TRUE
    }
  }), name = "RNG tracker"))
}


