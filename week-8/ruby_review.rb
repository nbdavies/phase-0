
# Create a Bingo Scorer (SOLO CHALLENGE)

# I spent [#] hours on this challenge.

# Pseudocode
# Create a class of object, the value of which will be a two-dimensional array (assumed to be 5 x 5)
# Some of the cells of the 2D array will be filled with x's (lowercase, string "x").
# Create a method to check whether the x's form a winning pattern.
#  Call separate functions to check for each win condition.
#   check_horizontals: take the board state as input. Loop through the rows of the array, return true if any of them match [x,x,x,x,x].
#   check_verticals: a couple ways to do this. My preference is just to pass a transposed version of the board state to the check_horizontals object.
#   check_down_diagonal: Loop through the rows. Return true if the value at [row][row] is "x" for all rows.
#   check_up_diagonal: Loop through the rows. Return true if the value at [row][6-row] is "x" for all rows.
#   (add functions for other win conditions)

# Another overall approach: somehow clear out all number values from the array, and check it's equality against template arrays representing every winning pattern.
# (Assuming a winning board won't have any stray x's outside the pattern, which doesn't seem assumable in real life.)
# There are no handy methods to check that a 2D array has a certain value at all the same positions as another 2D array. So I'd need to write that, and write the code to create all the possible winning arrays.


# sample boards

 horizontal = [[47, 44, 71, 8, 88],
               ['x', 'x', 'x', 'x', 'x'],
               [83, 85, 97, 89, 57],
               [25, 31, 96, 68, 51],
               [75, 70, 54, 80, 83]]

vertical = [[47, 44, 71, 'x', 88],
             [22, 69, 75, 'x', 73],
            [83, 85, 97, 'x', 57],
             [25, 31, 96, 'x', 51],
             [75, 70, 54, 'x', 83]]


right_to_left = [['x', 44, 71, 8, 88],
                  [22, 'x', 75, 65, 73],
                  [83, 85, 'x', 89, 57],
                  [25, 31, 96, 'x', 51],
                  [75, 70, 54, 80, 'x']]


left_to_right = [[47, 44, 71, 8, 'x'],
                   [22, 69, 75, 'x', 73],
                   [83, 85, 'x', 89, 57],
                   [25, 'x', 96, 68, 51],
                   ['x', 70, 54, 80, 83]]




# Initial Solution
class BingoScorer
  attr_accessor :board

  def winner? 
    return true if check_horizontals
    return true if check_verticals
    return true if check_up_diagonal
    return true if check_down_diagonal
    return false
  end

  def check_horizontals
    self.board.each do |row|
      return true if row == ["x","x","x","x","x"]
    end
    return false
  end

  def check_verticals
    self.board.transpose.each do |col|
      return true if col == ["x","x","x","x","x"]
    end
    return false
  end

  def check_down_diagonal
    self.board.each_with_index do |row,i|
      return false if row[i]!="x"
    end
    return true
  end

  def check_up_diagonal
    self.board.each_with_index do |row,i|
      return false if row[4-i]!="x"
    end
    return true
  end

end

# Refactored Solution
class BingoScorer
  attr_accessor :board

  def winner? 
    horizontals? || verticals? || up_diagonal? || down_diagonal?
  end

  def horizontals?
    self.board.include?(["x","x","x","x","x"])
  end

  def verticals?
    self.board.transpose.include?(["x","x","x","x","x"])
  end

  def down_diagonal?
    self.board.each_with_index {|row,i| return false if row[i]!="x"}
    return true
  end

  def up_diagonal?
    self.board.each_with_index {|row,i| return false if row[4-i]!="x"}
    return true
  end

end

# DRIVER TESTS GO BELOW THIS LINE
# implement tests for each of the methods here:
myBoard = BingoScorer.new
myBoard.board=left_to_right
p myBoard.winner?
myBoard.board=right_to_left
p myBoard.winner?
myBoard.board=vertical
p myBoard.winner?
myBoard.board=horizontal
p myBoard.winner?
# Reflection
=begin
What concepts did you review or learn in this challenge?
I reviewed and explored more about what standard methods there are for working with nested arrays.
What is still confusing to you about Ruby?
I considered a bunch of possible approaches to the problem, but it seemed like the standard array methods were largely geared towards working with 1D arrays. And particularly arrays where you don't care about the precise position of a value. So to work with 2D arrays I would have had to write new methods to fit those needs.
Ruby also considers an array of nil values (such as [nil,nil,nil]) to not be empty, which surprised me.
What are you going to study to get more prepared for Phase 1?
It'll definitely help to do more of these review exercises, and go back to the bonus challenges that I skipped over earlier.
=end