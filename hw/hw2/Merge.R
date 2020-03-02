library(logging)
getLogger()
# https://subscription.packtpub.com/book/application_development/9781786465153/5/ch05lvl1sec33/merge-sort

Merge <- function(s1, s2) {

    # if (length(s1) != length(s2)) {
    #     stop("vectors are not of equal length")
    # }

    # length_l <- length(s1)
    # length_r <- length(s2)

    rv <- c()

    # lhs <- 1
    # rhs <- 1
    while(length(s1) > 0 && length(s2) > 0) {
      if(s1[1] <= s2[1]) { 
        rv <- c(rv, s1[1]) 
        s1 <- s1[-1] 
      } else { 
        rv <- c(rv, s2[1]) 
        s2 <- s2[-1] 
      } 
    }

    if(length(s1) > 0) rv <- c(rv, s1) 
    if(length(s2) > 0) rv <- c(rv, s2) 

    print(rv)
    return( rv ) #c(1,2,3,4,5,6,7,10)
}
