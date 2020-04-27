## Put comments here that give an overall description of what your
## functions do

## This is a description of the function
rm (list =ls())

makeCacheMatrix <- function(x = matrix()){
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function (solve) m <<- solve
        getinv <- function () m
        list(set = set, get = get, setinv = setinv, getinv = getinv )
}

## Returns a matrix that it is the inverse of mat.

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}