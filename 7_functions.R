# Announcements:
#
# 1. - Correction- SIR model is a Markov Chain, but is not MCMC (Markov Chain Monte Carlo)
# "A Markov chain or Markov process is a stochastic model describing a sequence of possible events in which the probability of each event depends only on the state attained in the previous event." -Wikipedia

# 2. Project posted as many small, regular assignments.
#   Alternatively, just do the whole thing right now.
#   I'll probably talk about it more in office hours (remind me to record)

# 3. Discord is in, MS Teams is retired.
#   Talk through the project with each other, and with me.


# Notes: Sections 3.2 and 3.3 of text
# https://ucdavisdatalab.github.io/workshop_r_basics/exploring-your-data.html#conditional-expressions

# Outcomes:
#
# 1. Write if() statements, and predict results
# 2. Write R functions

# if() represents conditional statements 

# 123 GO: what's a conditional statement from every day life?
# Example:
# If it's not 100 degrees, I'll go paddling.

# else


# Functions are the HEART of R. ❤️
#
# output = FUN(input)
# 
# input -> FUN -> output


# (mostly) Review:

# Parameter
# Argument
# Body
# Calling

# Let's look at a function:
append

# 123 GO:
# Which arguments does append accept?

# Let's write a function that checks if all numbers are positive.
# Demoing a good process to write a function:
# 1. Write down what you want.
# 2. Check if that functionality already exists.
# 3. Make some experimental data and figure out the code.
# 4. Stick that code in a function

x = c(10, 5)

all(0 < x)

# 123 GO:
# What should I name this function?

all_positive = function(x)
{
    all(0 < x)
}

# Now we can print it out in the console.

# 123 GO:
# Predict these two outcomes
all_positive(0:5)
all_positive(5:10)

# 123 GO:
# What's one good practice for function naming?

# 123 GO:
# What happens when I pass in string arguments?
all_positive(c("one", "two"))

# What's going on?

# 123 GO
# What should all_positive DO when we call it with nonnumeric arguments?
# 1. return TRUE
# 2. return NA
# 3. return NULL
# 4. raise an error
# 5. warn the user

# We get to decide, we're the architects.

all_positive2 = function(x)
{
    if(!is.numeric(x)){
        warning("expected numeric")
        return(NULL)
    }
    all(0 < x)
}

all_positive2("hi")

# 123 GO:
# Did any remaining code in the function run after we hit return()?

all_positive3 = function(x)
{
    if(!is.numeric(x)){
        stop("expected numeric")
    }
    all(0 < x)
}

all_positive3("hi")

# Homework hints
############################################################

# sample, image
