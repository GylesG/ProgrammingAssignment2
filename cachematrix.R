## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creates a list of four functions which share a parent environment which has a matrix in a variable
## The four functions respectively set and retrieve (get) the matrix data and set (calculate) or retrieve (get)
## the inverse of the matrix. The two set functions use the <<- operator to fix the values of the matrix and 
## the calculated inverse matrix in the enviromnment which is the parent environment for the functions it is 
## defining and which will be used in casheSolve.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## This function asks the list produced by the previous function to return the inverse of the matrix which 
## is the data element of the list. Only a single argument for solve() is allowed as this is the usage that 
## produces an inverse as the output. 

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
            message("getting cached data")
            return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}

