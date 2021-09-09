# Announcements:
#
# 1. Planning to announce first project next week
# 2. Demo using MS Teams

# Plan today:
# - Goal: interactive lecture
# - type along
# - everyone speaks
# - ground rules: what are some good and bad examples?

# Outcomes:
#   
# 1. Describe the use cases for special values NA, NaN, NULL, and Inf
# 2. Test for the presence of special values
# 3. Use matrices and factors

# Missing values come up all the time in statistics.
# R's ability to handle missing values well is one of it's greatest features.

# NA represents a missing value, meaning you don't know what it is.
# Vectors can have missing values anywhere.


# Q: If all you know about x is that it's missing,
#   then what do you know about x + 1?

# The missing value is CONTAGIOUS.

# Take 1 million numbers, and one NA


# Q: Can you calculate sum(x), if just 1 value is missing?


# Q: what's the meaning of rm in na.rm?

# Q: Suppose you want to check if x is NA.
#   What should the following line of code return?

# Q: What's that little yellow triangle with the exclamation point in Rstudio?

# Q: Why is the missing value a logical vector?

############################################################

# All function calls in R return an object.
# The following code writes the data frame iris to a file called "iris.csv"
x = write.csv(iris, "iris.csv")

# Q: What kind of object should x be?

# Q: Is NULL the same as NA?

# R functions often behave strangely when NULL is the argument.

# Q: How can we learn what NULL is?


############################################################
# Inf represents positive infinity.


############################################################
# NaN represents undefined numerical calculations.


# Recap
############################################################
# NULL, NA, Inf, and NaN are special values.
# Q: How can we check for each of these?



############################################################
# Matrix

# Vectors are 1 dimensional, matrices are 2d

# Q: Does R fill in the rows of the matrix first, or the columns?

# Q: review- Can objects have more than 1 class?

# Q: What's the difference between a matrix and a data frame?

# Q: What's the difference between these two multiplications?

# Arrays can have as many dimensions as you like.

# Q: What's an example use case of an array with more than 2 dimensions?

# Factors represent categorical variables.
############################################################

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")
str(earn)

# Q: Suppose we want a table of the counts of all the unique values in a column.
# How can we calculate this?

# Categorical variables usually have a small number of possible values.
# Q: Which of the columns in `earn` might be categorical?

# Let's play with a factor

# Q: How many possible levels for are there?

# Q: Do factors "remember" all possible levels?

# Factors are stored as integers
year = as.factor(head(earn$year))

# Q: What happened below?
as.integer(year)

# Q: How can we get the integers 2010, 2011?
