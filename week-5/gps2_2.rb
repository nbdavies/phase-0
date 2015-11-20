# Pseusocode
# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
# Take the input string and split it into an array
# Create a hash
# For each array item, add/update the hash
# with the array as the key, and default quantity of 1
# print the list to the console. Use printing method to make it look nice
# output: grovery list(hash)

# Method to add an item to a list
# input: grocery list (hash), item name (string), quantity (default 1)
# steps: create/update hash key/value pair
# output: grocery list (hash)

# Method to remove an item from the list
# input: grocery list (hash), item (string)
# steps: remove key/value pair
# output: grocery list (hash)

# Method to update the quantity of an item
# input: grocery list (hash), item (string), updated quantity (integer)
# steps: for the key/value for that item, set the value to the new quantity
# output: grocery list (hash)

# Method to print a list and make it look pretty
# input: grocery list (hash)
# steps: print key/value pairs to screen
# output: grocery list (hash)

# Initial solution
def grocery_list(items)
  new_list = Hash.new(0)
  array = items.split #.each
  array.each do |item|
    new_list[item] += 1
  end
  print_list(new_list)
  new_list
end

def add_item (grocery_list, item_name, quantity=1)
  grocery_list[item_name] += quantity
end

def remove_item (grocery_list, item_name)
  grocery_list.delete(item_name)
end

def update_quantity (grocery_list, item_name, quantity)
  grocery_list[item_name] = quantity
end

def print_list (grocery_list)
  puts "You need:"
  grocery_list.each do |item, quantity|
    puts quantity.to_s + " " + item
  end
end

# Refactored code
def grocery_list(items)
  new_list = Hash.new(0)
  items.split.each do |item|
    add_item(new_list,item)
  end
  print_list(new_list)
  new_list
end

def add_item (grocery_list, item_name, quantity=1)
  grocery_list[item_name] += quantity
end

def remove_item (grocery_list, item_name)
  grocery_list.delete(item_name)
end

def update_quantity (grocery_list, item_name, quantity)
  grocery_list[item_name] = quantity
end

def print_list (grocery_list)
  puts "You need:"
  #grocery_list.each do |item, quantity|
  #  puts quantity.to_s + " " + item
  #end
  puts grocery_list.flatten.join(" ")
end

# Driver code
items="carrots apples cereal pizza"
grocery_list=grocery_list(items)
add_item(grocery_list,"Lemonade",2)
add_item(grocery_list,"Tomatoes",3)
add_item(grocery_list,"Onions",1)
add_item(grocery_list,"Ice Cream",4)
remove_item(grocery_list,"Lemonade")
update_quantity(grocery_list,"Ice Cream",1)
print_list(grocery_list)

# Reflection
#What did you learn about pseudocode from working on this challenge?
# In this particular case, creating the initial solution directly off of the pseudocode led us in a particular direction in terms of the method return value that wasn't as streamlined as what we ultimately came up with. So it's worth keeping in mind that you can also have a destructive method, where you don't necessarily care about the return value.

#What are the tradeoffs of using Arrays and Hashes for this challenge?
# We implicitly use an array to get from a string to a hash. But overall a hash was better so that we could store the items and their quantity. An array of arrays might have been another option, but it seemed messier to add/update/remove items that way.

#What does a method return?
# A method returns either what you tell it to return, or otherwise the last expression evaluated.

#What kind of things can you pass into methods as arguments?
# Hashes, strings, integers, arrays, you name it. 

#How can you pass information between methods?
# In this case our "driver code" was where the hash was named and persisted, though it was passed into various methods from there.

#What concepts were solidified in this challenge, and what concepts are still confusing?
# I think this helped solidy concepts about destructive methods, method return values, and how hashes work.
