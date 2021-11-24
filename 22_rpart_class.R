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
library(rpart)

# 123 GO:
# one thing you're looking forward to for Thanksgiving?

n = 100
x = seq(n)
true_model = function(x){
    # Piecewise constant
    out = rep(2, length.out = length(x))
    out[x < 50] = 4
    out
}
y = true_model(x) + rnorm(n)

d = data.frame(x = x, y = y)
fit_lm = lm(y ~ x, data = d)


plot(x, y)
lines(x, true_model(x), lty = 2)
lines(x, predict(fit_lm), col = "blue")

# Use the defaults:
fit_rpart = rpart(y ~ x, data = d)

plot(x, y)
lines(x, true_model(x), lty = 2)
lines(x, predict(fit_rpart), col = "red")

plot(fit_rpart)
text(fit_rpart)

# Did we capture the truth?
# Not for x above 50

# rpart has "tuning parameters"
# We can adjust the model to fit the data 
# more or less

fit_overfit = rpart(y ~ x, data = d, minsplit = 4, cp = 0.0001)

plot(x, y)
lines(x, true_model(x), lty = 2)
lines(x, predict(fit_rpart), col = "red")
lines(x, predict(fit_overfit), col = "blue")

# Think of parsimonious as "conservative"
# The simplest possible model that reasonably
# explains the data.
fit_parsimonious = rpart(y ~ x, data = d, minbucket = 30)

plot(x, y)
lines(x, true_model(x), lty = 2)
lines(x, predict(fit_rpart), col = "red")
lines(x, predict(fit_overfit), col = "blue")
lines(x, predict(fit_parsimonious), col = "green")

# Evaluating models
# This is new y data from the true model.
d2 = data.frame(x, truth = true_model(x))
d2$y = d2$truth + rnorm(n)

# What's the Mean Squared Error for each model?
# MSE
# How well did the model work for making new
# predictions?
error = predict(fit_rpart, d2) - d2$y
mean(error^2)

# 123 GO: Does the best model minimize or maximize
# MSE?
models = list(fit_lm, fit_rpart, fit_overfit, fit_parsimonious)
names(models) = c("linear", "default", "overfit", "parsimonious")

mse = function(fit, data = d2){
  error = predict(fit, data) - data$y
  mean(error^2)   
}

mse(fit_rpart)

# Apply to all the models:
lapply(models, mse)

# Found new data and tested the performance of the models on
# new data.
# How to check performance of model if I can't get more data?
# Separate out a test or validation set.
# Cross validation generalizes this idea
           
# External data:
body = read.csv("Howell_us.csv")
head(body)

# Randomly pick data to use exclusively for evaluation
# That's the testing (validation) set
# 20% is typical
n = nrow(body)
val = sample(n, size = round(0.2 * n))
body_train = body[-val, ]

# Sort data so lines work
body_train = body_train[order(body_train$age), ]

# Probably helpful to remove original data
# so you don't accidentally use it.
rm(body)


# Let's model height as a function of age.
fit1 = rpart(height_in ~ age, data = body_train)

with(body_train, plot(age, height_in))
lines(body_train$age, predict(fit1), col = "blue", lwd = 4)

#lines(c(40, 60, 60), c(25, 25, 70), col = "red", lwd = 5)

fit2 = rpart(height_in ~ age + sex, data = body_train)

with(body_train, plot(age, height_in))
lines(body_train$age, predict(fit2), col = "red", lwd = 4)

# * does all possible first order and interaction terms
fit3 = lm(height_in ~ age*sex, data = body_train)

# : does exactly one interaction effect
fit4 = lm(height_in ~ age:sex, data = body_train)

