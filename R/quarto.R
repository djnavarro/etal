
#' Create a blank quarto blog post
#'
#' @param slug Slug for the post
#' @param date Date for the post
#' @param projdir Project directory for the blog
#'
#' @return Invisibly returns NULL
#' @export
new_quarto_post <- function(slug,
                            date = as.character(Sys.Date()),
                            projdir = ".") {
  lines <- c(
    '---',
    paste0('title: "', slug, '"'),
    'description: "This is a subtitle"',
    paste0('date: "', date, '"'),
    '--- ',
    '',
    '<!--------------- my typical setup ----------------->',
    '',
    '```{r}',
    '#| label: setup',
    '#| include: false',
    'very_wide <- 500',
    'wide <- 136',
    'narrow <- 76',
    'options(width = narrow)',
    'cache_images <- TRUE',
    'set.seed(1)',
    '```',
    '',
    '<!--------------- post begins here ----------------->',
    ''
  )

  dir <- fs::path(projdir, "posts", paste0(date, "_", slug))
  fs::dir_create(dir)
  brio::write_lines(lines, fs::path(dir, "index.qmd"))
  invisible(NULL)
}
