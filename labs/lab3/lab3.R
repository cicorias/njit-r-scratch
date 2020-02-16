library(logging)
getLogger()

getPi <- function(n = 3, return_as_pi=FALSE) {

  max_iterations <- 1000000
  l_pi_calc <- 0
  real_pi <- 3.1415927
  precision <- n - 1
  target_pi = trunc2(real_pi, prec = precision)

  ic <- 1
  last_op = 1
  denominator = 1

  while( target_pi != trunc2(l_pi_calc, prec = precision)) {
    if (ic == max_iterations) {
      logerror("exiting as we maxed iterations")
      break
    }

    l_pi_calc = l_pi_calc + last_op * (4 / denominator)

    ic <- ic + 1
    denominator = denominator + 2
    last_op = last_op * -1

  }

  rv =  trunc2(l_pi_calc, prec = precision)
  if (return_as_pi) {
    return(rv)
  }
  else {
    return(ic)
  }

}

trunc2 <- function(x, prec = 0) {
  base::trunc(x * 10^prec) / 10^prec
}


