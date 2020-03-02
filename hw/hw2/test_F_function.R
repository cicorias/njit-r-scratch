source("./hw1_functions.R")


library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)

# F tests

test_that("zero gets 5", {
  expect <- 5
  actual <- F(0)
  expect_equal(actual, expect)
})

test_that("1 gets 2", {
  expect <- 2
  actual <- F(1)
  expect_equal(actual, expect)
})


test_that("2 gets 5", {
  expect <- 5
  actual <- F(2)
  expect_equal(actual, expect)
})


test_that("3 gets 5/8", {
  expect <- 5/8
  actual <- F(3)
  expect_equal(actual, expect)
})
















# test_that("stub", {
#   expect <- 37
#   actual <- agecount(age = 17, file_name = 'homicides.txt')
#   expect_equal(actual, expect)
# })
