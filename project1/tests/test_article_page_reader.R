source('../article_page_reader.R')

library(logging)
getLogger()



test_that("read issue article page", {
  arts <- get_issue_articles()
  expect_equal(21, length(arts))
})


test_that("find art path", {
  arts <- get_issue_articles()

  p2 <- find_article_path(arts)
  expect_equal(21, length(p2))
  print(p2)

})