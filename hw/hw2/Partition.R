library(logging)
getLogger()



Parition <- function(pivot, vect) {
  s1 <- vect[vect <= pivot]
  s2 <- vect[vect > pivot]

  return(list(s1, s2))
}

#naive non idiomatic R implementation
Partition1 <- function(pivot, vect) {
  
  s1 <- c()
  s2 <- c()
  
  for(i in 1:length(vect)) {
    logdebug("i is: %s", i)
    logdebug("vect[i]: %s", vect[i])
    if (vect[i] <= pivot) {
      s1 <- c(s1, c(vect[i]))
    }
    else {
      s2 <- c(s2, c(vect[i]))
    }
  }


  logdebug("s1: %s", s1)
  logdebug("s2: %s", s2)
  rv <- list(s1, s2)
  return(rv)
}

