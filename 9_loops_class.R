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

# apply function

# Alternatively, we can do explicit looping.


# 123 GO: Which is cleanest?
# vectorization, apply functions, explicit loop

# 123 GO: Which work with non vectorized functions?

# 123 GO: Which is most flexible?


# Example: First dozen terms of Fibonacci sequence
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89


# 123 GO: Can I generate the Fibonacci sequence with a vectorized or apply function?


# Consider our SIR model project.
# 123 GO: For a 10 x 10 grid, what is the maximum number of iterations?

# Suppose we generalize the model so that squares can be infected multiple times.
# 123 GO: What is the maximum number of iterations for this case?


# Let's use a while loop to find 144, the first Fibonacci number greater than 100.



# Details on loops
############################################################

# 123 GO: Do we need to preallocate?

# We can iterate over sequences of integers.
# 123 GO: More generally, what kind of objects can we iterate over?


# break and next


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
