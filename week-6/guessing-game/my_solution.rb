# Build a simple guessing game

# I worked on this challenge by myself.
# I spent [1] hours on this challenge.

# Pseudocode

# Method: initialize
# Input: answer (integer)
# Output: object of class GuessingGame
# Steps: store the argument as an instance variable.

# Method: guess
# Input: guess (integer)
# Output: :high, :correct, or :low, depending on the relation of the guess to the answer
# Steps: retrieve the answer. Compare it to the guess. Return the appropriate symbol. Also store the symbol in an instance variable.

# Method: solved?
# Input: no arguments.
# Output: boolean, true if the latest guess was correct.
# Steps: retrieve the instance variable for the latest value of .guess. If it's :correct, return True.

# Initial Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def guess(guess)
    if guess == @answer
      @last_result = :correct
    elsif guess > @answer
      @last_result = :high
    else
      @last_result = :low
    end
  end
  
  def solved?
    @last_result == :correct
  end
       
end

# Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
  end

  def guess(guess)
    case guess <=> @answer 
    when 0
      @last_result = :correct
    when 1
      @last_result = :high
    else   #Only other option is -1
      @last_result = :low
    end
  end
  
  def solved?
    @last_result == :correct
  end
       
end

# Reflection
=begin
How do instance variables and methods represent the characteristics and behaviors (actions) of a real-world object?
Instance variables are like the characteristics of an object. Like for a physical object, color, size, shape, etc. Class methods are like things you can do with that type of object. For instance you can turn on a TV but you can't turn on an orange, and you can peel an orange but not a TV.

When should you use instance variables? What do they do for you?
They store information about that instance (object of a certain class), which you can reference across methods. You can use them to describe the current state of that object, but you wouldn't want to store information in them that has nothing to do with the object.

Explain how to use flow control. Did you have any trouble using it in this challenge? If so, what did you struggle with?
It didn't occur to me until writing the third method that I would need some way to "remember" the outcome of the previous guess. From there I figured out that I needed to make that an instance variable of the GuessingGame object. In theory, a user could be carrying on multiple games with different answers and most recent guesses, and I wouldn't want to confuse them by not keeping track of the most recent guess-result for each specific game.

Why do you think this code requires you to return symbols? What are the benefits of using symbols?
Using strings can be good if you need to manipulate them in ways particular to a string, like changing case, appending characters, replacing characters, etc. Doing that on a symbol would just turn it into a different symbol. But we don't need to do any string manipulation on correct, high, and low. We don't need them to stand for anything else, they're just used as the literal words they are. So using symbols here makes sense.
=end