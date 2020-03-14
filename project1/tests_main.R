source("./main.R")

library(logging)
#basicConfig(20)
setLevel("DEBUG")

library(testthat)



test_that("year < 1998 gets STOP", {
  expect_error(get_articles(start_year = 0))
})


test_that("year < 1998 gets STOP no parm ID", {
  expect_error(get_articles(0))
})




# test_that("1 gets 1", {
#   expect <- 1
#   actual <- Fib(1)
#   expect_equal(actual, expect)
# })
#
# test_that("2 gets 1", {
#   expect <- 1
#   actual <- Fib(2)
#   expect_equal(actual, expect)
# })
#
# test_that("3 gets 2", {
#   expect <- 2
#   actual <- Fib(3)
#   expect_equal(actual, expect)
# })
#
# test_that("4 gets 3", {
#   expect <- 3
#   actual <- Fib(4)
#   expect_equal(actual, expect)
# })
#
# test_that("8 gets 21", {
#   expect <- 21
#   actual <- Fib(8)
#   expect_equal(actual, expect)
# })
#
# test_that("100 gets 354224848179261915075", {
#   expect <- 354224848179261915075
#   actual <- Fib(100)
#   expect_equal(actual, expect)
# })

