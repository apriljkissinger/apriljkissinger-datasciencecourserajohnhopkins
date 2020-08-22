add2 <- function(x,y) {
  x+y
}

above10 <- function(x){
  use <- x>10
  x[use]
}

above <- function(x,n =12) {
  use <- x > n
  x[use]
}

##takes a dataframe or matrix and calculates the mean of each column
columnmean <- function(y){
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc){
    mean[nc] <- mean(y[,i])
  }
  means  ##returns vector of means
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}