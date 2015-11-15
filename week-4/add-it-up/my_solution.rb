# Add it up!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge with Albert Hahn.

# 0. total Pseudocode
# make sure all pseudocode is commented out!

# Input: an array
# Output: total of the elements in the array (integer or float)
# Create a method that will add up the elements in the array
# For each for element in the array...
#  Get the value and add it into the total
# Return the total

# Steps to solve the problem.

# 1. total initial solution
#def total (array)
#  total = 0
#  array.each do |number|
#    total = total + number
#  end
#return total
#end

# 3. total refactored solution
def total (array)
  return array.reduce(:+)
end

# 4. sentence_maker pseudocode
# make sure all pseudocode is commented out!
# Input: array
# Output: a sentence made of the values in the array (with the first letter capitalized, spaces between words, and a period at the end)
# Create a method that takes an array
# For each element in the array...
#   If it's the first element in the array, capitalize it and store it to a string variable.
#   If it's not the first element, add a space and the current word to the string variable.
# Add a period to the string and return the string.
# 
# Steps to solve the problem.

# 5. sentence_maker initial solution
#def sentence_maker (array)
#  sentence = ""
#  array.each do |word|
#    word = word.to_s
#    if sentence == "" 
#      sentence = word
#    else
#      sentence = sentence + " " + word
#    end
#  end
#  return sentence.capitalize + "."
#end

# 6. sentence_maker refactored solution
def sentence_maker (array)
  return array.join(" ").capitalize + "."
end