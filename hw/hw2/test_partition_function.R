source("./Partition.R")

library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)

test_that("pivot at 6", {

    t <- c(1, 5, 3, 7, 9, 6, 4, 2, 10, 8)
    p <- 6

    expected1 <- c(1,5,3,4,2, 6)
    expected2 <- c(7, 9, 10, 8)
    actual <- Partition(6, c(1, 5, 3, 7, 9, 6, 4, 2, 10, 8) )

    # logdebug("actual: %s", actual)
    expect_equal(expected1, actual[[1]])
    expect_equal(expected2, actual[[2]])
})


test_that("1 item vector6", {

    t <- c(9)
    p <- 3

    expect_error(Partition(p, t))
})