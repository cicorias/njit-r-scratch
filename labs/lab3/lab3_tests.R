source("./lab3.R")
library(logging)
basicConfig(20)
#setLevel("DEBUG")

library(testthat)

l_pi <- 3.141593


test_that("1 match", {
  expected <- 3.00

  actual <- getPi(n = 1, return_as_pi = TRUE)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})

test_that("2 match", {
  expected <- 3.1

  actual <- getPi(n = 2, return_as_pi = TRUE)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})


test_that("3 match", {
  expected <- 3.14

  actual <- getPi(n = 3, return_as_pi = TRUE)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})

test_that("4 match", {
  expected <- 3.141

  actual <- getPi(n = 4, return_as_pi = TRUE)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})


test_that("5 match", {
  expected <- 3.1415

  actual <- getPi(n = 5, return_as_pi = TRUE)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})

test_that("6 match", {
  expected <- 3.14159

  actual <- getPi(n = 6, return_as_pi = TRUE)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})



test_that("1 match terms?", {
  expected <- 4

  actual <- getPi(n = 1)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})

test_that("2 match terns", {
  expected <- 20

  actual <- getPi(n = 2)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})


test_that("3 match terms", {
  expected <- 120

  actual <- getPi(n = 3)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})

test_that("4 match terms", {
  expected <- 1689

  actual <- getPi(n = 4)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})


test_that("5 match terms", {
  expected <- 10795

  actual <- getPi(n = 5)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})

test_that("6 match terms", {
  expected <- 136122

  actual <- getPi(n = 6)

  logdebug("expecting %s  and actual %s", expected, actual)
  expect_equal(expected, actual)

})
