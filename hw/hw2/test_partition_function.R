source("./Partition.R")


library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)


# One of the most important algorithms is the quick sort, which is based on the quick
# sort partition. Here we implement a simple version of the partition function. Please
# write a function, Partition(pivot, vect), which takes two parameters. The function
# partitions the sequence, vect, into two parts (part1 <= pivot; part2 > pivot) based on
# the pivot. For example,
# Pivot = 6;
# Vect = c(1, 5, 3, 7, 9, 6, 4, 2, 10, 8);
# List = Partition(Pivot, Vect);
# List[[1]] is c(1,5,3,4,2, 6) and List[[2]] is c(7, 9, 10, 8).
# Note that Partition returns a list.
