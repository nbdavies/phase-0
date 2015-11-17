# Calculate the mode Pairing Challenge

# I worked on this challenge with Sean Massih

# I spent 0.75 hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented.

# 0. Pseudocode

# What is the input? An array of a number of strings or numbers.
# What is the output? (i.e. What should the code return?) An array of the most frequently occuring values.
# What are the steps needed to solve the problem? 1. Define a method which accepts an array in the argument.
# 2. Initialize a hash to store the strings/numbers in our array as keys, and the occurunces of theses strings/numbers as values.
# 3. Iterate over the array to add key/value pairs to the hash.
# 4. Return items from the hash with the highest value(s).


# 1. Initial Solution
def mode (array)
  maximum=0
  counts = Hash.new(0)
  array.each do |value|
    counts[value]+=1
    if counts[value]>maximum
      maximum = counts[value]
    end
  end
  counts.select {|key,value| value == maximum}.keys
end

# 3. Refactored Solution
def mode (array)
  counts = Hash.new(0)
  array.each do |value|
    counts[value]+=1
  end
  counts.select {|key,value| value == counts.values.max}.keys
end

# 4. Reflection

#Which data structure did you and your pair decide to implement and why?
# We both had an intuition that the in-between structure would be a hash, and worked out that it should hold the counts per array value.

#Were you more successful breaking this problem down into implementable pseudocode than the last with a pair? 
# I haven't done 5.2 yet. I think it was helpful to have Sean's input though. On my own it's tempting to leave steps a little value.

#What issues/successes did you run into when translating your pseudocode to code?
# We ran into the fact that the hash needed to have a default value of zero, that adding 1 to nil wouldn't work. 
# For getting the keys back out of the hash, we could have written that out using simpler methods, but when we were researching how to do it, we came across the methods we needed to do it more cleanly.

#What methods did you use to iterate through the content? Did you find any good ones when you were refactoring? Were they difficult to implement?
# We just used the .each method on the array. I could see there being a way to write it using .count, but I don't think it would reduce complexity. So the block of code setting up the "counts" hash didn't change much in refactoring.
# For hash methods, we already had the .select method and .keys method in our initial solution, and then the combination .values.max simplified things further.
# We looked for a good way to do this without a hash at all, but didn't find anything really.