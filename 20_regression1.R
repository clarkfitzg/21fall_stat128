# Announcements:
#
# 1. project 2 details posted, draft due Dec 1.
# 1. project intent: to help YOU in the future
# 2. see my responses to project 2 ideas.
# 3. would you like a US or global GDELT data set? (100K rows, remove NA's for which columns?)

# Outcomes:
# 1. explain the role of predictor and response variables in regression
# 2. simulate data to learn unfamiliar software
# 3. construct predictor and response variables from text


# Sanity check - Simulating the model

n = 100
x = runif(n)
noise = rnorm(n)

y = 5*x - 10 + noise

plot(x, y)

# Univariate linear regression:
# The idea is to find the line of "best fit" through the data points.
# Model y as a linear function of x, plus some noise.

# y = a*x + b + noise

# Why do we care?
# What kind of questions can we answer if we know a, b, and x?

# Does it make sense to model x as a function of y?
plot(y, x)

# lm is for linear model
# Recall from Data Science panel Kevin said: "First, I try linear models"
# linear models are your go-to tool for statistical inference.
# This week, we're only scratching the surface of what they can do.

d = data.frame(x = x, y = y)

# Explain formula notation
fit = lm(y ~ x, data = d)

summary(fit)

# parameters (coefficients)
# The a and b in this model:
# y = a*x + b + noise
coef(fit)

# Confidence intervals for the estimated parameters
confint(fit)

confint(fit, level = 0.99)

dx = data.frame(x = c(0, 1, 2))

# Predict a single point
predict(fit, dx)

# Add the predicted lines
plot(x, y)
lines(d$x, predict(fit), col = "blue")

# Confidence interval prediction for individual points
predict(fit, dx, interval = "prediction", level = 0.9)

# The idea of a confidence interval for prediction is that data 
# should be between lwr and upr with 90% confidence.
# What does this mean?
# How can we test it?

preds = predict(fit, d, interval = "prediction", level = 0.9)

sum(d[, "y"] < preds[, "lwr"])
sum(preds[, "upr"] < d[, "y"])

# Let's add prediction intervals to the plot of x and y.
pinterval = data.frame(x = seq(from = 0, to = 1, length.out = 1000))

# TODO

# Extension 1
# Multivariate linear regression
############################################################

n = 100
x1 = runif(n)
x2 = runif(n)
noise = rnorm(n)

y = 3*x1 + 7*x2 + 10 + noise

# Is this linear relationship obvious?
plot(x1, y)

# How about for x2?
plot(x2, y)

# Let's see if the model can "find" the coefficients:
# 3 for x1, 7 for x2, and 10 for the intercept

d2 = data.frame(y = y, x1 = x1, x2 = x2)

# y ~ x1 + x2 means:
fit2 = lm(y ~ x1 + x2, data = d2)

# Alternatively, you can do:
fit2b = lm(y ~ ., data = d2)
# y ~ . means:

# What happens if you have many variables?

# HW: modify the model so that the noise is not normal.
# Look at some confidence intervals.
# Does the model still "work"?

# Extension 2
# Categorical Variables
############################################################

n = 100
x = runif(n)
ht = sample(c("heads", "tails"), n, replace = TRUE)
noise = rnorm(n)

y = 3*x + 7*(ht == "heads") + 10 + noise

plot(x, y)

d3 = data.frame(y = y, x = x, ht = ht)

fit3 = lm(y ~ ., data = d3)

fit3


# Real Data
############################################################
# Data set:
# age, weight, height, sex

# Data set downloaded from https://github.com/rmcelreath/rethinking/blob/master/data/Howell1.csv
body = read.table("Howell1.csv", sep = ";", header = TRUE)

dim(body)

str(body)

body$height_in = body$height / 2.54
body$weight_lb = body$weight * 2.20462
body$sex = ifelse(body$male, "male", "female")

# What's going on?
with(body, plot(height_in, weight_lb))

# How are we going to get adults?
adults = body[18 <= body$age, ]

# What do you observe?
# What kind of bodies are these people?
with(adults, plot(height_in, weight_lb))

fit1 = lm(weight_lb ~ height_in, data = adults)

# Interpret this:
fit1

# Let's predict my weight
predict(fit1, data.frame(height_in = 73), interval = "prediction")

# Did it work?
# What happened?

# Do we really think that weight and height are LINEARLY related?
# Bodies are mostly water.
# Suppose we model the weight of a bottle of water as a function of height.
# What's the relationship?

adults = adults[order(adults$height_in), ]

fit2 = lm(weight_lb ~ I(height_in^3), data = adults)

with(adults, plot(height_in, weight_lb))

lines(adults$height_in, predict(fit2), col = "blue")
lines(adults$height_in, predict(fit1), col = "red")


predict(fit1, data.frame(height_in = 73), interval = "prediction")

predict(fit2, data.frame(height_in = 73), interval = "prediction")
