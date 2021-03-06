# Announcements:
#
# 1. Project 2 drafts due tomorrow (Dec 1) for feedback
# 2. Sign up for a presentation slot next week
# 3. I will be virtual on Thursday, Dec 2
# 4. Next class on presentation skills
#
# Outcomes:
#
# 1. Apply the naive bootstrap to create confidence intervals for univariate statistics
#
# Reference: https://en.wikipedia.org/wiki/Bootstrapping_(statistics)

# There are MANY variations of bootstrap and resampling methods.
# Our goal today is to understand the basic idea at an intuitive level.

# Problem: 
# You want a confidence interval for a statistic, but you can't collect more data.

# Like most statistical methods, the bootstrap relies on IID data.
# What does IID mean?

# The central limit theorem says ...
# Why do people care about the central limit theorem?

# Simple bootstrap procedure to build confidence interval for f(x)

# 1. Sample with replacement from existing data to create xb
# 2. Calculate statistic on sample: f(xb)
# 3. Repeat many times to create many f(xb)'s
# 4. Estimate confidence intervals by calculating quantiles for f(xb)

qnorm(0.75)

# How can we get a confidence interval for the quartiles?

n = 100
x = rnorm(n)

tt = t.test(x)

str(tt)
tt$conf.int

bootmeans = replicate(1000, {
    xb_index = sample(n, replace = TRUE)
    xb = x[xb_index]
    mean(xb)
})

hist(bootmeans)

quantile(bootmeans, c(0.025, 0.975))

xx = seq(from = 0, to = 20, length.out = 1000)
plot(xx, dchisq(xx, df = 5, ncp = 1.4), type = "l")

y = rchisq(n, df = 5, ncp = 1.4)

bootq = replicate(1000, {
    yb_index = sample(n, replace = TRUE)
    yb = y[yb_index]
    quantile(yb, 0.75)
})

hist(bootq)

quantile(bootq, c(0.025, 0.975))

qchisq(0.75, df = 5, ncp = 1.4)


# R does have a 'boot' package.

# Why is it called the naive bootstrap?

# bootstrapping residuals (if we have time)
