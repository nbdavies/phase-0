# Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.
# I spent 1 hours on this challenge.

# Pseudocode

# Input: array of labels for the sides of the dice
# Output: an object of class Die with that many sides, labeled accordingly.
# Steps: Create a class Die, with methods for: 
# * initializing an object of this class:
#    This takes the array of side labels. This array is stored as an instance variable.
# * returning an array of its sides
#    This retrieves the array of labels and calculates the count of that array
# * rolling the die
#   This calculates a number between 0 and sides - 1, and returns the value at that position in the labels array.


# Initial Solution

class Die
  def initialize(labels)
    raise ArgumentError.new("A die requires sides") if labels == []
    @labels=Array.new(labels)
  end

  def sides
    return @labels.count
  end

  def roll
    side = rand(0..self.sides-1)
    return @labels[side]
  end
  
end

# Refactored Solution

class Die
  def initialize(labels)
    raise ArgumentError.new("A die requires sides") if labels == []
    @labels=Array.new(labels)
  end

  def sides
    return @labels.count
  end

  def roll
    return @labels[rand(0..self.sides-1)]
  end
  
end

# Reflection
=begin
What were the main differences between this die class and the last one you created in terms of implementation? Did you need to change much logic to get this to work?
Previously, the only instance variable was the number of sides. Now the instance variable needed to be the full array of all the sides.

What does this exercise teach you about making code that is easily changeable or modifiable? 
Modularizing helps, meaning having methods that each do one easily defined thing.

What new methods did you learn when working on this challenge, if any?
I found out that I didn't need a Random.new object like I used in 5.7, that I could use rand on its own. Also how to reference the nth element of the @labels array.

What concepts about classes were you able to solidify in this challenge?
It helped me explore how instance variables are related to their object. There was one point where I was trying to check what my @labels array had in it, and to output that, I wrote an additional method just to return the array. 
=end