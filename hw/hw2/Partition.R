library(logging)
getLogger()


Partition <- function(pivot, vect)
{

  pivot_element <- vect[pivot]
  all_other <- vect[-pivot]

  if ( anyNA(pivot_element)) {
    stop("invalid pivot")
  }

  if ( anyNA(all_other)) {
    stop("invalid vector or pivot")
  }
    
  lhs <- all_other[all_other < pivot_element]
  rhs <- all_other[all_other >= pivot_element]
  rv <- list( c(lhs, pivot_element), rhs)

  return(rv)

}

