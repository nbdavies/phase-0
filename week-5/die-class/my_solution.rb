# Die Class 1: Numeric

# I worked on this challenge by myself.

# I spent 0.5 hours on this challenge.

# 0. Pseudocode
#    Create a class of object called "Die"
#    Give it methods:
# --Initialize--
# Input: A number of sides
# Output: A "die" object with that number of sides
# Steps: Assign the number of sides to an instance variable
# --Sides--
# Input: called upon a object of class "Die"
# Output: number of sides of that object
# Steps: Retrieve number of sides from instance variable and return it.
# --Roll--
# Input: called upon an object of class "Die"
# Output: Returns a random positive integer less than or equal to the number of sides.
# Steps: Retrieve the instance variable for this die's number of sides.
#        Calculate and return a random integer between 1 and the number of sides.

# 1. Initial Solution

class Die
  def initialize(sides)
    if sides < 1 
      raise ArgumentError.new("Sides of Die must be positive integer.")
    end
    @sides = sides
  end

  def sides
    return @sides
  end

  def roll
    return Random.new.rand(1..@sides)
  end
end

# 3. Refactored Solution
class Die
  def initialize(sides)
    if sides < 1 
      raise ArgumentError.new("Sides of Die must be positive integer.")
    end
    @sides = sides
  end

  def sides
    return @sides
  end

  def roll
    return Random.new.rand(1..self.sides)
  end
end
# I thought it would be cleaner to call the method .sides rather than invoke the instance variable directly.

# 4. Reflection

#What is an ArgumentError and why would you use one?
# Where we have seen argument errors before has been when the arguments we pass to a method don't match the number the method is expecting. Now we see that we can make argument errors occur in other times where the arguments passed in are not valid for the method to be performed.

#What new Ruby methods did you implement? What challenges and successes did you have in implementing them?
# I didn't really have any hiccups on this one. I wasn't familiar with how to generate random numbers, so I read up on the Random class in the Ruby docs, and from there I knew what I was doing even in the initial solution. Though that didn't leave a lot of room for refactoring.

#What is a Ruby class?
# That's what we're all taking at DBC right now, right? Just kidding! Classes in Ruby are a way to classify an object, so that it can inherit properties and methods of that class. So it's sort of a blueprint for the creation and the allowed behavior of a type of object. 

#Why would you use a Ruby class?
# If you have a type of object that you want to have certain attributes, certain methods available for how it behaves, then it makes sense to create that at the Class level. 

#What is the difference between a local variable and an instance variable?
# A local variable only exists within the context of the method that defines it. An instance variable applies to an object, everywhere that object is used, which could be across different methods.

#Where can an instance variable be used?
# It's a variable of that object, so it can be used in any context where the object itself is present.