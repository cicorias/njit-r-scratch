library(logging)
getLogger()


# more efficient using memoization
Fib <- function(x) {

  if (x < 1) {
    stop("x value must be integer, or greater than equal to 1")
  }
  mem <- c()
  for(i in 1:x) {
    if (i == 0) {
      mem[i] <- 0
    }
    else if (i <= 2) {
      mem[i] = 1
    }
    else {
      mem[i] = mem[i - 1] + mem[i - 2]
    }
  }

  return(mem[x])
}


Fib2 <- function(x) {

  #horribly ineficient - dynamic programming would be better
  if (x < 1) {
    stop("x value must be integer, or greater than equal to 1")
  }

  if (x <= 2) return(1)

  rv <- Fib(x - 1) + Fib(x - 2)
  return(rv)
}