# Announcements
# 1. Thursday, Sep 30th Math major/minor advisor will join class

# Outcomes
# 1. Describe when to use explicit loops 
# 1. Iterate using for and while loops

# 123 GO: 
# What's your word of the day?

# Review:
# Vectorization and apply functions both use iteration: repeating a computation for each element in a data structure.

x = c(1, 25, 4)

# vectorization
sqrt(x)

# apply function
sapply(x, sqrt)

# Alternatively, we can do explicit looping.

# Preallocate
result = rep(NA, length(x))
# iterate over a sequence the same length as x
for(i in seq_along(x)){
    # write in individual result
    result[i] = sqrt(x[i])
}
result

# 123 GO: Which is cleanest?
# vectorization, apply functions, explicit loop

# 123 GO: Which work with non vectorized functions?

# 123 GO: Which is most flexible?


# Example: First dozen terms of Fibonacci sequence
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89

n = 10
fib = c(0, 1, rep(NA, n))
for(i in seq(n)){
    fib[i + 2] = fib[i] + fib[i+1]
}
fib

# 123 GO: Can I generate the Fibonacci sequence with a vectorized or apply function?

# Use explicit loops when some or all of the iterations depend on results from other iterations.

# for loops require iterating through some object, and usually these objects are finite, which means the iteration stops eventually.
# Consider our SIR model project.
# In each iteration, new infections pop up, and formerly infected become removed.
# 123 GO: For a 10 x 10 grid, what is the maximum number of iterations?

# Suppose we generalize the model so that squares can be infected multiple times.
# 123 GO: What is the maximum number of iterations for this case?

# X = SIR states
while(any_infections(X)){
    X = iterate(X)
}


# Let's use a while loop to find 144, the first Fibonacci number greater than 100.

f0 = 0
f1 = 1

# Buggy code:
while(f1 < 100){
    f0 = f1
    f1 = f0 + f1
}
f1

# 123 GO: What went wrong?

# We'd really like a simultaneous update of f0 and f1

# fixed:
f0 = 0
f1 = 1
while(f1 < 100){
    f0f1 = f0 + f1
    f0 = f1
    f1 = f0f1
}
f1

# Point: Loops with data dependencies can be tricky!




# Details on loops
############################################################
x = c(1, 25, 4)

# Preallocate
result = rep(NA, length(x))
# iterate over a sequence the same length as x
for(i in seq_along(x)){
    # i is called the induction variable
    # write in individual result
    result[i] = sqrt(x[i])
}
result


c(result, sqrt(16))
# 123 GO: Do we need to preallocate?

# We can iterate over sequences of integers.
# 123 GO: More generally, what kind of objects can we iterate over?
letters
for(l in letters){
    print(toupper(l))
}

# break and next

my_messages = c("Hi", "Hello", NA, "Goodbye")

for (msg in my_messages) {
      if (is.na(msg))
              break
  message(msg)
}


for (msg in my_messages) {
      if (is.na(msg))
              next
  message(msg)
}


# Summary
# try iteration strategies in this order:
# 
# 1. vectorization
# 2. apply functions
# 3. for/while-loops
#   - for-loop if some iterations depend on others.
#   - while-loop if the number of iterations is unknown.
# 4. recursion


# Recursion
fib = function(n){
    if(n == 1)
        0
    else if (n == 2)
        1
    else
        # The function calls itself:
        # This is the defining feature of recursion.
        fib(n-2) + fib(n-1)
}

fib(12)
fib(13)
