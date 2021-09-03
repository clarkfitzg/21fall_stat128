# For each of the following questions write code to prove your answer is correct.

# Review Vectorization
# `log` takes two arguments, x and base.
# Which of these arguments is `log` vectorized in?


# R has 5 common atomic types, listed below.
# Order these types from the most specific to the most general based on R's coercion.
# For example, 1L is an integer, and "hi there" is a character vector.
# When we combine them, R coerces the integer to a character vector, which shows that characters are more general than integers.
class(c(1L, "hi there"))

# TYPE        EXAMPLE
# ------------------------------ 
# character   "hi there"
# complex     1+4i
# integer     2L
# logical     FALSE
# numeric/double     107.3


# Construct a list containing the following in each position:
#   1. 5 integers
#   2. a character vector with two elements
#   3. a function
#   4. an empty list


# Use R to count the number of integers between 1 and 10,000 that are divisible by 13.
# Perform this calculation in three different ways, using these three binary operators: /, %/%, and %%.


# Data frames are a class of object in R.
# Are data frames lists?
# What do you think this implies?
# Hint: see is.list


# Preview special values.
# Inf represents positive infinity.
# Verify that Inf behaves consistently with the following mathematical limits as n -> infinity.

# n + 10
# n - 100
# 1/n
# 2*n
# -5*n
# log(n)
