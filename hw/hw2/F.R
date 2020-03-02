library(logging)
getLogger()

F <- function(x) {

  if (x < 1) {
    rv <- 5 / (x - 1)^2
    return(rv)
  }

  if (x == 1) {
    return(2)
  }

  if (x > 1) {
    rv <- 5 / (x - 1)^3
    return(rv)
  }


}
