


count <- 0
z <- while(count < 10) {
  print(count)
  count <- count + 1
}



f <- function(num) {
  hello <- "Hello, world!\n"
  for(i in seq_len(num)) {
      cat(hello)
    }
  chars <- nchar(hello) * num
  #chars
}
