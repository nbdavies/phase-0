# Pad an Array

# I worked on this challenge with: Monique Williamson 

# I spent 1.5 hours on this challenge.


# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# 0. Pseudocode

# What is the input? 
#   * An array to pad
#   * The size to pad it out to (positive integer)
#   * Default value for new nodes (default to nil)
# What is the output? (i.e. What should the code return?)
#   * Same array from input, but with new nodes added (Destructive)
#   * A copy of the array (non-destuctive) with new nodes
# What are the steps needed to solve the problem?
#   1. Define a method with parameters
#   2. (Non-destructive) Create a new array for output
#   3. Calculate current array size
#   4. If array is already large enough, then return it.
#   5. Until the array size is equal to the minimum, add another node node with the default value.
#   6. Return the array.
#   


# 1. Initial Solution
def pad!(array, min_size, value = nil) #destructive
  if array.size >= min_size
    return array
  end
  while array.size < min_size do
    array << value
  end
  return array
end

def pad(array, min_size, value = nil) #non-destructive
  array_2 = Array.new(array)
  if array_2.size >= min_size
    return array_2
  end
  while array_2.size < min_size do
    array_2 << value
  end
  return array_2
end



# 3. Refactored Solution
def pad!(array, min_size, value = nil) #destructive
 array.insert(0, *Array.new([0,min_size-array.length].max,value))
end


def pad(array, min_size, value = nil) #non-destructive
  array+Array.new([0,min_size-array.length].max, value)
end


# 4. Reflection
#Were you successful in breaking the problem down into small steps?
#  Yeah I think the pseudocode on this ended up being pretty granular.

#Once you had written your pseudocode, were you able to easily translate it into code? What difficulties and successes did you have?
#  The initial code was pretty straightforward to create off of the pseudocode. There were a couple points when we fumbled for the right syntax, but we got past it.

#Was your initial solution successful at passing the tests? If so, why do you think that is? If not, what were the errors you encountered and what did you do to resolve them?
#  One tricky thing about the non-destructive solution was copying the input array to a separate array. I thought that would be just a variable assignment (a = b), but found out that it needed to use Array.new(array).

#When you refactored, did you find any existing methods in Ruby to clean up your code?
#  Yeah Array.new ended up coming in handy again, for creating an array with a certain number of elements and a default value. We used .size and .length interchangeably to get the size of the input array. And then .max to get the maximum between two numbers, and array addition to take two arrays and combine them (similar to .concat).

#How readable is your solution? Did you and your pair choose descriptive variable names?
#  We mostly just used the arguments of the method. But for the non-destructive method we needed another array to modify, and used array_2 for that.

#What is the difference between destructive and non-destructive methods in your own words?
#  Destructive methods are ones that modify the objects they're called upon. Non-destructive methods do not. In the case of a method where the return value is a modified version of an argument, it was actually more straightforward to write it destructively, and then in the non-destructive version, create a copy of the input argument to modify.