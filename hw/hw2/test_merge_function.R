source("./hw1_functions.R")


library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)

# The merge operation plays an important role in merge sort algorithm. Suppose you
# have two sorted sequences S1 and S2, merge operation will combine these two
# sequences into a single ordered sequence. Please write a function, Merge(S1, S2),
# which accepts two ordered vectors S1 and S2 as parameters. It will return a single
# ordered sequence. For example,
# S1 = c(1,3,5,7);
# S2=c(2,4,6,10);
# Merge(S1, S2) will return c(1,2,3,4,5,6,7,10)
# Testing commands: Merge(seq(1, 50, by=3), seq(2, 30, by=2)