# Largest Integer

# I worked on this challenge by myself.

# largest_integer is a method that takes an array of integers as its input
# and returns the largest integer in the array
#
# +list_of_nums+ is an array of integers
# largest_integer(list_of_nums) should return the largest integer in the +list_of_nums+
#
# If +list_of_nums+ is empty the method should return nil

# Your Solution Below
def largest_integer(list_of_nums)
  maximum = nil
  list_of_nums.each do |num|
  	num = num.to_i
  	if maximum == nil	
  		maximum = num
  	elsif maximum < num
  		maximum = num
  	end
  end
  return maximum
end