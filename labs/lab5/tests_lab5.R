source("./count.R")
source("./agecount.R")

library(logging)
basicConfig(20)
setLevel("DEBUG")

library(testthat)

#agecount test

test_that("agecount 17 year olds", {
  expect <- 37
  actual <- agecount(age = 17, file_name = 'homicides.txt')
  expect_equal(actual, expect)
})

test_that("agecount 20 year olds", {
  expect <- 58
  actual <- agecount(age = 20, file_name = 'homicides.txt')
  expect_equal(actual, expect)
})



test_that("null throws error", {
  expect_error(agecount())
})

test_that("null throws error", {
  expect_error(agecount(age = NULL))
})


test_that("invalid file", {
  expect_error(agecount(age = 17, file_name = 'foobar.txt'))
})


#count tests
test_that("null throws error", {
  expect_error(count())
})

test_that("null throws error", {
  expect_error(count(cause = NULL))
})


test_that("invalid file", {
  expect_error(count(cause = 'other', file_name = 'foobar.txt'))
})

test_that("count 'shooting' causes", {
  expect <- 1003
  actual <- count(cause = 'shooting', file_name = 'homicides.txt')
  expect_equal(actual, expect)
})

test_that("count 'other' causes", {
  expect <- 6
  actual <- count(cause = 'other', file_name = 'homicides.txt')
  expect_equal(actual, expect)
})

test_that("count 'unknown' causes", {
  expect <- 10
  actual <- count(cause = 'unknown', file_name = 'homicides.txt')
  expect_equal(actual, expect)
})
