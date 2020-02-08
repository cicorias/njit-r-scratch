

get_last_row <- function(x) {
  number_rows <- nrow(x)
  number_cols <-  length(x)
  rv <- list("number_rows" = number_rows, "number_columns" = number_cols)
  return(rv)
}



get_last_value <- function(x) {
  number_rows <- nrow(x)
  number_cols <-  length(x)
  rv <- x[number_rows, number_cols]
  return(rv)
}
