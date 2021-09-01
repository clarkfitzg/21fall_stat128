# R script

# Get working directory
getwd() 

# Set working directory
setwd("/Users/fitzgerald/projects/21fall_stat128/")

# YOUR TURN
# Are absolute paths good for sharing?

# Shortcuts:
# ~   home directory
# ..  parent directory

# list files in a directory
list.files()
list.files("~")

# Download data file
download.file("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-23/earn.csv", "data/earn.csv")

# Read a CSV file into a data frame
earn = read.csv("data/earn.csv")

# principle: Always be touching your data!
# Verify things are as expected.

# What kind of object is it?
class(earn)

# Look at the first few rows
head(earn)

# How many columns does it have?
ncol(earn)

# How many rows does it have?
nrow(earn)

# Dimensions, rows and columns
dim(earn)

# Show the underlying structure of any R object
str(earn)

# Statistical summary
summary(earn)

# DATA$COL selects COL from DATA
earn$n_persons

# histogram
hist(earn$median_weekly_earn)

# mean
mean(earn$median_weekly_earn)

# range
range(earn$median_weekly_earn)

# (re)assign existing columns
earn$median_weekly_earn = 0

# UH OH! What happened?
# We wrote over that row.
# Can we go back?
# NO!
# That's why we always save our code in reproducible scripts.

# 1.7 Vectors
############################################################

# A vector is an ordered collection of values.

# combine values into a vector
x = c(1, 5, 10)

# Check the length of a vector
length(x)

# Create sequences of integers
1:10
-5:7

# Extract elements from vectors
x[1]
x[c(3, 2)]

# Replace elements in vectors
x[1] = 100

# Vectorization applies a function to every element in a vector
x = c(1, 3, 0, pi)
sin(x)

# Same thing, but ugly and inefficient
c(sin(x[1]), sin(x[2]), sin(x[3]), sin(x[4]))

# Vectorization is common and idiomatic in R, particularly for math functions.

# Some functions produce one number from a vector.
# These accept vectors, but they don't work elementwise.
max(x)

# YOUR TURN:
# Determine which of the following functions work elementwise.
# log, mean, sum, sqrt

# Functions can be vectorized in multiple arguments.
# Arithmetic operators are vectorized in 2 arguments.
x = 1:4
y = c(0, 0, 1, 2)

x+y
x*y

# If two vectorized arguments are not the same size, then R will
# *recycle* the smaller to be the same size.
x = 1:4
y = c(0, 1)

x + y
  
# Effectively the same as:
y2 = c(0, 1, 0, 1)
x + y2
  
# Vectors of length 1 (no scalars) are a special case of recycling.
x + 1
2 * x

# When the sizes don't line up, you'll see
# "Warning message:
# longer object length is not a multiple of shorter object length
y3 = c(0, 1, 0)
x + y3
# This particular warning message ALMOST ALWAYS indicates a mistake.

# Comparisons

# Compare values using comparison operators such as <, <=, ==
1 < 5
4 <= 4
4 == 5

# Comparisons result in logical vectors, TRUE or FALSE
x = 4 == 5
x

FALSE

# Comparing longer vectors results in longer logical vectors.
x = 1:5
x <= 2

# any and all
any(c(TRUE, TRUE, FALSE))

all(c(TRUE, TRUE, FALSE))

# %in%
c(0, 5) %in% 2:6
