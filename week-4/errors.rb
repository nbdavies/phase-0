# Analyze the Errors

# I worked on this challenge by myself.
# I spent [#] hours on this challenge.

# --- error -------------------------------------------------------

cartmans_phrase = "Screw you guys " + "I'm going home."

# This error was analyzed in the README file.
# --- error -------------------------------------------------------

def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
  end
end

# This is a tricky error. The line number may throw you off.

# 1. What is the name of the file with the error?
# errors.rb
# 2. What is the line number where the error occurs?
# 170
# 3. What is the type of error message?
# syntax error
# 4. What additional information does the interpreter provide about this type of error?
# unexpected end-of-input, expecting keyword_end
# Write your reflection below as a comment.
# 5. Where is the error in the code?
# The method cartman_hates opens a WHILE loop, but then doesn't have a corresponding END command. To the interpreter, this means that the method itself doesn't have an end, and realizes something's wrong when it reaches the end of the file without ever finding the END.
# 6. Why did the interpreter give you this error?
# "end" on line 16 is treated as the end of the while loop, rather than the end of the method, since the interpreter doesn't interpret indentation as being meaningful.

# --- error -------------------------------------------------------

# south_park

# 1. What is the line number where the error occurs?
# 37
# 2. What is the type of error message?
# Name Error
# 3. What additional information does the interpreter provide about this type of error?
# undefined local variable or method `south_park' for main:Object (NameError)
# 4. Where is the error in the code?
# south_park hasn't been defined as a method or as a variable. 
# 5. Why did the interpreter give you this error?
# When we reference south_park without assigning it a class or defining it, or setting its value, Ruby doesn't know what to do with it.

# --- error -------------------------------------------------------

# cartman()

# 1. What is the line number where the error occurs?
# 52
# 2. What is the type of error message?
# NoMethodError
# 3. What additional information does the interpreter provide about this type of error?
# undefined method `cartman' for main:Object
# 4. Where is the error in the code?
# Based on the parentheses, Ruby thinks we are trying to call a method called cartman. But we haven't defined that method anywhere.
# 5. Why did the interpreter give you this error?
# For anything that we're trying to use as a method, the interpreter would try to find the corresponding definition of that method, and if it can't find one, that's a problem. This is like the previous error, except in this case there's a little more context telling Ruby that what's missing is a method in particular.

# --- error -------------------------------------------------------

def cartmans_phrase (you_hate_kyle)
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase('I hate Kyle')

# 1. What is the line number where the error occurs?
# 67
# 2. What is the type of error message?
# ArgumentError
# 3. What additional information does the interpreter provide about this type of error?
# in `cartmans_phrase': wrong number of arguments (1 for 0)
# 4. Where is the error in the code?
# On line 71, the code is calling method cartmans_phrase with an argument of 'I hate Kyle', but that method doesn't have an argment defined. 
# 5. Why did the interpreter give you this error?
# In general, the number of arguments passed into a method can't differ from what it is written to accept. That can get fuzzy with optional arguments and sponge arguments.

# --- error -------------------------------------------------------

def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says("I hate Kyle")

# 1. What is the line number where the error occurs?
# 86
# 2. What is the type of error message?
# ArgumentError
# 3. What additional information does the interpreter provide about this type of error?
# in `cartman_says': wrong number of arguments (0 for 1)
# 4. Where is the error in the code?
# This is the opposite of the example above. The method cartman_says is expecting an argument, and it was called without one.
# 5. Why did the interpreter give you this error?
# The number of arguments passed in needs to match the number of arguments that the method expects. (With some exceptions I noted above.)

# --- error -------------------------------------------------------

def cartmans_lie(lie, name='Kylie Minogue')
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming!')

# 1. What is the line number where the error occurs?
# 105
# 2. What is the type of error message?
# ArgumentError
# 3. What additional information does the interpreter provide about this type of error?
# in `cartmans_lie': wrong number of arguments (1 for 2)
# 4. Where is the error in the code?
# When calling method cartmans_lie on line 109, only one argument is passed in, while the method expects two.
# 5. Why did the interpreter give you this error?
# The number of arguments passed in needs to match the number of arguments the method expects.

# --- error -------------------------------------------------------

"Respect my authoritay!" * 5

# 1. What is the line number where the error occurs?
# 124
# 2. What is the type of error message?
# TypeError
# 3. What additional information does the interpreter provide about this type of error?
# String can't be coerced into Fixnum
# 4. Where is the error in the code?
# We're starting with an integer 5, and multiplying it by...a string?? 
# 5. Why did the interpreter give you this error?
# If the interpreter knew how to turn "Respect my authoritay" into a number, than it could have completed the multiplication. But it doesn't know how to do that. This would work written the other way around though, which I'll do instead.

# --- error -------------------------------------------------------

amount_of_kfc_left = 20/0.1


# 1. What is the line number where the error occurs?
# 139
# 2. What is the type of error message?
# ZeroDivisionError
# 3. What additional information does the interpreter provide about this type of error?
# divided by 0
# 4. Where is the error in the code?
# The code was attempting to divide a number by zero, which mathematically speaking would be infinity. 
# 5. Why did the interpreter give you this error?
# Fortunately, the interpreter knows better than to try to calculate infinity, and returns an error instead.

# --- error -------------------------------------------------------

# require_relative "cartmans_essay.md"

# 1. What is the line number where the error occurs?
# 155
# 2. What is the type of error message?
# LoadError
# 3. What additional information does the interpreter provide about this type of error?
# in `require_relative': cannot load such file -- /Users/ndavies/phase-0/week-4/cartmans_essay.md
# 4. Where is the error in the code?
# The code is telling Ruby to load file "cartmans_essay.md", which doesn't exist where it's expected to be (on my PC, in the same directory as errors.rb).
# 5. Why did the interpreter give you this error?
# The code is telling Ruby to load a file that doesn't exist.


# --- REFLECTION -------------------------------------------------------
# Write your reflection below as a comment.
=begin
Which error was the most difficult to read?

The one where the root cause of the error wasn't on the line number in the error message was the most challenging to figure out. 

How did you figure out what the issue with the error was?

I had a sense that the line number in the error message was only relevant because it was the last line of code in the file. That got me looking at whether there were any methods in the file missing an end statement.

Were you able to determine why each error message happened based on the code? 

Yes! They were mostly pretty intuitive.

When you encounter errors in your future code, what process will you follow to help you debug?	

I would do a couple things:
	Start by looking at the line number indicated. That may not always be the right place to look but it's a safer assumption than trying to spot-check the entire file.
	Take the standard error message, and if it's not familiar, google it to try to find other examples of code that caused that error. That would give me a better idea of what problem I should look for in my own code.	
=end