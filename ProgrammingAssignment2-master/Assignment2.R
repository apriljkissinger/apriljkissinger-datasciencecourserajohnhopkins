rm (list =ls())

makeCacheMatrix <- function(mat = matrix()){
       inv <- NULL
       set <- function(y) {
               mat <<- y
               inv <<- NULL
       }
       get <- function() mat
       setinv <- function (solve) inv <<- solve
       getinv <- function () inv
       list(set = set, get = get, setinv = setinv, getinv = getinv )
}

## Returns a matrix that it is the inverse of mat.

cacheSolve <- function(mat, ...) {
        inv <- mat$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- mat$get()
        inv <- solve(data, ...)
        mat$setinv(inv)
        inv
}





# Write the following functions:
#         
# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

# If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve 
# the inverse from the cache.
# Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible 
# matrix,then solve(X) returns its inverse.