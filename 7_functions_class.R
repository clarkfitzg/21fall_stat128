# Announcements:
#
# 1. - Correction- SIR model is a Markov Chain, but is not MCMC (Markov Chain Monte Carlo)
# "A Markov chain or Markov process is a stochastic model describing a sequence of possible events in which the probability of each event depends only on the state attained in the previous event." -Wikipedia

# 2. Project posted as many small, regular assignments.
#   Alternatively, just do the whole thing right now.
#   I'll probably talk about it more in office hours (remind me to record)

# 3. Discord is in, MS Teams is retired.
#   Talk through the project with each other, and with me.

# 4. Who wants to count this course towards a math/stats minor?
#  and you need advising 4 people



# Notes: Sections 3.2 and 3.3 of text
# https://ucdavisdatalab.github.io/workshop_r_basics/exploring-your-data.html#conditional-expressions

# Outcomes:
#
# 1. Write if() statements, and predict results
# 2. Write R functions

# if() represents conditional statements 

# 123 GO: what's a conditional statement from every day life?
# Example:
# If it's < 100 degrees I'll go paddle on the river.

x = 10
if(x < 100){
  print("x is small.") 
}

# 123 GO:
# Did the code on line 34 run?
# Yes.

# 123GO:
# What will get printed?
x = 10000
if(x < 100){
  # branches
  print("x is small.") 
} else {
  # branches
  print("x is large")
}


# Functions are the HEART of R. ❤️
#
# output = FUN(input)
#
# input --->  FUN ----> output

# Review:

# Parameter: variable that function accepts
# Argument: the object you actually pass into a function call
# Body: The code inside the function
# Call: To use the function FUN()

# 123 GO:
# Which arguments does append accept?
# The inputs to the function append:
# Signature:
# function (x, values, after = length(x)) 

# General form:
# function (ARG1, ARG2, ...) {
#   BODY
#   object to return
# } 

# inputs are x, values, and after


# Demoing a good process to write a function:
# 1. Write down what you want IN ENGLISH to clarify your own thoughts.
# 2. Check if that functionality already exists.
# 3. Make some experimental data and figure out the code.
# 4. Stick that code in a function

x = c(10, 100, 20)
0 < x
all(0 < x)

# Goal: Check if all numbers in a vector are positive.
positive = function(x){
  all(0 < x)
}


p = function(x){
  all(0 < x)
}

positive(x)


# 123 GO:
# Predict these two outcomes

positive(0:5)

positive(5:10)

# 123 GO:
# What's one good practice for function naming?
# 1. Name it for what it does, descriptive
# 2. specifically what it does
# 3. short, but not too short, one character usually iffy


# 123 GO:
# What happens when I pass in string arguments?
# 1. Error
# 2. Get TRUE or FALSE
# 3. R somehow understood "one" to mean 1
# 4. Warning message
positive(c("one", "two"))
# TRUE

# What happened?

0 < "one"
0 < "a" # TRUE
0 < "." # FALSE

"0" < "."

# String vs numeric comparison
"20" < "100"
20 < 100


# 123 GO
# What should our function DO when we call it with nonnumeric arguments?
positive(c("one", "two"))
# 1. Error
# 2. Stay returning true
# 3. R somehow understood "one" to mean 1
# 4. Warning message
# 5. Return NULL
# 5. Return NA

# We get to decide, we're the architects 🤠

positive2 = function(x){
  if(!is.numeric(x)){
    warning("Hey- this should be numeric!")
    warning("Expected numeric argument")
    # 123 GO:
    # Did any remaining code in the function run after we hit return()?
    # NO
    # Once you hit return, you exit the function
    return(NULL)
  }
  
  # remaining code:
  all(0 < x)
}

positive2(1:5)

positive3 = function(x){
  if(!is.numeric(x)){
    # Throwing an error:
    stop("Expected numeric argument")
  }
  all(0 < x)
}


positive3(1:5)
positive3("hello")

positive4 = function(x){
  if(!is.numeric(x)){
    # Throwing an error:
    stop("Expected numeric argument")
  } else if(is.null(x)) {
    stop("x was NULL!!!!")
  }
  all(0 < x)
}

positive4("hello")
positive4("hello")

name = "Joseph"
name = "Austin"
name = "Melissa"
if(name == "Joseph"){
  "hi Joseph"
} else if(name == "Austin"){
  "there's Austin"
} else {
  "Just hi."
}

# Homework hints
############################################################

# sample, image
x = matrix(0, nrow = 3, ncol = 5)
x[1, 1] = 1
x[1, 5] = 2
x
image(t(x))

sir_colors = c("white", "red", "grey")
image(t(x), col = sir_colors)

# populating random data.
y = sample(c(TRUE, FALSE), size = 10, replace = TRUE, prob = c(0.1, 0.9))

y = sample(c("I", "S"), size = 10, replace = TRUE, prob = c(0.1, 0.9))

# seeding the RNG random number generator means you get exactly the same
# random data.
set.seed(1098)
y = sample(c("I", "S"), size = 10, replace = TRUE, prob = c(0.1, 0.9))
y

# 123 GO:
# Should y be mostly TRUE or mostly FALSE?

matrix(y, nrow = 2)
image(t(y))

