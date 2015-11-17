# Numbers to Commas Solo Challenge

# I spent 2 hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# 0. Pseudocode

# What is the input? a positive integer
# What is the output? (i.e. What should the code return?) 
#   The same integer formatted as a string with commas where appropriate:
#   "1,000", "100", "0", "100,000", "1,000,000", etc.
# What are the steps needed to solve the problem?
#  Turn the integer into a string.
#  Starting from the end of the string, take chunks of 3 character and put a comma in front of them, and prepend that to a new string, until there 3 or fewer characters left.
#    WHILE length is greater than three...
#      My new string is: (comma) plus (last three digits of old string) plus (whatever my new string was before)
#      Take last three digits off of the old string
#    After that, add the remaining (three or fewer) digits onto the front of the new string.


# 1. Initial Solution
#def separate_comma (number)
#  number=number.to_s
#  new_number=""
#  while number.length > 3
#    new_number=new_number+","+number[-3..-1]
#    number=number[0..-4]
#  end
#  new_number=number+new_number
#end


# 2. Refactored Solution

# I have a slightly refactored version of the code above...
def separate_comma (number)
  number=number.to_s.reverse
  new_number=""
  while number.length > 3
    new_number=number.slice!(0..2)+","+new_number
  end
  new_number += number
  new_number.reverse
end
# And then I came up with something very different from there...

#def separate_comma (number)
#  number=number.to_s.reverse.split(//).each_slice(3).map {|triplet| triplet.join}.join(",").reverse!
#end

# There is a grotesque beauty to this solution...
# 1. Convert the number to a string ("1000000")
# 2. Reverse the string ("0000001")
# 3. Split the string into an array by individual character (["0","0","0","0","0","0","1"])
#      I couldn't find a way to split it into 3-character chunks right away.
# 4. For each set of 3 array elements... 
#      Join them into one element of 3 characters ("000","000","1")
# 5. Join the resulting array back into a string, with comma delimiter. ("000,000,1")
# 6. Reverse that string. ("1,000,000")
# Voila! 

# 3. Reflection
# What was your process for breaking the problem down? What different approaches did you consider?
# My process...I just thought about how I would take a number apart and put in commas, if I had to do it myself. In my initial solution, I took 3-character chunks off of the end of the input and added them onto the start of the output. Dismantling the input as I went seemed like a good way to know when I was done.

#Was your pseudocode effective in helping you build a successful initial solution?
# Yeah I initially followed the pseudocode pretty closely.

#What new Ruby method(s) did you use when refactoring your solution? Describe your experience of using the Ruby documentation to implement it/them (any difficulties, etc.). Did it/they significantly change the way your code works? If so, how?
# In my initial refactoring, instead of handling negative indices and doing the backwards construction, I thought it would be more straightforward to reverse the entire string, so that the "remainder" part is at the end. I also found the slice method to do two of my steps at once.
# Then I went further afield and refactored it to use array methods that I had seen in the Black book.

#How did you initially iterate through the data structure?
# I didn't use an iterator exactly, I just kept chopping digits off of the input until there were 3 or fewer digits left. I could have looped a fixed number of times, or had a variable counter, but there was no need.

#Do you feel your refactored solution is more readable than your initial solution? Why?
# Maybe? the slice! method is efficient. Reversing the entire string and then reversing it back might be hard for some people to follow, and might not make the rest of it very much better.
# My one-line solution is not so readable as it is, but it would be trivially broken out into multiple lines for clarity.