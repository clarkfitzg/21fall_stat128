# For each of the following questions write code to prove your answer is correct.

# 1
# Review Vectorization
# `log` takes two arguments, x and base.
# Is `log` vectorized in x, base, or both?

# Both


# 2
# R has 5 common atomic types, listed below.
# Order these types from the most specific to the most general based on R's coercion.
# For example, 1L is an integer, and "hi there" is a character vector.
# When we combine them, R coerces the integer to a character vector, which shows that characters are more general than integers.
class(c(1L, "hi there"))

# Ordered:

# TYPE        EXAMPLE
# ------------------------------ 
# logical     FALSE
# integer     2L
# numeric/double     107.3
# complex     1+4i
# character   "hi there"


# 3
# Construct a list containing the following in each position:
#   1. 5 integers
#   2. a character vector with two elements
#   3. a function
#   4. an empty list

list(1:5, c("a", "b"), log, list())

# 4
# Use R to count the number of integers between 1 and 10,000 that are divisible by 13.
# Perform this calculation in three different ways, using these three binary operators: /, %/%, and %%.

floor(10e3/13)
10e3 %/% 13
sum(0 == (seq(10e3) %% 13))

# 5
# Data frames are a class of object in R.
# Are data frames lists?
# What do you think this implies?
# Hint: see is.list

# Data frames are lists
is.list(iris)


# 6
# Preview special values.
# Inf represents positive infinity.
# Verify that Inf behaves consistently with the following mathematical limits as n -> infinity.

# n + 10
# n - 100
# 1/n
# 2*n
# -5*n
# log(n)

# It checks out :)
Inf + 10
Inf - 100
1/Inf
2*Inf
-5*Inf
log(Inf)
