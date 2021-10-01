
# Announcements
# 1. Today at 5 / after class Prof. Norris will be available.
# https://csus.zoom.us/my/michellenorris
# 2. I'm "grading as they come in"

# 123 GO: What's your word of the day?

# References:
# Introduction to R https://cran.r-project.org/doc/manuals/r-release/R-intro.html#The-three-dots-argument
# Advanced R S3 methods: https://adv-r.hadley.nz/s3.html

# Outcomes:
# 1. Write methods for generic functions
# 2. Write wrapper functions using ... (ellipsis)

# 123 GO:
# Which functions do we have for the SIR model?
# 1. initialize
# 2. plot / image
# 3. iteration of infection step
# 4. sir() - the full blown simulation (due next week)

# two schools of thought for coding in R
# 1. "Just get something done" - write a script
# 2. "Software developer mindset" - thinking about how to organize
#     all your code and make it beautiful, clean, user friendly.

x = rep(0:2, each = 5)
x = matrix(x, nrow = 3)

# ... pronounced "dot dot dot" or ellipses
# Pass all extra arguments besides x into image()

# image() is a wrapper for plot()
# plotsir() is a wrapper for image
plotsir = function(x, ...){
  image(t(x), col = c("white", "red", "grey"), ...)
}
# 123 GO:
# CAN plotsir() accept the argument main?

# 123 GO: Will this work?
# Want to do the simple thing:
plotsir(x)

# Want to do more complicated things:
plotsir(x, main = "In class demo")

plotsir(x, main = "In class demo", sub = "great colors")

plotsir(x, main = "In class demo", leijan = "great colors")

# 123 GO:
# Is it a good idea to keep adding all the arguments into plotsir?
# NO.

# 123 GO:
# Should plotsir() be considered a high level plotting
# function?
# yes


plotsir(x)

# I want to put a title on the plot.

f = function(...) list(...)

f(1, 2, "hello", 5:8)

# R's ... is similar to:
# Python *args, **kwargs

# OOP
# Object oriented programming


# Works great for time series
# plotting time series does something nice too
plot(AirPassengers)
class(AirPassengers)

# plotting numeric vectors does something intuitive
y = 1:4
plot(y)
plot(y, y^2)

# 123 GO: Is plot doing the same thing for numeric vectors as
# for time series?
# NO- plot does completely different things depending on the class
# of the first argument.
# This is OOP - object oriented programming

# Greedy user wants to do this:
plot(x)

# Using R's S3 system
class(x)

# Can change the class of x:
class(x) = c("SIR", class(x))

# Defined new method for plot
plot.SIR = function(x, ...){
  image(t(x), col = c("white", "red", "grey"), ...)
}

# Relied on OOP:
# plot dispatched on the class of x (SIR) and called plot.SIR
plot(x)

# use plot.SIR explicitly:
plot.SIR(x, main = "demo")

# How do we know when we can define methods?
# plot is a "generic function", meaning it that it calls
# methods to do the actual work.
# You know this because when you print out the function,
# all you see is:
# UseMethod("plot")

# 123 GO:
# Is summary a generic function?

# 123 GO:
# I defined a function named plot.SIR 
# What function do I define to get a summary method
# for my SIR objects?
summary.SIR = function(x, ...)
{
  table(as.vector(x), ...)
}

summary(x)

# plot and summary are the most common methods used in R

# Not this:
sum(x, na.rm = F)

# Do this instead:
# FALSE is a string literal, meaning it cannot be redefined.
sum(x, na.rm = FALSE)
