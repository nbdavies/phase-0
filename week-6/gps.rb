# Your Names
# 1) Caroline Kenworthy
# 2) Nick Davies

# We spent [1] hours on this challenge.

# Bakery Serving Size portion calculator.

def error_handling(cookbook, item_to_make)
  unless cookbook.has_key?(item_to_make)
    raise ArgumentError.new("#{item_to_make} is not a valid input")
  end
end

def leftovers(leftover_ingredients)
  if leftover_ingredients >= 5
    serving_size_calc("cake",leftover_ingredients)
  else serving_size_calc("cookie", leftover_ingredients)
  end
end

def serving_size_calc(item_to_make, order_quantity)
  cookbook = {"cookie" => 1, "cake" =>  5, "pie" => 7}
  # Declare library of things to make
  error_handling(cookbook, item_to_make)
  # Check that item_to_make is in library, raise an error if it isn't
  
  serving_size = cookbook[item_to_make]
  leftover_ingredients = order_quantity % serving_size
  # Retrieve serving size for the item_to_make and the modulus (leftover ingredient) count
  message = "Make #{order_quantity/serving_size} #{item_to_make}" 
  message = message + "s" if order_quantity/serving_size > 1 
  # Semantically format output message
  if leftover_ingredients == 0
    return message
  else
    return message + ". You have #{leftover_ingredients} leftover ingredients. Suggested baking items: " + leftovers(leftover_ingredients)
  end
  #If there are leftover ingredients, calculate other things to bake.
end

#Driver code
p serving_size_calc("pie", 7)
p serving_size_calc("pie", 13)
p serving_size_calc("cake", 5)
p serving_size_calc("cake", 7)
p serving_size_calc("cookie", 1)
p serving_size_calc("cookie", 10)
p serving_size_calc("THIS IS AN ERROR", 5)

#  Reflection
=begin
What did you learn about making code readable by working on this challenge?
 The modifications we made here were largely taking out calls to more complex methods (like values_at), where previously I've kind of sought out those types of methods. We also looked at eliminating repeat code, but found that abstracting a calculation to another method doesn't necessarily simplify things. We also tried to make variable names more intuitive, something that I hadn't thought a lot about previously.

Did you learn any new methods? What did you learn about them?
 The original code used values_at, which I wasn't familiar with. For a hash, it returns an array of the "values at" certain keys. This is probably more useful when you pass in multiple keys. We also used has_key? which I remember having seen before. It returns a boolean for whether or not the specified key is present in the hash.

What did you learn about accessing data in hashes? 
 Other than the particular methods mentioned, there wasn't anything too tricky here. 

What concepts were solidified when working through this challenge?
 This definitely solidified some principles of refactoring for readability. And I also worked with my pair to make the method recursive, which is something we haven't done much with yet.

=end