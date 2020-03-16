library(logging)
getLogger()

library('rvest')
library('xml2')
library('stringr')


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


  clean_string <- function(s) {

    str_rv <- "#### COULD NOT CLEAN ####"

    separator = ';'
    crlf = '[\r\n]'
    replacement = ' '

    #try2 ({
      str_rv <- str_replace_all(paste(s, collapse = ';'), '[\r\n]', ' ')
    #})

    return(str_rv)

  }


  rv <- data.frame(
    url = url,
    title = clean_string(title),
    authors =  clean_string(authors),
    author_affiliations = clean_string(author_affiliations),
    correspondence = clean_string(corr_author),
    correspondence_email = clean_string(corr_author_email),
    publish_date = clean_string(publish_date),
    keywords = clean_string(keyword_text),
    abstract  = clean_string(abstract),
    full_text = clean_string(rest_of_text),

    stringsAsFactors=FALSE
  )

  return(rv)

}

try2 <- function(code, silent = FALSE) {
  tryCatch(code, error = function(c) {
    msg <- conditionMessage(c)
    if (!silent) message(c)
    invisible(structure(msg, class = "try-error"))
  })
}
