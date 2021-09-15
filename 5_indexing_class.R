# Announcements:
#
# 1. Project idea discussion open, due Friday
# 2. Thoughts for interactive lectures
# 3. Probably won't get through everything, I'll update HW

# Outcomes:
#   
# 1. Use factors to represent categorical variables.
# 2. Index elements from data structures x[index]

# Factors represent categorical variables.
############################################################

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")
str(earn)

# Categorical variables usually have a small number of possible values.
# Q: Which of the columns in `earn` might be categorical?

# Q: Suppose we want a table of the counts of all the unique values in a column.
# How can we calculate this?
unique(earn$age) # 
table(earn$age)

# Let's play with a factor
age = factor(earn$age)

head(age)

# Q: How many possible levels for age are there?
levels(age)

# Q: Do factors "remember" all possible levels?
head(age)

# Factors are stored as integers
year = as.factor(head(earn$year))
year

class(year)
typeof(year)
# 1 -> 2010
# 2 -> 2011

# Q: What happens when I convert factors to integers?
as.integer(year)

# Q: How can we get the integers 2010, 2011?
year2 = as.integer(as.character(year))

# Indexing by position
############################################################
# Use [ "square bracket" to index objects aka subset, extract

x = c(a = 10, b = 20, c = 30, d = 40, e = 50)

# In math, we often write a vector of length n as:
# [x_1, x_2, x_3, ..., x_n]

# Q: What should this do?
x[1]

# Q: What will x look like after this reassignment?
x[1] = 500
x

# Q: What if I index x by the numbers from 1 to 3?
x[1:3]
x[1:3] = c(10, 25, 35)

# Q: The object on the left hand side of the assignment is a vector with 3 elements. #   The object on the right is a vector of length 1.
#   What's gonna happen?!
x[1:3] = 100

# Q: If POSITION is a vector of integers, what does X[POSITION] return?
# The values of X corresponding to the indices in POSITION.

# Q: Does above the rule hold up if the indices are repeated?
x = c(a = 10, b = 20, c = 30, d = 40, e = 50)

x[c(1, 1, 2, 5, 2)]

# Q: What if you want all elements of x EXCEPT position 2?
x[2]

x[-2]


# Indexing by name
############################################################

x = c(a = 10, b = 20, c = 30, d = 40, e = 50)


# Q: Make a prediction, what will these do, and why?
x["a"]
x[a]

# Indexing by condition
############################################################
# Logic - The most powerful way to index
x_lt_25 = x < 25 # Intermediate variable

x_lt_25
class(x_lt_25)

r1 = x[x_lt_25]
r2 = x[x < 25]

# What is a situation where I might want to use an intermediate variable?
# 1. Code just gets too long.
# 2. If you want to use that again.

# Q: Does indexing do the same thing regardless of whether I use 
#   an intermediate variable?
identical(r1, r2)



# Q: Does this make any sense?
x_less_than25 = x[x < 25]
x + x_less_than25

# Q: What's the opposite of being less than 25?
x < 25

x >= 25

!(x < 25)

# Boolean logic
############################################################
# Come to office hours for a more thorough discussion

# ! NOT "bang"
# & AND
# | OR "bar" "pipe"
# xor EXCLUSIVE OR

# Q: Take a minute, predict the following:
!TRUE
!FALSE

# This block is the one to focus on:
TRUE & FALSE
TRUE | FALSE

# All TRUE
TRUE & TRUE
TRUE | TRUE

# All False
FALSE & FALSE
FALSE | FALSE

# Q: Are logical operators vectorized?
c(TRUE, FALSE) | c(FALSE, FALSE)

# Lists
############################################################

x = list(a = c(1, 2, 3), b = sin, c = c("hi", "hello"))

# Q: What are two ways to index the first two elements of x?
x[c(1, 2)]
x[1:2]

names(x)
x["a"]
xab = x[c("a", "b")]

# Q: What kind of object is returned here?
class(xab)

# Use [[ to extract elements from inside a list
x[["a"]]

# The indexing operator [ and the extraction operator [[ both work with any
# data structure that has elements. However, you’ll generally use the indexing
# operator [ to index vectors, and the extraction operator [[ to index
# containers (such as lists).

x[["a"]] = 500
 
# Data Frames
############################################################

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")

# General form of data frame indexing:
# DATA[ROWS, COLUMNS]

# First 3 rows of earn
earn[1:3, ]

earn[3, 6]
earn[2, 7]

earn[c(2, 3, 100), c(6, 7)]

# Last 10
tail(earn, 10)

tail(earn, 10)[, 1:3]

# We can mix integers with characters
earn[1:4, c("sex", "race", "n_persons")] # Clear which columns we want

earn[1:4, c(1, 2, 7)]  # Not clear what these columns are

# Q: Is it better to use integers or meaningful names?

# Q: What happens when I leave one argument blank?

# Common use case for data frames:
# index rows by condition and columns by name
w = earn[earn$sex == "Women", c("race", "n_persons")]
head(w)

# Q: How do you express the above in English?
