## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        matrixinverse <- NULL
        set <- function(y) {
                x <<- y
                matrixinverse <<- NULL
        }
        get <- function() x
        setmatrixinverse <- function(inverse) matrixinverse <<- mean
        getmatrixinverse <- function() matrixinverse
        list(set = set,
             get = get,
             setmatrixinverse = setmatrixinverse,
             getmatrixinverse = getmatrixinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
