
# Check if packages installed:

 c("rvest", "xml2") %in% rownames(installed.packages())
 




# Title,  Authors,  Author  Affiliations, Correspondence
# Author, Correspondence Author's Email, Publish Date,
# Abstract, Keywords, Full Paper (Text format)

# https://www.ncbi.nlm.nih.gov/pmc/journals/1440/
  #http://xpather.com/

#  http://xpather.com/HLuFhCgv
#  //*[contains(concat( " ", @class, " " ), concat( " ", "issues-cell", " " ))]

## better
# //*[contains(concat( " ", @class, " " ), concat( " ", "iss-cell", " " ))]






  #rv <- xml_find_all(xml_thing, '//*[contains(concat( " ", @class, " " ), concat( " ", "arc-issue", " " ))]')

# h1 <- rvest::html("https://www.ncbi.nlm.nih.gov/pmc/journals/1440/")
  #  h1 %>% html_nodes("a.arc-issue") %>% html_text()





  parse_all_issues <- function(issues, start_year) {

  #tmp <- lapply(issues, function(x) c(x[["a"]][[4]], attr(x[["a"]], 'href') ))
  tmp <- lapply(issues, function(x) if(grepl(start_year, x)) attr(x[["a"]], 'href'))
  #tmp <- lapply(issues, function(x) attr(x[["a"]], 'href') )
  #rv <- tmp[grepl(start_year, tmp)]
  rv <- unlist(tmp)
  return(rv)

}