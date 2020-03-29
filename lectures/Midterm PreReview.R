


geneExpr <- data.frame(gene=LETTERS[1:10],
                       expr1 <- c(2.1, 4.5, 6.8, 7.9, 8.1,5.0, 4.6, 3.2, 3.5, 7.8),
                       expr2 <- c(6.1, 4.2, 2.8, 0.9, 0.1, 3.0, 2.6, 8.2, 3.4, 6.8))



counter <- 0

for (i in 1:length(geneExpr)) {
  if (geneExpr[i,2]<=5){
    print(geneExpr[i,2])
    counter<-counter+1
  }
  else {
    print(geneExpr[i,2])
  }
}


print(counter)



myMin<-function(x, cut) { min(x[x>cut]) }

apply(geneExpr[,-1],2, myMin, cut=4)
