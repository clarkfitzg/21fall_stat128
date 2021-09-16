# Announcements:
#
# - Going to use more chat based 123 GO activities today.
# - Feedback: through office hours, projects, MS Teams, posted solutions.

# Review:
# [ index operator

# Outcomes:
#
# 1. Use R's apply family of functions.
# 2. Split data by categorical variables.

earn = read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv")

names(earn)

# Suppose I want to find all the nonnumeric columns in earn.
# How could I do this?

# What's wrong with doing this?

class(earn$sex),
class(earn$race),
class(earn$ethnic_origin),
class(earn$year),
class(earn$quarter),
class(earn$n_persons),
class(earn$median_weekly_earn)

# DRY, Missed one column

# lapply(X, FUN, ...)
lapply(earn, class)

# 123 GO - Can functions be arguments to other functions?
# Yes. lapply is an example of a higher order function.

# `class` is not vectorized.
# lapply(earn, class) allows `class` to behave as if it were vectorized.
class(earn)

# Indeed, vectorized functions are similar to calls to lapply
x = 1:3
sin(x)

lapply(x, sin)

# s - for simplified
sapply(x, sin)

# 123 GO - which do you find clearer to read?
sapply(x, sin)
sin(x)

install.packages("microbenchmark")
library(microbenchmark)

microbenchmark(sapply(x, sin))
microbenchmark(sin(x))

# Original goal:
# Find all the nonnumeric columns in `earn`.
# PROGRAMMATICALLY

is.numeric(earn$age)

# 123 GO: what's the sapply call?
num_cols = sapply(earn, is.numeric)

head(earn[, num_cols])

# Now let's use lapply to make a table of all the non numeric columns

# Here's one:
table(earn[, "sex"])

# 123 GO: Given num_cols, How can I get the non numeric columns of earn?
!num_cols
head(earn[, !num_cols])
lapply(earn[, !num_cols], table)

# 123 GO: Would this effort have been worth it if `earn` only had 2 columns?
num_cols = sapply(earn, is.numeric)
lapply(earn[, !num_cols], table)

# The split / apply pattern
############################################################

# Suppose we want to know the median earnings by sex.
# We could break earn into subsets by sex:
median(earn[earn$sex == "Both Sexes", "median_weekly_earn"])

# Conceptually, this is like splitting the data on a column in earn.
# 123 GO: Which column?

by_sex = split(earn$median_weekly_earn, earn$sex)
class(by_sex)

lapply(by_sex, head)

lapply(by_sex, median)

sapply(by_sex, median)

