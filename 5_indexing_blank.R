# Announcements:
#
# 1. Project idea discussion open, due Friday
# 2. Thoughts for interactive lectures
# 3. Probably won't get through everything, I'll update HW

# Outcomes:
#   
# 1. Use factors to represent categorical variables.
# 2. Index elements from data structures

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

# Indexing by position
############################################################
# Use [ "square bracket" to index objects aka subset, extract

x = c(a = 10, b = 20, c = 30, d = 40, e = 50)

# In math, we often write a vector of length n as:
# [x_1, x_2, x_3, ..., x_n]

# Q: What should this do?
x[1]

# Q: What will x look like after this reassignment?
x[1] = 1000

# Q: What if I index x by the numbers from 1 to 3?
x[1:3]
x[1:3] = c(4, 8, 16)

# Q: The object on the left hand side of the assignment is a vector with 3 elements.
#   The object on the right is a vector of length 1.
#   What's gonna happen?!
x[1:3] = NA

x[c(1, 4)]
pos = c(1, 5)
x[pos]

# Q: If POSITION is a vector of integers, what does X[POSITION] return?

# Q: Does above the rule hold up if the indices are repeated?
x = c(a = 10, b = 20, c = 30, d = 40, e = 50)
x[c(1, 4, 1, 2)]

# Q: What if you want all elements of x EXCEPT position 2?
x[-2]

x[c(-2, -4)]


# Indexing by name
############################################################

x = c(a = 10, b = 20, c = 30, d = 40, e = 50)

x["b"]

# Q: Make a prediction, what will these do, and why?
x["a"]
x[a]

# Indexing by condition
############################################################
# The most powerful way to index

lessthan25 = x < 25   #  example of an __intermediate variable__

x[lessthan25]

# Q: Does indexing do the same thing regardless of whether I use 
#   an intermediate variable?
x[x < 25]


x_less_than25 = x[x < 25]

# Q: Does this make any sense?
x + x_less_than25

# Q: What's the opposite of being less than 25?
x >= 25

# Exclamation point ! pronounced "NOT"
!lessthan25

# Boolean logic
############################################################
# Come to office hours for a more thorough discussion

# ! NOT
# & AND
# | OR
# xor EXCLUSIVE OR

# Q: Take a minute, predict the following:
!TRUE
!FALSE

TRUE & FALSE
TRUE | FALSE

TRUE & TRUE
TRUE | TRUE

FALSE & FALSE
FALSE | FALSE

# Q: Are logical operators vectorized?
c(TRUE, FALSE) | c(FALSE, FALSE)

# Lists
############################################################

x = list(a = c(1, 2, 3), b = sin, c = c("hi", "hello"))

# Q: What are two ways to extract the first two elements of x?
x[1:2]
x[c("a", "b")]

# Q: What kind of object is returned here?
x[1]
class(x[1])

# Use [[ to extract elements from inside a list
x[[1]]
class(x[[1]])

# The indexing operator [ and the extraction operator [[ both work with any
# data structure that has elements. However, you’ll generally use the indexing
# operator [ to index vectors, and the extraction operator [[ to index
# containers (such as lists).
 
# Data Frames
############################################################

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")

# General form of data frame indexing:
# DATA[ROWS, COLUMNS]

earn[1, 4]
earn[1, c(4, 5)]
earn[c(1, 7), c(4, 5)]

# We can mix integers with characters
earn[1, c("age", "year")]
earn[1, c(4, 5)]

# Q: Is it better to use integers or meaningful names?

# Q: What happens when I leave one argument blank?
earn[1:3, ]

earn[, 1]

# Common use case for data frames:
# index rows by condition and columns by name
y = earn[earn$year == 2020, c("sex", "age", "year")]
head(y)

# Q: How do you express the above in English?
