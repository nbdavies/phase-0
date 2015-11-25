#Attr Methods

# I worked on this challenge by myself.

# I spent 1 hours on this challenge.

# Pseudocode
# Create a class "NameData"
# Method: initialize 
# Input: n/a
# Output: a NameData object with instance variable @name set to "Nick"
# Steps: create a writer method for "name", and then use that to set @name to "Nick"
# Create a class "Greetings"
# Method: initialize
# Input: n/a
# Output: a Greetings object and a NameData object
# Steps: create a new NameData object.
# Method: hello
# Input: n/a
# Output: nil, prints a greeting to the terminal
# Steps: retrieve @name from the NameData object using a reader method. Print a greeting to the screen with that name in it.

class NameData
	attr_accessor :name

	def initialize
		self.name="Nick"
	end
end


class Greetings
	attr_accessor :name_data

	def initialize
		self.name_data = NameData.new
	end

	def hello
		puts "Hello " + self.name_data.name + "! How wonderful to see you today."
	end

end



# Reflection
=begin
Release 1
What are these methods doing?
The what_is_ methods are retrieving instance variables, and the change_my_ methods are setting them.
How are they modifying or returning the value of instance variables?	
These methods are defined within the class, so they can access the instance variables using @age or @name.

Release 2
What changed between the last release and this release?
This line was added:
attr_reader :age
...and now what_is_age is no longer defined.
What was replaced?
See above.
Is this code simpler than the last?
It seems to be simpler, yeah. The .age method is now implicitly defined. That's one fewer method to have to write.

Release 3
What changed between the last release and this release?
This was added:
attr_writer :age
And now the change_my_age method no longer needs to be defined.
What was replaced?
See above.
Is this code simpler than the last?
Yeah, for similar reasons. It's kind of like having a method ".age=", but without the hassle of defining it.

Release 6
What is a reader method? By adding attr_reader to your class and specifying the symbols for the instance variables it should be able to read, you can retrieve those instance variables just by referencing them like a method (me.age for example).
What is a writer method? Similarly by adding attr_writer to your class and specifying the symbols for the instance variables you want it to write to, you can write to those instance variables just by referencing them like a method (me.age = 31).
What do the attr methods do for you? These save you the work of writing and keeping track of lots of trivially simple methods.
Should you always use an accessor to cover your bases? Why or why not? Using an accessor is like using a reader and a writer method. It makes sense to use an accessor in cases where you would want both a reader and a writer method. If you don't want either of them, then you should only use the one you do want. You may not want or need a writer or reader method if you don't want to allow that instance variable to be so easily accessed, or if you need to write the method to read/write it yourself, maybe due to complex variable structure or something.
What is confusing to you about these methods? Symbols are something I've read about now but still don't intuitively understand, and they use symbols in place of instance variables. I also don't quite grasp what's behind the "magic sauce" involved.
	
=end