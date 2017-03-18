## coded by Carl

## Requirements: "For this assignment, assume that the matrix supplied is always invertible."
## solve(X) doesn't work if it's not invertible - I guess

## The first function creates a special "matrix" object that can cache its inverse.
## Like in the given example makeVector it creates a list contatining a function to
## 1. set the value of the matrix, 2. get the value of the matrix, 3. set the value of the inverse, 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        matrixinverse <- NULL
        set <- function(y) {
                x <<- y
                matrixinverse <<- NULL
        }
        get <- function() x
        setmatrixinverse <- function(inverse) matrixinverse <<- inverse
        getmatrixinverse <- function() matrixinverse
        list(set = set,
             get = get,
             setmatrixinverse = setmatrixinverse,
             getmatrixinverse = getmatrixinverse)
}

## The second function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then the cacheSolve function
## should retrieve the inverse from the cache.
## In the output you can see the printed text "getting cached data" if it works.

cacheSolve <- function(x, ...) {
        matrixinverse <- x$getmatrixinverse()
        if(!is.null(matrixinverse)) {
                message("getting cached data")
                return(matrixinverse)
        }
        data <- x$get()
        matrixinverse <- solve(data, ...) ## here the inverse function solve(X) really generates the inverse
        x$setmatrixinverse(matrixinverse)
        matrixinverse
        ## now the function returns a matrix that is the inverse of 'x'
}

#### example input and output for using/testing this R-script
#### @self: don't forget to run the functions (all lines) first
#### this whole example part is more for myself to remember in a few months than the peer who grades my script
### read it and use the inputs (lines with > in front of them) to try it if you like :)
## > x <- rbind(c(4, 6), c(4, -1))
## > testmatrix <- makeCacheMatrix(x)
## > testmatrix$get()
## [,1] [,2]
## [1,]    4    6
## [2,]    4   -1
## > cacheSolve(testmatrix)
## [,1]       [,2]
## [1,] 0.03571429  0.2142857
## [2,] 0.14285714 -0.1428571
## > cacheSolve(testmatrix)
## getting cached data      ## this is the printed message that only comes if matrixinverse is just returned instead of computed freshly
## [,1]       [,2]
## [1,] 0.03571429  0.2142857
## [2,] 0.14285714 -0.1428571