# Outcomes
#
# 1. Apply recursive partitioning (tree) models
# 2. Identify and assess when a model might be overfitting
# 3. Assess and compare different models
#
# Announcements
# (small) assignment on modeling due Monday

# References
# https://cran.r-project.org/web/packages/rpart/vignettes/longintro.pdf

# Starting with simulated data, then on to real data.

n = 100
x = seq(n)
true_model = function(x){
    x_lt50 = x < 50
    out = rep(0, length(x))
    out[x_lt50] = out[x_lt50] + 2
    out
}
y = true_model(x) + rnorm(n)

plot(x, y, main = "The true model is:\ny = piecewise constant function of x\n(plus noise)")
lines(x, true_model(x), lty = 2)

# For reference, here's the standard linear model
d = data.frame(x = x, y = y)
fit_lm = lm(y ~ x, data = d)
lines(x, predict(fit_lm), col = "grey")


# Let's fit this model using recursive partitioning (decision trees)
library(rpart)


fit_default = rpart(y ~ x, data = d)

fit_default 

plot(x, y, main = "The true model is:\ny = piecewise constant function of x\n(plus noise)")
lines(x, true_model(x), lty = 2)
lines(d$x, predict(fit_default), col = "blue")

plot(fit_default)
text(fit_default)

# 123 GO: Did it find the true model?

# The standard linear model has exactly 1 line of best fit.
# In contrast, rpart has __tuning parameters__ options you control
# to determine exactly how it fits.

# Start with the defaults, and go from there.
?rpart.control

# What does minbucket do?

# What does parsimonious mean?
fit_parsimonious = rpart(y ~ x, data = d, minbucket = 30)

# Let's try to make one that badly overfits.
fit_overfit = rpart(y ~ x, data = d, minsplit = 4, cp = 0.0001)

plot(x, y, main = "The true model is:\ny = piecewise constant function of x\n(plus noise)")
lines(x, true_model(x), lty = 2)
lines(d$x, predict(fit_default), col = "blue")
lines(d$x, predict(fit_parsimonious), col = "red")
lines(d$x, predict(fit_overfit), col = "green")

# Which model will have the smallest error on the existing values?

# Let's compare the performance of these models on new data from the true model
d2 = data.frame(x, y = true_model(x) + rnorm(n))

# The average squared error.
mean((predict(fit_lm, d2) - d2$y)^2)

avg_least_squares = function(fit, data = d2){
    mean((predict(fit, data) - data$y)^2)
}

models = list(fit_lm, fit_default, fit_parsimonious, fit_overfit)
names(models) = c("linear", "default rpart", "parsimonious rpart", "way overfit rpart")

lapply(models, avg_least_squares)

# This evaluation relied on having new data.
# How can we have "new data" if we just have one data set, and the model is unknown?

# Real data
body = read.csv("Howell_us.csv")

# What columns does it "make sense" to use as the predictors for weight?
