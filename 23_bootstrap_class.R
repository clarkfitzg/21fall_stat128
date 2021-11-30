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


# Simple bootstrap procedure to build confidence interval for f(x)

# 1. Sample with replacement from existing data to create xb
# 2. Calculate statistic on sample: f(xb)
# 3. Repeat many times to create many f(xb)'s
# 4. Estimate confidence intervals by calculating quantiles for f(xb)


# R does have a 'boot' package.

# Why is it called the naive bootstrap?

# bootstrapping residuals (if we have time)
