library(logging)
getLogger()

agecount <- function(age = NULL, file_name = 'homicides.txt') {

  if ( is.null(age)) {
    stop('argument for parameter age is NULL')
  }

  if ( !(file.exists(file_name))) {
    stop('cannot find file: ' + file_name)
  }

  homicides <- readLines(file_name)

  pattern <- "([0-9]+) years old</dd>"

  r <- regexec(pattern, homicides)
  m <-regmatches(homicides, r)

  ages <- sapply(m, function(x) x[2])

  f <- ages[ !is.na(ages) & ages == age]
  return(length(f))

}
