library(logging)
setLevel("DEBUG")

# functions that based upon a YEAR parameter -- retrieves
# articles from a pre-determined website.

# Given an input year, yourobjective is to extract all articles
# published in/after that year from your selected journal.
#
# As astartpoint, you are required  to  extract  the
# following 9fieldsfor each article:
# Title,  Authors,  Author  Affiliations, Correspondence
# Author, Correspondence Author's Email, Publish Date,
# Abstract, Keywords, Full Paper (Text format)


# https://www.gmb.org.br
# years available.

# 1998 - 2019

# root of site: https://www.gmb.org.br/copia-online-version


# https://www.ncbi.nlm.nih.gov/pmc/journals/1440/
  #http://xpather.com/

#  http://xpather.com/HLuFhCgv

#  //*[contains(concat( " ", @class, " " ), concat( " ", "issues-cell", " " ))]

## better

# //*[contains(concat( " ", @class, " " ), concat( " ", "iss-cell", " " ))]




get_articles <- function(start_year = 2019) {

  logdebug(paste("year is: ", start_year))

  if (start_year < 1998) {
    stop('invalid year - must be 1998 - 2019')
  }

  return(0)
}










