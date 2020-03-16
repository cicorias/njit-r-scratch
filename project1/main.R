# Main entry point for script.

## Run with just a 4 digit year as a parameter, and file



# a precheck on required packages outside normal R core
needed_packages <- c("logging", "xml2", "httr", "rvest", "stringr")
packages_installed <- needed_packages %in% rownames(installed.packages())

if (!all(packages_installed))
  stop(paste('missing some needed packages check if all installed: ', paste(needed_packages,packages_installed, collapse = ';')))


library(logging)
getLogger()

library(httr)
library(xml2)

source('issue_page_reader.R')
source('article_page_reader.R')

nih_site_base <- "https://www.ncbi.nlm.nih.gov"
nih_site_url <- "https://www.ncbi.nlm.nih.gov/pmc/journals/1440/"




retrieve_all_content <- function(year = NULL, file_path = './articles.csv') {
  if (is.null(year)) {
    stop("invalid year")
  }

  if (year < 1998 || year > 2019) {
    stop('invalid year - must be 1998 - 2019')
  }

  issues <- get_issues(year)

  rv <- data.frame(url     = character(),
                   title   = character(),
                   authors = character(),
                   author_affiliations = character(),
                   correspondence = character(),
                   correspondence_email = character(),
                   publish_date = character(),
                   full_text = character(),
                   keywords  = character(),
                   stringsAsFactors=FALSE)


  max_items <- 5
  ctr <- 0

  for (i in 1:length(issues)) {
    current_url <- issues[i]
    issue_articles <- get_issue_articles(url = current_url)

    azzz <- find_article_path(issue_articles)

    for(a in 1:length(azzz)) {
      df1 <- read_article_page(url = azzz[a])

      rv <- rbind(rv, df1)

      #if (ctr > max_items) break
      ctr <- ctr + 1
    }

  }


  if (!is.null(file_path)) {
    write.table(rv, file_path, row.names = FALSE, sep = '|')
  }

  return(rv)

}

