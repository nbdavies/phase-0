# Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: Kerry Choi.
# I spent 1.5 hours on this challenge.

# Pseudocode

# Input: 16 digit number with spaces (string)
# Output: true/false based on whether input is a valid credit card number
#         ArgumentError if input is not 16 digits.
# Steps: 
#    Create Class CreditCard.
#      Method initialize:
#        Validate the input: check it's a 16 digit number
#        If not, raise an argument error.
#        Set the input into an instance variable.
#      Method check_card:
#        Take the even-position digits (starting with 0), put them in a new array and double them
#        If the doubled digit is now two digits, add the two digits together to get one.
#        Take the odd-position digits, and put them in another array.
#        Add all elements of both the arrays together.
#        Take that total, and if it's a multiple of 10 then it's valid (return true), otherwise return false
#        


# Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

class CreditCard
  def initialize(creditcard_num)
    if creditcard_num.to_s.length != 16
      raise ArgumentError.new("invalid credit card number digits!")
    end
    @creditcard_num = creditcard_num
  end
  
  def check_card
    newarray = @creditcard_num.to_s.chars.to_a
    newarray.each_with_index do |item, index|
      if index % 2 == 0
        newarray[index] = (item.to_i*2).to_s 
      end
    end
    newarray=newarray.join.chars.to_a
    total = newarray.inject{ |sum, n| sum.to_i + n.to_i }
    if total % 10 == 0
      return true
    else return false
    end
  end

end

#drivercode:


# Refactored Solution

class CreditCard
  attr_accessor :creditcard_num
  
  def initialize(creditcard_num)
    raise ArgumentError.new("invalid credit card number digits!") if creditcard_num.to_s.length != 16
    self.creditcard_num = creditcard_num
  end
  
  def check_card
    newarray = creditcard_num.to_s.chars.to_a
    newarray.each_with_index { |item, index|
      newarray[index] = (item.to_i*2).to_s if index.even? }
    total=newarray.join.chars.to_a.inject{ |sum, n| sum.to_i + n.to_i }
    total % 10 == 0
  end

end

# Reflection
=begin
What was the most difficult part of this challenge for you and your pair?
We had trouble turning the pseudocode into the initial solution. Maybe it was because we took an approach of "add things until it works", and tried to do too many things in a single step, where the problem could have been broken down into smaller pieces. 
One thing that tripped us up was we kept doing the wrong type of arithmetic. Like when doubling digits, we were initially doubling the string, so "4" would become "44". Or when adding the array elements together, we would be adding the strings together, and getting one long string again.

What new methods did you find to help you when you refactored?
We used .even? as a shortcut, rather than checking the modulus of 2. Other than that we tried to condense a little and eliminate unneeded code blocks.
I think there are definitely some alternative approaches we could have taken, like not using arrays at all, and just popping a character off the original string, doubling it or not depending on how many characters there are left on the original string, and then adding the digits to a new string. (And split it and add it up at the end)

What concepts or learnings were you able to solidify in this challenge?
This definitely helped solify my consciousness of data types and how ignoring them can have consequences. Also code flow, and how a string of methods gets evaluated.
	
=end
