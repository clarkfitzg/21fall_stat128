# Announcements:
#
# 1. Planning to announce first project next week
# 2. Demo using MS Teams

# Plan today:
# - Goal: interactive lecture
# - type along
# - everyone speaks
# - ground rules: what are some good and bad examples?

# Anti example: tell them they're wrong with no reason why.
# Mute when you're not speaking.
# Use reactions button to raise hand
# You can pass if you need to 
# "Oh, that's easy"

# Outcomes:
#   
# 1. Describe the use cases for special values NA, NaN, NULL, and Inf
# 2. Test for the presence of special values
# 3. Use matrices and factors

# Missing values come up all the time in statistics.
# R's ability to handle missing values well is one of it's greatest features.

# NA represents a missing value, meaning you don't know what it is.
# Vectors can have missing values anywhere.
NA
x = c(1.0, 1.5, NA, 5, NA)


# Q: If all you know about x is that it's missing,
#   then what do you know about x + 1?
# A: Nothing, it's still missing
x = NA
x + 1

# The missing value is CONTAGIOUS.
2*x 

# Take 1 million numbers, and one NA
x = c(seq(1e6), NA)

# Q: Can you calculate sum(x), if just 1 value is missing?
sum(x)
# Propagate

# Q: what's the meaning of rm in na.rm?
sum(x, na.rm = TRUE)

# Q: Suppose you want to check if x is NA.
#   What should the following line of code return?
x = 10
x + NA
x == NA

is.na(x)

is.na(NA)

# is.na is vectorized
is.na(c(NA, 1, NA, 2, 3))

# Q: What's that little yellow triangle with the exclamation point in Rstudio?

# Q: Why is the missing value a logical vector?
# Connect to what we did last class- type hierarchy
class(NA)
typeof(NA)

# logical vector can be coerced to anything else at all.
xl = NA
xn = as.numeric(NA)
is.na(xl)
is.na(xn)
identical(xl, xn)

############################################################

# All function calls in R return an object.
# OUTPUT = FUNCTION(INPUT)

# The following code writes the data frame iris to a file called "iris.csv"
x = write.csv(iris, "iris.csv")

# Q: What kind of object should x be?
# No idea! it's not clear

# Q: How can we learn what NULL is?

# Q: Is NULL the same as NA?
is.na(NA)
l0 = is.na(NULL)

# R functions often behave strangely when NULL is the argument.



############################################################
# Inf represents positive infinity.

x = seq(from = 0.001, to = 0.03, length.out = 100)
plot(x, 1 / x)

1 / 0
# Inf represents positive infinity
-Inf

2 * Inf

############################################################
# NaN represents undefined numerical calculations.
# Not a number

Inf - Inf

0 / 0 

(0 / 0 ) + 10

NaN == 10

# Recap
############################################################
# NULL, NA, Inf, and NaN are special values.
# Q: How can we check for each of these?
is.na(NA)
is.nan(NA)
is.nan(0/0)

is.null(NULL)

is.infinite(Inf)

is.finite(Inf)

############################################################
# Matrix

# Vectors are 1 dimensional, matrices are 2d
x = matrix(1:6, nrow = 2)
x

# Q: Does R fill in the rows of the matrix first, or the columns?
# columns first!
# "column major order"

# Q: review- Can objects have more than 1 class?
class(x)
length(class(x))

# Q: What's the difference between a matrix and a data frame?
xdf = as.data.frame(x)
typeof(x)

xdf
as.matrix(xdf)

xc = matrix(letters, nrow = 2)

# Q: What's the difference between these two multiplications?
x = matrix(1:4, nrow = 2)

# Works elementwise
x * x

# Matrix multiplication - linear algebra
x %*% x

# Arrays can have as many dimensions as you like.
# Tensor (Tensorflow)
xa = array(0, dim = c(2, 3, 4))
xa

xa[1, 1, 1] = 100
xa[2, 3, 4] = -5

# Q: What's an example use case of an array with more than 2 dimensions?
# Videos, grayscale pixel / voxel values

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
