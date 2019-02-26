## Caching the inverse of a matrix

## Function that creates a special object matrix to cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set function(y) {
      x <<- y
      inv <<- NULL
      }
      get <- function() x
      setInverse <- function(inverse) inv <<- inverse
      getInverse <- function() inv
      list (set=set
      get=get
      setInverse = setInverse
      getInverse = getInverse)
}

## Function that computes the inverse of the special matrix returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
 inv <- x$getInverse()
      if(!isnull(inv)) {
              message("getting cached data")
              return(inv)
      }
      data <- x$get()
      inv <- solve(data,...)
      x$setInverse(inv)
      inv
}