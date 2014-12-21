## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {

		inversedM <- NULL
		
		set <- function(y) {
		        x <<- y
				inversedM <<- NULL
		}
		
		get <- function() {
		        x
		}
		
		setInversedM <- function(im){
		        inversedM <<- im
		}
		
		getInversedM <- function() {
		        inversedM
		}
		
		list(set = set, get = get, setInversedM = setInversedM, getInversedM = getInversedM)
}

## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the matrix 
## has not changed), then the cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        inversedM <- x$getInversedM()
		
		if (!is.null(inversedM)) {
		        message("getting cached data")
				return(m)
		}
		
		data <- x$get()
		inversedM <- solve(data, ...)
		x$setInversedM(inversedM)
		inversedM
}
