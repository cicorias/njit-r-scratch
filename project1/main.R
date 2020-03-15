library(logging)
getLogger()

library(httr)
library(xml2)

nih_site_base <- "https://www.ncbi.nlm.nih.gov"
nih_site_url <- "https://www.ncbi.nlm.nih.gov/pmc/journals/1440/"

# entry point for script / program
get_articles <- function(start_year = 2019) {
  # top level entry point
  if (start_year < 1998) {
    stop('invalid year - must be 1998 - 2019')
  }

  main_results <- parse_main_page()
  issues <- find_all_issue(main_results)

  issues_to_scrape <- find_issue_path(issues, start_year)

  return(issues_to_scrape)
}

find_issue_path <- function(issues, start_year) {
  # result from find_all_issues is used
  tmp <- lapply(issues,
      function(x)
        if(grepl(start_year, x)) paste(nih_site_base, attr(x[["a"]], 'href'), sep = "") )

  rv0 <- unlist(tmp)
  return( rv0 )
}


find_all_issue <- function(xml_thing) {
  # result from parse_main_page is used.
  rv <- xml_find_all(xml_thing, '//*[contains(concat( " ", @class, " " ), concat( " ", "iss-cell", " " ))]')
  return(as_list(rv))
}

parse_main_page <- function(uri = nih_site_url ) {

  r <- GET(uri)

  if (r$status_code != 200) {
    stop(paste('failed to retrieve page: ', uri, '  status_code: ', r['status_code']))
  }

  rv <- content(r, type = 'text/html', encoding = 'UTF-8')
  return(rv)
}










