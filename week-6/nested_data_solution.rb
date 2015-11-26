# RELEASE 2: NESTED STRUCTURE GOLF
# Hole 1
# Target element: "FORE"

array = [[1,2], ["inner", ["eagle", "par", ["FORE", "hook"]]]]

# attempts: 4
# ============================================================
puts array[1][1][2][0]


# ============================================================

# Hole 2
# Target element: "congrats!"

hash = {outer: {inner: {"almost" => {3 => "congrats!"}}}}

# attempts: 1
# ============================================================
p hash[:outer][:inner]["almost"][3]


# ============================================================


# Hole 3
# Target element: "finished"

nested_data = {array: ["array", {hash: "finished"}]}

# attempts: 2
# ============================================================
p nested_data[:array][1][:hash]

# ============================================================

# RELEASE 3: ITERATE OVER NESTED STRUCTURES

number_array = [5, [10, 15], [20,25,30], 35]

p number_array.map! { |x| x.class == Array ? x.map! { |y| y + 5 } : x + 5}



# Bonus:

startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

def add_ly (array)
  if array.class == Array
    array.map! {|subarray|
      add_ly(subarray)
      }
  else
    array + "ly"
  end
end

p add_ly(startup_names)
=begin
Reflection
What are some general rules you can apply to nested arrays?
You can access the interior levels of the array like this: if array[0] is the first element of the top level, then array[0][0] would be the first element of the array within that element of the array.
In terms of method calls, keep in mind that calling a method on the array itself only affects the top level of the array.

What are some ways you can iterate over nested arrays?
Same as iterating over one-dimensional arrays (using .each, .map, etc.) but you will have to call them on the subarrays as well, if you want to access those elements.

Did you find any good new methods to implement or did you re-use one you were already familiar with? What was it and why did you decide that was a good option?	
We used .map!, because it's reasonably straightforward and versatile. 
=end
