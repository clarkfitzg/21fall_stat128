# Announcements
# 1. Thursday, Sep 30th Math major/minor advisor will join class

# Graded the first parts of the project
# Grades are low :( 
# I don't want you to get discouraged.

# Options I'm considering:
# 1. Allow resubmissions
#   1. full credit
#   2. partial credit - difference between original and resubmission
# 2. Let you fix issues / comments when you turn in full project in a couple weeks
# 3. Extend due dates

# 1, 2, 3
# 1 is the most popular.
# I will follow up with an announcement and a due date.

# Outcomes
# 1. Describe when to use explicit loops 
# 1. Iterate using for and while loops

# Review:
# Vectorization and apply functions both use iteration: repeating a computation for each element in a data structure.

x = c(1, 25, 4)

# vectorization
sqrt(x)

# apply function
sapply(x, sqrt)

# Alternatively, we can do explicit looping.
result = rep(NA, 3)
for(i in seq_along(x)){
  result[i] = sqrt(x[i])
}


# 123 GO: Which is cleanest?
# vectorization, apply functions, explicit loop
# Vectorization


# 123 GO: Which work with non vectorized functions?
# apply functions, explicit loop

# 123 GO: Which is most flexible?
# vectorization, apply functions, explicit loop

# Loops are the most flexible.

# Example: First dozen terms of Fibonacci sequence
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
# f0 = 0
# f1 = 1
# f_{n+2} = f_{n+1} + f_{n}

# DRY - Don't repeat yourself
# 123 GO: Where did I repeat myself below?
# 10 shows up twice- it's a "magic number"
# Avoid them.

# 10 is a default for n
genfib = function(n=10){
  fib = c(0, 1, rep(NA, n))
  for(i in seq(n)){
    # f_{n+2} = f_{n+1} + f_{n}
    fib[i + 2] = fib[i+1] + fib[i]
  }
  fib
}

# No arguments => use the default
genfib()

# Passed in 20 as an argument, which overrides the default.
genfib(20)

 


# 123 GO: Can I generate the Fibonacci sequence with a vectorized or apply function?
# No, it's not possible

# You MUST use explicit loops when some of the iterations depend on results from
# previous iterations.
# Loops can do things that apply function cannot.



# Consider our SIR model project.
# 123 GO: For a 10 x 10 grid, what is the maximum number of iterations?
# 100 or 99

# Suppose we generalize the model so that squares can be infected multiple times.
# 123 GO: What is the maximum number of iterations for this case?
# Infinite

# So we use while loops
# while(any_infections(X)){
#   X = iterate(X)
#   plotSIR(X)
#   Sys.sleep(0.2)
# }

# Let's use a while loop to find 144, the first Fibonacci number greater than 100.
f0 = 0
f1 = 1

# Buggy code:
while(f1 <= 100){
  f0 = f1
  f1 = f0 + f1
}
f1


f0 = 0
f1 = 1
while(f1 <= 100){
  f0f1 = f0 + f1  # <-- a temporary variable
  f0 = f1
  f1 = f0f1
}
f1

# Details on loops
############################################################

x = c(1, 25, 4)

result = rep(NA, length(x)) # Preallocate the space to save the result
for(i in seq_along(x)){  # i takes on the values inside seq_along(x)
  print(i)
  result[i] = sqrt(x[i])
}

c(sqrt(1), sqrt(25))
append(1:5, 10)
# 123 GO: Do we need to preallocate?
# No, I could've used c() or append() to "grow" my result at every iteration.
# This is extremely inefficient in R.
# So don't do it.
# Best practice is to preallocate.

# We can iterate over sequences of integers.
seq_along(x)
# 123 GO: More generally, what kind of objects can we iterate over?
# Anything has length or positional access, it makes sense to iterate over.
# x[1]
# x[[2]]

letters
for(l in letters){
  print(toupper(l))
}

# break and next
messages = c("Hi", "hello", NA, "Goodbye")

for(msg in messages){
  if(is.na(msg))
    break
  message(msg)
}

for(msg in messages){
  if(is.na(msg))
    next
  message(msg)
}

# Summary
# try iteration strategies in this order:
# 
# 1. vectorization
# 2. apply functions
# 3. for/while-loops
#   - if some iterations depend on others.
#   - while-loop if the number of iterations is unknown.
# 4. recursion


# Recursion

# Recurrence relationship in math:
# f1 = 0
# f2 = 1
# f_{n+2} = f_{n+1} + f_{n}

# Recursive functions call themselves.

fib = function(n){
  if(n == 1){
    0
  } else if(n == 2){
    1
  } else {
    # Now I can use recurrence
    fib(n-2) + fib(n-1)  # <--- calling itself
  }
}

fib(10)
fib(11)
fib(12)
fib(13)

m = matrix(c(0, 1, 2, 0, 1))
unique(m)

x = matrix(c(0, 0, 0, 1, 1, 0), nrow = 2)
close_contact = sample(c(TRUE, FALSE), size = 2*3, replace = TRUE)
close_contact = matrix(close_contact, nrow = 2, ncol = 3)

x2 = x
possibly_infected = (x == 1)

x2[close_contact & possibly_infected] = 0

