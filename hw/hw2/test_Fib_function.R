source("./Fib.R")


library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)

# The Fibonacci sequence 1, 1, 2, 3, 5, 8, 13, 21…… starts with two 1s, and each term
# afterwards is the sum of its two predecessors. Please write a function, Fib(n), which
# takes n as the input parameter. It will return the n-th number in the Fibonacci
# sequence.
# Fib tests

test_that("zero gets STOP", {
  expect_error(Fib(0))
})


test_that("-1 gets STOP", {
  expect_error(Fib(-1))
})

test_that("1 gets 1", {
  expect <- 1
  actual <- Fib(1)
  expect_equal(actual, expect)
})

test_that("2 gets 1", {
  expect <- 1
  actual <- Fib(2)
  expect_equal(actual, expect)
})

test_that("3 gets 2", {
  expect <- 2
  actual <- Fib(3)
  expect_equal(actual, expect)
})

test_that("4 gets 3", {
  expect <- 3
  actual <- Fib(4)
  expect_equal(actual, expect)
})

test_that("8 gets 21", {
  expect <- 21
  actual <- Fib(8)
  expect_equal(actual, expect)
})

