library(logging)
getLogger()

Fib <- function(x) {

  if (x < 1) {
    stop("x value must be integer, or greater than equal to 1")
  }

  if (x <= 2) return(1)

  rv <- Fib(x - 1) + Fib(x - 2)
  return(rv)
}