# Informative comment

library(ggplot2)

# Announcements:

# 1. Discord more active than Teams- check out what's going on.
#   Reactions (👍, 🤔, etc) provide good feedback.

# 123 GO
# Where are you on the initial infection assignment?

# Outcomes:

# 1. Write R scripts
# 2. Predict when variables will be available based on R's lexical scoping rules.

# Review:
# Functions are the building blocks for solving larger problems. Take a divide-and-conquer approach, breaking large problems into smaller steps. Use a short function for each step. This approach makes it easier to:
# 
# Test that each step works correctly.
# Modify, reuse, or repurpose a step.


# Demo R scripting and how to turn in assignment


# 123 GO: What happens if I try to print x before I define it?
x 

# exists() checks if a variable exists.
exists("x")

x = 10

# Variables only exist inside the __scope__ where they were defined.

# Each call to a function create a new __local__ scope.
rescale = function(x, center, scale){
  centered = x - center
  centered / scale
}

# 123 GO:
# Does `centered` exist?
exists("centered")

f = function() {
  z_defined = exists('z')
  z = 42
  z_defined
}

f() # FALSE, meaning z was not defined the FIRST time we called f()

# 123 GO: What will f() return on the 2nd call?
f() # FALSE every single time

# A function can use variables defined outside (non-local), but only if those variables are in scope where the function was defined.

# Variables defined directly in the R console are global and available to any function.

cats = "meow"
get_cats = function() cats
get_cats()

# 123 GO : How many global variables are defined right now?
# 5

create_dogs = function(){
  dogs = "woof woof"
}
get_dogs = function() dogs

create_dogs()

# 123 GO: Will this work (woof woof)?
get_dogs()


get_parrot = function(){
  parrot = "squawk!, this is local function call scope"
  parrot
}
parrot = "Yarrrr, I'm from global scope"

# 123 GO: global or local?
get_parrot()

# Local variables mask (hide) non-local variables with the same name.

# If x is not a function, then we can't call x as if it was a function.
x
x(100) # <-- doesn't make any sense UNLESS x is a function

f = function(){
  a = 10
  b = 20
  c = 30  # <- redefines c
  print(class(c))
  c(a, b, c)
}

# 123 GO: Will this work?
f()
# Yes it works!
# Function calls 

get_cats()

cats = "HISSSS!"

# 123 GO: Will it be meow or HISSS?
get_cats()

# Does __variable lookup__ happens when a function is called, or when it’s defined?
# R uses Dynamic variable lookup.
# R looks up the value of all variables with every single function call.

# Uses global variables.
get_cats = function() cats

# Does not use global variables.
get_cats2 = function(catnoise = "meow") catnoise


append1 = function(x){
  x = c(x, 1)
  x
}

x = 1:5
x
# 123 GO 
# Will the global x have 1 on the end?
# NO- it did not.
append1(x)

# 123 GO: 
# Should we use global variables inside our functions?
# Maybe some are OK and some not?
# Functions are OK to use as global variables.

f = function(x){
  mean(x) + 1  # Where are mean and + defined?
}

f(1:5)

# We have access to 1252 functions just from the base package.
length(ls("package:base"))

# Summary:
# Each function calls create a new local scope (call frame) where local variables:
# 
# 1. Are private
# 2. Exist only within the context of that call
# 3. Mask non-local variables

# packages
############################################################
# A package is a collection of R functions.
#
# Think of a package as the next step beyond an R script.
# We'll write a package for the first project.

# CRAN (comprehensive R archive network) hosts community contributed packages.

# install a package
install.packages("ggplot2")


# load a package for use
library("ggplot2")

ggplot

# 123 GO: Where in your script should you load packages?
# At the top.

search()

# A global variable
ggplot = "oops, wrote over gglot"

# Reach in to the package and get the function
ggplot2::ggplot
# PACKAGE::FUNCTION

# Homework questions?
############################################################

# Exactly 3 possible states in SIR model:
# 0 Susceptible
# 1 Infected
# 2 Removed

x = 1:10
# Vectorized function used to replace two values based on a condition
ifelse(x %% 2 == 0, "even", "odd")

# Different from control flow if else:
if(TRUE){
  print("inside some block")
} else {
  "something else"
}

