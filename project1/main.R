library(logging)
getLogger()

library(httr)
library(xml2)

# functions that based upon a YEAR parameter -- retrieves
# articles from a pre-determined website.

# Given an input year, yourobjective is to extract all articles
# published in/after that year from your selected journal.
#
# As astartpoint, you are required  to  extract  the
# following 9 fields for each article:
# Title,  Authors,  Author  Affiliations, Correspondence
# Author, Correspondence Author's Email, Publish Date,
# Abstract, Keywords, Full Paper (Text format)

# https://www.ncbi.nlm.nih.gov/pmc/journals/1440/
  #http://xpather.com/

#  http://xpather.com/HLuFhCgv
#  //*[contains(concat( " ", @class, " " ), concat( " ", "issues-cell", " " ))]

## better
# //*[contains(concat( " ", @class, " " ), concat( " ", "iss-cell", " " ))]


get_articles <- function(start_year = 2019) {

  if (start_year < 1998) {
    stop('invalid year - must be 1998 - 2019')
  }

  main_results <- parse_main_page()
  issues <- find_all_issue(main_results)

  parse_all_issues(issues)


  return(0)
}

parse_all_issues <- function(issues) {

  for(i in 1:49) {# length(issues)) {

    ele <- issues[[i]][["a"]]
    print(ele[[4]])
    print(attr(ele, 'href'))
    #ele <- issues[[i]]$a[[4]] 
    #print()
    #attr(d, 'href')
  }

}


find_all_issue <- function(xml_thing) {
  #expecting -- this is output from parse_main_page below
  #> class(ro)
  #[1] "xml_document" "xml_node"

  rv <- xml_find_all(xml_thing, '//*[contains(concat( " ", @class, " " ), concat( " ", "iss-cell", " " ))]')

  #rv <- xml_find_all(xml_thing, '//*[contains(concat( " ", @class, " " ), concat( " ", "arc-issue", " " ))]')
  return(as_list(rv))

}

parse_main_page <- function(uri = "https://www.ncbi.nlm.nih.gov/pmc/journals/1440/" ) {

  r <- GET(uri)

  if (r$status_code != 200) {
    stop(paste('failed to retrieve page: ', uri, '  status_code: ', r['status_code']))
  }

  rv <- content(r, type = 'text/html', encoding = 'UTF-8')
  return(rv)
}










