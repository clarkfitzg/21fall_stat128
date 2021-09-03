# R script

# indicates a comment in my code


# absolute path
# because it starts with a / for the root directory
# on Windows: C:, D:
# /Users/fitzgerald/projects

# working directory
getwd()
list.files()

# relative file path
setwd("projects/21fall_stat128/")


# 123 go will list.files say the same it did before?
list.files()

# Load earn.csv
# Relative path
earn = read.csv("data/earn.csv")

# absolute path
earn = read.csv("/Users/fitzgerald/projects/21fall_stat128/data/earn.csv")

# YOUR TURN
# which is the better way? relative or absolute
# relative is more portable.

# Shortcuts:
# ~   home directory
# ..  parent directory

# list files in a directory

# Download data file
# https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv

download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv", "earn_from_class.csv")

earn = read.csv("data/earn.csv")

# How big?
nrow(earn)

ncol(earn)

# structure
str(earn)

class(earn)

head(earn)

summary(earn)

earn$median_weekly_earn

max(earn$median_weekly_earn)

hist(earn$median_weekly_earn)

#earn$median_weekly_earn = 0

# Was this destructive? Can I get it back?
# 123 GO
# YES it's destructive. It's gone forever, there's no UNDO.


# 1.7 Vector
############################################################

x = c(1, 5, 10)
y = c(2, -1, 0)

# + is a binary operator
x + y
`+`(x, y)

# length
length(x)

1:10
# 123 go: what will be the length of the following vector?
length(-5:2)


x
x[2]

x[2] = 100

# Vectorization
log10(x)

c(log10(x[1]), log10(x[2]), log10(x[3]))

# 123 GO: Does this make sense mathematically? No...
x + 1


# YOUR TURN:
# Determine which of the following functions work elementwise.
# log, mean, sum, sqrt
log(x)
sqrt(x)

mean(x)
sum(x)


# If two vectorized arguments are not the same size, then R will
# *recycle* the smaller to be the same size.
x + 1
# after recycling:
x + c(1, 1, 1)

z = 1:4
a = c(0, 0.5)

# What do you think this will do?
# 123 GO: will it be an error? yes or no
a + z

z + c(a, a)

z + c(0, 0.5, 0, 0.5)

b = c(0, 1, 7)

d = z + b

x = 10 * (1:5)

# 1 based indexing
x[1]

# Comparisons
10 < 20
x <= 25 # What should this produce?

x20 = x == 20
x20[2]

all(x20)
# 123 GO predict: True or False
any(x20)

# We can think of TRUE = 1 
TRUE == 1
FALSE == 0

TRUE + 1:5
1 + 1:5

# vectors!
x = 1:5
x[1] = NULL
x[-1] # Negative indexing.
