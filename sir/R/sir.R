# Packages!
# Outcome: Make a package

# 123 GO: What's a package?
# functions you want to reuse.
# Robust way to share code.



# Roxygen2 to GENERATE documentation.

# 123GO: How can I find my docs?
# ?initial_infect

# 123 GO: What's one more piece of documentation that will help us understand
# initial_infect?

#' Create a randomly infected matrix
#'
#' @param num_rows number of rows in grid
#' @param num_cols number of columns in grid
#' @param p_infect probability of infection
#' @export
initial_infect = function(num_rows = 3, num_cols = 5, p_infect = 0.1){
  # TODO: Fix this!
  x = matrix(c(rep(0, 10), rep(1, 5)), nrow = num_rows)

  # Can change the class of x:
  class(x) = c("SIR", class(x))
  x
}

# 123 GO:
# Where should you create the object of class SIR?
# 1. initial_infect function    <--- We're doing this right now.
# 2. iterate function
# 3. in the plotting function
# 4. Somewhere else?

#' @export
plot.SIR = function(x, ...){
  image(t(x), col = c("white", "red", "grey"), ...)
}
