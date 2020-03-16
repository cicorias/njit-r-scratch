library(logging)
getLogger()

library(httr)
library(xml2)

source('issue_page_reader.R')
source('article_page_reader.R')

nih_site_base <- "https://www.ncbi.nlm.nih.gov"
nih_site_url <- "https://www.ncbi.nlm.nih.gov/pmc/journals/1440/"




retrieve_all_content <- function(year = NULL) {
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

  for (i in 1:length(issues)) {
    current_url <- issues[1]
    issue_articles <- get_issue_articles(url = current_url)

    azzz <- find_article_path(issue_articles)

    for(a in 1:length(azzz)) {
      #print(azzz[a])
      df1 <- read_article_page(url = azzz[a])

      #print(df1)

      rv <- rbind(rv, df1)
      #rv <- df1

      #break
      #write.csv2(df1, file = 'foobar.csv', append = T)
      # using rbind instead?
      #merge(rv, df1)
    }
    #break
  }


  return(rv)


}

