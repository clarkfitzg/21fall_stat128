# Announcements:
#
# 1. Project idea discussion open, due Friday
# 2. Thoughts on interactive lectures

# Outcomes:
#   
# 1. Use factors to represent categorical variables.

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

# Q: What should this do?
x[1]
