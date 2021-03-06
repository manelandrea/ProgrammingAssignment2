##Caching the Inverse of a Matrix
##R functions  that cache the inverse of a matrix.

##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
 c<- NULL
  set <- function(y) {
    x <<- y
    c <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) c<<- inverse
  getInverse <- function()c
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


##cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), 
##then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
  
}
