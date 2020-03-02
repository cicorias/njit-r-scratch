library(logging)
getLogger()

count <- function(cause = NULL, file_name = 'homicides.txt') {

  valid_cause <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")

  if ( is.null(cause)) {
    stop('argument for parameter cause is NULL')
  }

  if (  !(cause %in% valid_cause)) {
    stop('invalid cause provided')
  }

  if ( !(file.exists(file_name))) {
    stop('cannot find file: ' + file_name)
  }

  s2 <- CapStr(cause)

  homicides <- readLines(file_name)
  pattern <- paste("[cC]ause:", s2)

  logdebug("pattern is: %s", pattern)

  g <- grep(pattern, homicides, )

  rv <- length(g)
  logdebug("length is %d", rv)
  return(rv)


}


# from https://rstudio-pubs-static.s3.amazonaws.com/408658_512da947714740b99253228f084a08a9.html
CapStr <- function(y) {
  c <- strsplit(y, " ")[[1]]

  c_both = paste("[", tolower(substring(c, 1,1)),
                 toupper(substring(c, 1,1)),
                 "]", substring(c, 2),
                 sep="", collapse=" ")

}

