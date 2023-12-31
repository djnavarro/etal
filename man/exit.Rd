% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io.R
\name{exit}
\alias{exit}
\title{Quit R without asking to save}
\usage{
exit(save = "no", status = 0, runLast = TRUE)
}
\arguments{
\item{save}{Character string indicating whether the workspace should be saved
(one of "no", "yes", "ask" or "default")}

\item{status}{Error status to be returned to the operating system, where
relevant. Conventionally 0 indicates successful completion.}

\item{runLast}{Should .Last() be executed?}
}
\value{
Same as \code{q()}.
}
\description{
Equivalent to base::q() but with more convenient defaults
}
