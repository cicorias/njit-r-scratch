library(logging)
getLogger()

library('rvest')
library('xml2')


get_issue_articles <-function(url = NULL) {

  if (is.null(url)) {
   stop("invalid url provided")
  }

  article_xml <- read_html(url)

  xpath <- '//*[contains(concat( " ", @class, " " ), concat( " ", "links", " " ))]'

  a1_list <- as_list(article_xml %>% html_nodes(xpath=xpath) )

  return(a1_list)
}

find_article_path <- function(articles) {
  # result from find_all_issues is used
  tmp <- lapply(articles,
      function(x)
        paste(nih_site_base, attr(x[["a"]], 'href'), sep = ""))

  rv0 <- unlist(tmp)
  return( rv0 )
}


read_article_page <- function(url = NULL) {
  if (is.null(url)) {
    stop("url not provided")
  }

  a2 <- read_html(url)

  title <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content-title", " " ))]') %>%
          html_text()

  authors <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "affpopup", " " ))]') %>%
          html_text()

  author_affiliations <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "fm-authors-info", " " ))]') %>%
          html_text()

  corr_author <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @id, " " ), concat( " ", "c1", " " ))]') %>%
          html_text()

  corr_author_email <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "oemail", " " ))]') %>%
          html_text()


  publish_date <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "fm-vol-iss-date", " " ))]') %>%
          html_text()

  full_text <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "p p-first-last", " " ))]') %>%
          html_text()

  keyword_text <- a2 %>%
          html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "kwd-text", " " ))]') %>%
          html_text()

  abstract <- full_text[1]
  rest_of_text <- full_text[-1]


  rv <- data.frame(
    url = url,
    title = title,
    authors = paste(authors, collapse = '|'),
    author_affiliations = paste(author_affiliations, collapse = '|'),
    correspondence = paste(corr_author, collapse = '|'),
    correspondence_email = paste(corr_author_email, collapse = '|'),
    publish_date = publish_date,
    abstract = paste(abstract, collapse = '|'),
    full_text = paste(rest_of_text, collapse = '|'),
    keywords = paste(keyword_text, collapse = '|'),
    stringsAsFactors=FALSE
  )

  return(rv)

}
