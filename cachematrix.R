## This program is to put long processing functions into cache, so that it can be retreived during the processing
## Two founctions are created makeCacheMatrix to make and set values and cacheSolve function solves the inverse and saves it in cache

## makeCacheMatrix passes the matrix and retrieves the inverse of the matrix from the cache. If there is not inverse for the
## matrix in cache it returns a NULL

makeCacheMatrix <- function(x = matrix()) {


	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
		}
	get <- function()x
	setInv <- function(solve) i <<- solve
	getInv <- function() i
	list(set = set, get = get, 
	setInv = setInv,
	getInv = getInv)


}




## cacheSolve function is calculating the inverse of the matrix
## setting the value with the setInv method and returning the value with the getInv method


cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
	 i <- x$getInv()
	 if (!is.null(i)){
		message("getting cached data")
		return(i)
		}
	data <-x$get()
	i <- solve(data)
	x$setInv(i)
	i
}
