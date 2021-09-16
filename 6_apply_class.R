# Announcements:
#
# - Going to use more chat based 123 GO activities today.
# - Feedback: through office hours, projects, MS Teams, posted solutions.
# - Discord vs. MS Teams?

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


# lapply(X, FUN, ...)

# 123 GO - Can functions be arguments to other functions?

# `class` is not vectorized.

# s - for simplified

# 123 GO - which do you find clearer to read?

install.packages("microbenchmark")
library(microbenchmark)

# Original goal:
# Find all the nonnumeric columns in `earn`.
# PROGRAMMATICALLY


# 123 GO: what's the sapply call?


# Now let's use lapply to make a table of all the non numeric columns

# Here's one:

# 123 GO: Given num_cols, How can I get the non numeric columns of earn?

# 123 GO: Would this effort have been worth it if `earn` only had 2 columns?

# The split / apply pattern
############################################################

# Suppose we want to know the median earnings by sex.
# We could break earn into subsets by sex:

# Conceptually, this is like splitting the data on a column in earn.
# 123 GO: Which column?


