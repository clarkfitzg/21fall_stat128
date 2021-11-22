# 123 GO:
# What food are you excited for Thanksgiving?
# 
# Idea to make a good project:
# Bringing in 3rd party data opens up a whole new range 
# of possibilities 

# Extending to multivariate-
# multiple x's

n = 100

# x1, x2 are the predictors
x1 = runif(n)
x2 = seq(n) / n

# rnorm: random normal
noise = rnorm(n)

# Linear model
# y is the _response_ aka dependent variable
# endogenous, exogenous variables
# y is a function of x1 and x2, plus some noise
y = 0.3*x1 +  6*x2 + (-5) + noise

plot(x2, y)

d = data.frame(y = y, x1 = x1, x2 = x2)
# y ~ x         means y = ax + b + noise
# y ~ I(x^2)    means y = a*x^2 + b + noise
# I() appearing in a formula applies a math function
# y ~ x1 + x2   means y = a1x1 + a2x2 + b + noise
#               NOT actually just adding x1 and x2
fit = lm(y ~ x1 + x2, d)
summary(fit)

# y ~ .   means model y as a linear function of every
#       other variable you find in the data frame.
fit2 = lm(y ~ ., d)


# 123 GO:
# three terms: x1, x2, intercept
# Which do you think will be significant?

# confidence intervals
confint(fit)

# prediction
predict(fit, data.frame(x1 = 0.5, x2 = 0.5))
predict(fit, data.frame(x1 = 0.5, x2 = 1.5))

# outliers
# How do you find an outlier using a linear model?
# How far away are the data points from the model?

# "residuals" are the differences between the predicted
# values for y and the actual values.

# large (in magnitude) residual => very different => outlier
r = residuals(fit)

out_index = which.max(abs(r))
# Biggest outlier:
d[out_index, ]

predict(fit, d[out_index, ])
with(d, plot(x2, y))

d$x2squared = d$x2^2
fit3 = lm(y ~ ., d)
summary(fit3)

# Categorical variables
n = 100
d2 = data.frame(x1 = seq(n) / n)
d2$sex = sample(c("male", "female", "non_gender_binary"), size = n, replace = TRUE)
noise = rnorm(n)
# TRUE model: (we know because we're simulating)
d2$y = 3*d2$x1 + 6*(d2$sex == "female") + noise



# 123 GO
# What 3 coefficients should this model find?
# 0, 3, 6
# Could the model find a -6?
fit = lm(y ~ ., d2)
summary(fit)

d2$y = 3*d2$x1 + 6*(d2$sex == "female") + noise
predict(fit, data.frame(x1= 1, sex = "male"), interval = "confidence")
predict(fit, data.frame(x1= 1, sex = "female"), interval = "confidence")
predict(fit, data.frame(x1= 1, sex = "non_gender_binary"), interval = "confidence")

mm = model.matrix(fit)
head(d2$sex)
