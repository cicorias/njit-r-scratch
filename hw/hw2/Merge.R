library(logging)
getLogger()

Merge <- function(s1, s2) {
  # if (length(s1) != length(s2)) {
  #     stop("vectors are not of equal length")
  # }

  ctr <- 0
  # make some large max ctr for circuit breaking
  max_loop <- (length(s1) + length(s2)) * 2
  lhs <- rhs <- 1
  lhs_length <- length(s1)
  rhs_length <- length(s2)

  rv <- c()

  repeat {
    if (s1[lhs] <= s2[rhs]) {
      rv <- c(rv, s1[lhs])
      lhs <- lhs + 1
    }
    else {
      rv <- c(rv, s2[rhs])
      rhs <- rhs + 1
    }

    if (lhs > lhs_length || rhs > rhs_length){
      # we have ran out on either lhs or rhs
      break
    }

    #circuit breaker
    ctr <- ctr + 1
    if (ctr > max_loop) break
  }


  logdebug("lhs: %d   lhs_length: %s", lhs, lhs_length)
  logdebug("rhs: %d   rhs_length: %s", rhs, rhs_length)

  # lingering items in LHS (s1)
  if(lhs <= lhs_length) {
    logdebug("draining lhs: %s", s1[lhs:lhs_length])
    rv <- c(rv, s1[lhs:lhs_length])
  }


  # lingering items in RHS (s2)
  if(rhs <= rhs_length) {
    logdebug("draining rhs: %s", s2[rhs:rhs_length])
    rv <- c(rv, s2[rhs:rhs_length])
  }

  logdebug("final thing %s", rv)

  return(rv)


}
