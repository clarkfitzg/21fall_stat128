# Announcements:
#
# 1. Project 2 drafts due tomorrow (Dec 1) for feedback
# 2. Sign up for a presentation slot next week
# 3. I will be virtual on Thursday, Dec 2
# 4. Next class on presentation skills
# 5. Course evaluations
#
# 123 GO: What's one thing you're looking forward after classes are done?

# Outcomes:
#
# 1. Apply the naive bootstrap to create confidence intervals for univariate statistics
#
# Technique: bootstrap, resampling method.
#
# Reference: https://en.wikipedia.org/wiki/Bootstrapping_(statistics)

# There are MANY variations of bootstrap and resampling methods.
# Our goal today is to understand the basic idea at an intuitive level.

# Problem: 
# Want confidence interval, BUT don't have enough data, or you can't calculate analytically
#
# statistic: f(X), where X is data
# Want (lower, upper) such that f(X) is between lower and upper with some level of confidence
# Univariate statistic- f(X) is just a single number

# Sample mean- can we build confidence intervals for population mean, given data?
# Yes, but through what major theoretical result?
# Central Limit Theorem

n = 100
# rnorm
# r - generate random data from this distribution
# norm - normally distributed
x = rnorm(n, mean = 0) # We know true mean!
tt = t.test(x)

tt$conf.int



# Simple bootstrap procedure to build confidence interval for f(x)
# In our examples, f = mean, then f = median

# 1. Sample with replacement from existing data to create xb
# 2. Calculate statistic on sample: f(xb)
# 3. Repeat many times to create many f(xb)'s
# 4. Estimate confidence intervals by calculating quantiles for f(xb)

# Goal: Confidence interval for population mean
# Just like the t.test
# Claim: Bootstrap works about as well as t.test

# Sampling with replacement
sample(10, replace = TRUE)

# Sample of x with replacement:
xb = sample(x, size = n, replace = TRUE)
# Bootstrapped version of mean:
mean(xb)

mean(x)
# 123 GO:
# If I run lines 67,69 again, will the mean be the same or different?

boot_means = replicate(1000, {
  xb = sample(x, size = n, replace = TRUE)
  # Bootstrapped version of mean:
  mean(xb)
})

hist(boot_means)

# 95% confidence interval
quantile(1:100, 0.75)

quantile(boot_means, c(0.025, 0.975))

tt$conf.int

# R does have a 'boot' package.

# dchisq
# d is for density
# chisq is the name of distribution
x = rchisq(n, df = 4, ncp = 1.2)
xx = seq(from = 0, to = 20, length.out = 1000)
plot(xx, dchisq(xx, df = 4, ncp = 1.2), type = 'l')
hist(x)

# Want a 95% confidence interval for the median
boot_stats = replicate(1000, {
  xb = sample(x, size = n, replace = TRUE)
  # More generally, this is (almost) ANY univariate statistic you like:
  median(xb)
})

# What stats might be a bad idea?

# True median 4.42 - the number we're trying to include
# in our confidence interval.
qchisq(0.5, df = 4, ncp = 1.2)

# 95% confidence interval for the median
ci = quantile(boot_stats, c(0.025, 0.975))
# point estimate: most consistent with above
median(boot_stats)

# What's our best point estimate for the median?
mean(boot_stats)

mean(ci)


# 123 GO: Did the bootstrap "work"?
# yes

# Why is it called the naive bootstrap?
# Where's the danger?

# Bad idea:
boot_max = replicate(1000, {
  xb = sample(x, size = n, replace = TRUE)
  # More generally, this is (almost) ANY univariate statistic you like:
  max(xb)
})

hist(boot_max)

table(boot_max)

# bootstrapping residuals (if we have time)
# 
# y = ax + b + noise
#
# yhat = ax + b  What you predict
# noise = y - yhat  Difference from actual data and prediction

# Can "reconstruct" something like y:
# yboot = yhat + noise
# Bootstrap resamples from the noise

