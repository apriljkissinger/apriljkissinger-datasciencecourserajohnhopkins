## This program will take in a matrix and spit out its inverse.

rm (list =ls())

## makeCacheMatrix are the getter and setter functions that get a matrix m in and then perform the inverse calculation on it, 
## and clears out any inverse that has already been computed in the cache.

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

## cacheSolve executes and returns a matrix that it is the inverse of mat.

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