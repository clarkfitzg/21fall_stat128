# Announcements:
#
# TODO: add video idea to project description
# final presentation
#
# 1. project 2 details posted, draft due Dec 1.
# 1. project intent: to help YOU in the future
# 2. see my responses to project 2 ideas.
# 3. would you like a US or global GDELT data set? (100K rows, remove NA's for which columns?)

# 123 GO: what's your favorite weather?

# Outcomes:
# 1. explain the role of predictor and response variables in regression
# 2. simulate data to learn unfamiliar software


# Sanity check - Simulating the model

n = 100
x = runif(n)
noise = rnorm(n, sd = 0.5)
y = 4*x + 10 + noise  # <- model

plot(x, y)

# Univariate linear regression:
# The idea is to find the line of "best fit" through the data points.
# Model y as a linear function of x, plus some noise.

# y = a*x + b + noise  # <- model

# Why do we care?
# What kind of questions can we answer if we know a, b, and x?

# 1. predict new values of y based on x (statistical / machine learning)
# 2. infer linear relationships between variables

# Recall Kevin from DS panel:
# "First I try a linear model."

# Imagine we read in this in from a CSV file or SQL
d = data.frame(x = x , y = y)

# y ~ x (~ is tilde)
# In R this is a formula that represents this model:
# y = a*x + b + noise

# lm is for linear model
fit = lm(y ~ x, data = d)
# I call it fit because it's fitted to a particular data set.

# 123 GO: 
# Did the linear model do a good job at inferring the coefficients?
#y = 4*x + 10 + noise  # <- model

# extract coeffecients from model:
coef(fit)

str(fit)

s = summary(fit)

# Extracting directly:
summary(fit)[["coefficients"]][, "Std. Error"]

# Commonly: constuct confidence intervals
confint(fit)

confint(fit, level = 0.99)

summary(fit)

sd(noise)

# Prediction
predict(fit)

d$ypred = predict(fit, data = d)

with(d, plot(x, y))
with(d, lines(x, ypred, col = "blue"))

plot(d$x, d$y)
lines(d$x, d$ypred, col = "blue")

# new data
dnew = data.frame(x = c(0.1, 0.5, 0.9))

predict(fit, newdata = dnew)

predict(fit, dnew)

# How do I find what predict does?
# find out class of fit- lm
# look up predict.lm
# (review of R's S3 object oriented programming)

predict(fit, dnew, interval = "prediction", level = 0.9)

preds = predict(fit, d, interval = "prediction", level = 0.9)

# The lower bound of the prediction interval
sum(preds[, "lwr"] < d[, "y"])

# d[, "y"] should be BETWEEN lower and upper values of prediction

sum((preds[, "lwr"] < d[, "y"]) & (d[, "y"] < preds[, "upr"]))

preds = predict(fit, d, interval = "prediction", level = 0.9)
mean((preds[, "lwr"] < d[, "y"]) & (d[, "y"] < preds[, "upr"]))

# Confidence interval bounding
plot(d$x, d$y)
plot(d$x, d$y)

lines(d$x, d$ypred, col = "blue")

lines(d$x, preds[, "upr"], col = "red", lty = 2)
lines(d$x, preds[, "lwr"], col = "red", lty = 2)

# Quick intro to nonlinear

n = 100
x = sort(runif(n))
noise = rnorm(n, sd = 0.5)
y = 4*(x^2) + 10 + noise  # <- model

fit2 = lm(y ~ I(x^2))

plot(x, y)
lines(x, predict(fit2), col = "blue")
