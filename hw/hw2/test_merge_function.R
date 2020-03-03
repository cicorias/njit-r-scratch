source("./Merge.R")


library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)

test_that("merge s1 s2", {

    s1 <- c(1,3,5,7)
    s2 <- c(2,4,6,10)

    expected <- c(1,2,3,4,5,6,7,10)
    actual <- Merge(s1, s2)

    
    expect_equal(expected, actual)
})


# test_that("unequal lengths throws stop errors", {

#     s1 <- c(1,3,5,7)
#     s2 <- c(2,4,6,8,10)

#     expect_error(Merge(s1, s2))
# })

test_that("merge s1 s2 diff lengths", {

    s1 <- c(1,3,5,7)
    s2 <- c(2,4,6,8, 10)

    expected <- c(1,2,3,4,5,6,7,8, 10)
    actual <- Merge(s1, s2)

    expect_equal(expected, actual)
})

test_that("merge s1 s2 lots of extra in s1", {

    s1 <- c(1,3,5,7, 9, 11, 13, 14)
    s2 <- c(2,4,6,8,10)

    expected <- c(1,2,3,4,5,6,7,8,9,10,11,13,14)
    actual <- Merge(s1, s2)

    expect_equal(expected, actual)
})
