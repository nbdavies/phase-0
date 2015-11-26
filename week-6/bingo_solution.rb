# A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent [#] hours on this challenge.


# Release 0: Pseudocode
# Outline:
# Create a class BingoBoard with the following methods...
# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)
  # Input: n/a
  # Output: letter+number combination (string)
  # Steps: Calculate a random integer from 1 to 5. Map that to the letter in "BINGO". 
  #        Calculate a random integer from 1 to 100. Append that to the letter, and return the result.

# Check the called column for the number called. If the number is in the column, replace with an 'x'
  # Input: letter+number combination (string)
  # Output: boolean value for whether it was present on the BingoBoard object. Also modify that object to have an X in the spot.
  # Steps: Take the first character of the input and translate it to the column number.
  #        Iterate through the rows, and compare the rest of the string (the number) to the value in that row/column.
  #        If found, return true and replace the value in the array with "X". Otherwise return false.

# Display a column to the console
  # Input: one of the letters in "BINGO"
  # Output: nil / Print the column of numbers under that letter to the console
  # Steps: Translate the input to a column number (0 to 4).
  #        For each row on the BingoBoard, retrieve the value in that position of the sub-array.
  #        Print out just those values.

# Display the board to the console (prettily)
  # Input: n/a
  # Output: nil / Print the entire board to the console
  # Steps: Iterate through each row. Take the array for the row, and join the values into one string with spaces between them. Print that string on a new line.

# Initial Solution

class BingoBoard

  def initialize(board)
    @bingo_board = board
  end

  def call_number
    letter = "BINGO"[rand(0..4)]
    number = rand(1..100)
    letter + number.to_s
  end
  
  def check? (guess)
    letter = guess[0]
    number = guess[1..-1].to_i
    column = "BINGO".index(letter)
    @bingo_board.map! do |row|
      if row[column] == number
        row[column] = "X"
        return true
      end
    end
    return false
  end
  
  def print_column (letter)
    column = "BINGO".index(letter)
    @bingo_board.each do |row|
      puts row[column]
    end
  end
  
  def display
    @bingo_board.each do |row|
      puts row.join(" ")
    end
  end
  
end

# Refactored Solution
class BingoBoard
  attr_accessor :bingo_board
  
  def initialize(board)
    self.bingo_board = board
  end

  def call
    "BINGO"[rand(0..4)] + rand(1..100).to_s
  end
  
  def check? (guess)
    self.bingo_board=bingo_board.transpose
    bingo_board[column(guess[0])].map! {|num| num==guess[1..-1].to_i ? "X" : num}
    self.bingo_board=bingo_board.transpose
  end
  
  def column (letter) # Helper method to translate letter to column number
    "BINGO".index(letter)
  end
  
  def print_column (letter)
    bingo_board.transpose[column(letter)].each {|num| puts num}
  end
  
  def display
    bingo_board.each do |row|
      puts row.join(" ")
    end
  end
  
end


#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE
board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]

new_game = BingoBoard.new(board)


#Reflection
=begin
How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?
I didn't have too much trouble, once I really started thinking about the problem in small steps.

What are the benefits of using a class for this challenge?
We can keep the grid of numbers ties to a specific instance of BingoBoard. That means we can play with multiple boards at once, just like in the real world! Also we could specify all these methods without having to pass our board object into each one.

How can you access coordinates in a nested array?
In a normal array you can reference array[item]. When arrays are nested, this extends to become array[item][subitem]. You can also iterate over the arrays within the array.

What methods did you use to access and modify the array?
In my initial solution I used .each and .map! to loop over the array, and to do so while modifying it. .fill might have been similarly useful. In refactoring I also used .transpose, which, in a 2D nested array like this one, lets you switch the rows and colums.

Give an example of a new method you learned while reviewing the Ruby docs. Based on what you see in the docs, what purpose does it serve, and how is it called?
.transpose, which switches the rows and columns in a 2D array like this, was useful because getting all the values in a column was kind of clunky otherwise. That was the main new method for me. 

How did you determine what should be an instance variable versus a local variable?
Anything that didn't need to be referenced across methods could be a local variable within that method. But things that I would need across methods, like the bingo grid itself, were better as instance variables.

What do you feel is most improved in your refactored solution?
I think .transpose simplified things a bit. I also tried out the tertiary operator, and an accessor attribute for the bingo grid. One area where I ran into trouble was with that accessor method; for Ruby to interpret "bingo_board" as a method as opposed to a variable, I sometimes had to tack it onto an object (e.g. "self.bingo_board").
=end