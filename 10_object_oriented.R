
# Announcements

# References:
# Introduction to R https://cran.r-project.org/doc/manuals/r-release/R-intro.html#The-three-dots-argument
# Advanced R S3 methods: https://adv-r.hadley.nz/s3.html

# Outcomes:
# 1. Write methods for generic functions
# 2. Write wrapper functions using ... (ellipsis)

# Review of the functions we have for the SIR model:

# 1. initialize
# 2. plot
# 3. one iteration
# 3. full simulation

x = matrix(rep(0:2, each = 5), nrow = 3)

class(x) = c("sir", class(x))


plot.sir = function(x, ...){
    image(t(x), col = c("white", "red", "grey"), ...)
}

plot.sir(x, main = "Sweet graph!")

plot(x, main = "Sweet graph!")


summary(x)

# 123 GO: What will I name my summary function?
summary.sir = function(x){
    c(susceptible = sum(x == 0), infected = sum(x == 1), removed = sum(x == 2))
}


summary(x)

# How can I tell if a function is generic

