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

x = c(NA, 2, 3, NA, 5)

y = c("hello", NA, "goodbye")

# Q: If all you know about x is that it's missing,
#   then what do you know about x + 1?

# The missing value is CONTAGIOUS.
NA + 1

# Take 1 million numbers, and one NA
one_missing = c(seq(1e6), NA)
tail(one_missing)

# Q: Can you calculate sum(x), if just 1 value is missing?
sum(one_missing)

sum(one_missing, na.rm = TRUE)
# Q: what's the meaning of rm in na.rm?

# Q: Suppose you want to check if x is NA.
#   What should the following line of code return?
x = NA    # Assign NA to x
x == NA   # test if x is the same as a missing value

# Q: What's that little yellow triangle with the exclamation point in Rstudio?
is.na(x)

# Q: Why is the missing value a logical vector?
class(NA)

############################################################

# All function calls in R return an object.
# The following code writes the data frame iris to a file called "iris.csv"
x = write.csv(iris, "iris.csv")

# Q: What kind of object should x be?

# Q: Is NULL the same as NA?
is.na(NULL)

# R functions often behave strangely when NULL is the argument.

# Q: How can we learn what NULL is?
?NULL


############################################################
# Inf represents positive infinity.

x = seq(from = 0.001, to = 0.05, length.out = 100)
plot(x, 1/x)

1 / 0

# Recap
############################################################
# NULL, NA, Inf, and NaN are special values.
# Q: How can we check for each of these?
is.na(NA)



############################################################
# Matrix
x = matrix(1:6, nrow = 2)

# Vectors are 1 dimensional, matrices are 2d
x

# Q: Does R fill in the rows of the matrix first, or the columns?

# Q: review- Can objects have more than 1 class?
class(x)

# Q: What's the difference between a matrix and a data frame?
xd = as.data.frame(x)

y = matrix(1:4, nrow = 2)

# Q: What's the difference between these two multiplications?
y * y
y %*% y

# Arrays can have as many dimensions as you like.
a = array(seq(2*3*2*5), dim = c(2, 5, 3, 2))

# Q: What's an example use case of an array with more than 2 dimensions?

# Factors represent categorical variables.
############################################################

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")
str(earn)

# Q: Suppose we want a table of the counts of all the unique values in a column.
# How can we calculate this?

table(earn$sex)

table(earn$race)

table(earn$n_persons)

# Categorical variables usually have a small number of possible values.
# Q: Which of the columns in `earn` might be categorical?
head(earn)

# Let's play with a factor
age = factor(earn$age)

class(age)

# Q: How many possible levels for age are there?
levels(age)

a4 = age[1:4]

# Q: Do factors "remember" all possible levels?
levels(a4)

# Factors are stored as integers
year = as.factor(head(earn$year))

# Q: What happened below?
as.integer(year)

# Q: How can we get the integers 2010, 2011?
as.integer(as.character(year))
