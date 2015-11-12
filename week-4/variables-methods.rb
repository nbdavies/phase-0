def ask_name
	puts "I'm sorry, I don't remember you. What's your first name?"
	first_name = gets.chomp
	puts "Terribly sorry, I know a lot of people named " + first_name + ". What about your middle name?"
	middle_name = gets.chomp
	puts "Not ringing a bell. How about your last name?"
	last_name = gets.chomp
	puts "Oh of course! I remember you, " + first_name + " " + middle_name + " " + last_name + "!"
end

def fav_number
	puts "What's your favorite number?"
	number = gets.chomp
	number_plus_one = number.to_i + 1
	number = number.to_s
	number_plus_one = number_plus_one.to_s
	puts "Well " + number + " isn't as big as " + number_plus_one + " is it!"
end

=begin
How do you define a local variable?

A local variable is a place to store a piece of information for later use. It also keeps track of what type of value it's storing.

How do you define a method?

A method is a block of code. Typically it acts upon its caller. 

What is the difference between a local variable and a method?

A varible stores a value, and serves as a way to refer to that value. A method is a block of code, but is often used as a way to operate on a value.

How do you run a ruby program from the command line?

Let's say your file is test.rb. At the command line, you would put in:
ruby test.rb

How do you run an RSpec file from the command line?

Similarly, it would be something like this:
rspec spec.rb

What was confusing about this material? What made sense?

At first I was trying to use puts, but my program kept failing the test. Eventially I realized that I needed to use return instead.

4.3.1:
https://github.com/nbdavies/phase-0/blob/master/week-4/address/my_solution.rb
4.3.2:
https://github.com/nbdavies/phase-0/blob/master/week-4/math/my_solution.rb

=end