source("../main.R")

library(logging)
basicConfig(level = 10)
#setLevel("DEBUG")

library(testthat)

test_that("year < 1998 gets STOP", {
  expect_error(get_articles(start_year = 0))
})


test_that("year < 1998 gets STOP no parm ID", {
  expect_error(get_articles(0))
})

test_that("invalid page not 200", {
  expect_error(parse_main_page('https://httpstat.us/404'))
})

test_that("test main page", {
  r <- parse_main_page()
  expect_equal(length(r), 2)
})

test_that("get all issues", {
  s1 <- parse_main_page()
  s2 <- find_all_issue(s1)

  expect_gte(length(s2), 49)

  #result <- evaluate_promise(parse_all_issues(s2, 2010), print = TRUE)
  #print(result$message)
  #print(result$output)

  issues_to_scrape <- find_issue_path(s2, 2010)
  #print(issues_to_scrape)
  expect_equal(length(issues_to_scrape), 4)

})
