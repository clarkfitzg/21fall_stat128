# Announcements:

# 1. Discord more active than Teams- check out what's going on.
#   Reactions (👍, 🤔, etc) provide good feedback.

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

# Variables only exist inside the __scope__ where they were defined.

# Each call to a function create a new __local__ scope.
rescale = function(x, center, scale) {
    centered = x - center
    centered / scale
}

centered


f = function() {
    z_defined = exists("z")
    z = 42
    
    z_defined
}

f()

# 123 GO: Does z exist?


# 123 GO: What will be the value of f() when I call it again?
# TRUE, FALSE, or hmmm...

# What does this imply?


# A function can use variables defined outside (non-local), but only if those variables are in scope where the function was defined.

# Variables defined directly in the R console are global and available to any function.

cats = "meow"
get_cats = function() cats
get_cats()

# 123 GO: Which global variables are defined right now?


create_dogs = function() {
      dogs = "woof woof bark"
}
get_dogs = function() dogs
create_dogs()

# 123 GO: Did create_dogs define a new global variable dogs?

# 123 GO: Will this function call have an "object not found" error?
get_dogs()



get_parrot = function() {
    parrot = "squawk!"
    parrot
}
parrot = "Yarrr"

# parrot is defined globally and locally.
# 123 GO: Which version will we see in the function call?
# squawk! = local
# Yarrr = global
get_parrot()

# Local variables mask (hide) non-local variables with the same name.

# If x is not a function, then we can't call x as if it was a function.
x = 1
x(3) # <-- Doesn't make any sense

f = function(x) {
    a = 10
    b = 20
    c = 30
    print(class(c))
    c(1, 2, 3)
}

# 123 GO: 
# What *should* happen if a local variable that is not a function masks a function?


# Does variable lookup happens when a function is called, or when it’s defined?
# When called. This is __dynamic lookup__

cats = "meow"
get_cats = function() cats
get_cats()
cats = "HISSSS"
get_cats()

# 123 GO:
# SHOULD we use global variables inside our functions?


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

ggplot

# load a package for use
library("ggplot2")

ggplot

# 123 GO: Where in your script should you load packages?
# 1. At the top.
# 2. Immediately before the first use of a function from that package.
