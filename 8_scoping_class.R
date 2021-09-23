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

# A function can use variables defined outside (non-local), but only if those variables are in scope where the function was defined.

# Variables defined directly in the R console are global and available to any function.


# Local variables mask (hide) non-local variables with the same name.

# If x is not a function, then we can't call x as if it was a function.


# Does variable lookup happens when a function is called, or when it’s defined?


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


# load a package for use

# 123 GO: Where in your script should you load packages?
# 1. At the top.
# 2. Immediately before the first use of a function from that package.
