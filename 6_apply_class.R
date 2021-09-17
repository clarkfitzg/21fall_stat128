# Announcements:
#
# - Going to use more chat based 123 GO activities today.
# - Feedback: through office hours, projects, MS Teams, posted solutions.
# 123 go:
# - Discord better than MS Teams?
# - Discord, MS Teams, no pref
# - Project 

# Review:
# [, [[ index operator

# Outcomes:
#
# 1. Use R's apply family of functions.
# 2. Split data by categorical variables.

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")

names(earn)

# Suppose I want to find all the nonnumeric columns in earn.
# How could I do this?

is.numeric(earn$sex)
is.numeric(earn$race)
is.numeric(earn$ethnic_origin)
is.numeric(earn$year)
is.numeric(earn$quarter)
is.numeric(earn$n_persons)
is.numeric(earn$median_weekly_earn)

# 123 GO: is there something wrong with what I did above?
# yes, no, hmmmm

# What's wrong?
# DRY - Don't Repeat Yourself

# lapply(X, FUN, ...)

# lapply - list apply
lapply(earn, is.numeric)

# sapply - simplified apply
# example of idiomatic R
sapply(earn, is.numeric)

# 123 GO - Can functions be arguments to other functions?
# yes!
# is.numeric is a function
is.numeric
is.function(is.numeric)

# sapply is a function that takes in other functions as arguments
# ^ an example of a "higher order function"
sapply(earn, is.numeric)

# `is.numeric` is not vectorized.
is.numeric(earn)

# s - for simplified
sapply(earn, is.numeric)

x = c(0, 1, pi)
sin(x)

# 123 GO: which integer is the following EXTREMELY close to?
sin(pi)


# 123 GO - which do you find clearer to read? 
sin(x)   # < vectorized function sin
sapply(x, sin) # < sapply


install.packages("microbenchmark")
library(microbenchmark)

microbenchmark(sin(x)) # about 300 nanoseconds
microbenchmark(sapply(x, sin))  # 16 microseconds

# 123 GO: which is faster? vectorized or sapply?
16e3 / 300

# If there is a vectorized function available, then use it.
# Otherwise, use *apply

# Original goal:
# Find all the nonnumeric columns in `earn`.
# PROGRAMMATICALLY

num_cols = sapply(earn, is.numeric)

!num_cols

# Now let's use lapply to make a table of all the non numeric columns
table(earn$sex)
table(earn$race)

# earn with only the nonnumeric cols
head(earn[, !num_cols])

# apply the function table
counts = lapply(earn[, !num_cols], table)

# sapply will simplify the result into a vector
sapply(earn[, !num_cols], table)
# 123 GO: Does it make sense to use sapply up above in line 104?
# no

# 123 GO: Would this effort have been worth it if `earn` only had 2 columns?
num_cols = sapply(earn, is.numeric)
counts = lapply(earn[, !num_cols], table)

# Alternatively:
table(earn$sex)

# The split / apply pattern
############################################################

# Suppose we want to know the median earnings by sex.
# We could break earn into subsets by sex:

#     rows: logical vector   , name of a column
earn[earn$sex == "Both Sexes", "median_weekly_earn"]

# Which values of Sex are there?
unique(earn$sex)

median(earn[earn$sex == "Both Sexes", "median_weekly_earn"])
median(earn[earn$sex == "Men", "median_weekly_earn"])
median(earn[earn$sex == "Women", "median_weekly_earn"])
# 123 GO: Is there repetition in the 3 lines above?
# Yes

# Conceptually, this is like splitting the data on a column in earn.
# 123 GO: Which column?
# sex

by_sex = split(earn$median_weekly_earn, earn$sex)
names(by_sex)
lapply(by_sex, head)
lapply(by_sex, length)

lapply(by_sex, median)

sapply(by_sex, median)
