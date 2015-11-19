#What was the most interesting and most difficult part of this challenge?
# Driver code was a new concept, as well as really being in charge of what the code would do, and when I would consider it "done". I also spent more time on the refactoring step, because I was sure there had to be a way to improve on what I had. In the end I did find a couple minor ways to streamline it, but it did change how the code worked slightly.

#Do you feel you are improving in your ability to write pseudocode and break the problem down?
# What was challenging for me was, I could envision how I would take a list of people and sort them into groups, but how I would do it isn't necessarily the simplest approach for how to do it in Ruby. But it ultimately doesn't matter how you assign the people to the groups as long as you get the right distribution of people at the end.

#Was your approach for automating this task a good solution? What could have made it even better?
# One challenge I didn't tackle was how to handle when one person leaves the cohort, and handling that without out bumping various people from one group to the next. Or the opposite, of adding someone to the list. If you put new people at the end then it shouldn't be any problem. But if you're not starting from scratch, you'd have to make value judgements about when does a group get big enough that you'd start removing people from it?

#What data structure did you decide to store the accountability groups in and why?
# I started with an array of people, and sorted them into another array where each value was an array of people per group. I guess the other option would have been to create a hash where the name is the key and the group number is the value. I suppose that wouldn't have been all that much different.

#What did you learn in the process of refactoring your initial solution? Did you learn any new Ruby methods?
# The main methods I used in refactoring were .shift and .rotate!. .shift takes a value from the array, removes it from the array, and returns the removed value. .rotate! rotates the entire array like a game of musical chairs. That helped solve the problem that I wanted to loop over the remaining people and simultaneously move on to the next group, and might have to loop through the groups more than once. 

#Release 1: Pseudocode
# Input: List of names. Passed in as an array. (I can always change that later.)
# Output: Another array, where each value is a list of names assigned to a group.
# Steps:
#   1. Create a method that takes two parameters:
#      * An array of names
#      * A minimum group size (positive integer)
#   2. Loop through the input array...
#        Add each person to another array ("group").
#        If "group" has the minimum number of people in it, add that array to the output, and clear it to start the next group.
#   3. When there are less than the minimum number of people not assigned to a group, then loop through the existing groups and add one person to each one, until there isn't anyone left to assign. 
#   4. Return the output array.

# Release 2: Initial solution
def assign_groups (people, minimum)
  groups = []
  group = []
  people.each do |person|
    group << person
    if group.count == minimum
      groups << group
      group=[]
    end
  end
  groups.cycle(group.count) do |one_group|
    if group != []
      one_group << group.shift
    end
  end
  return groups
end

# Release 4: Refactor
def assign_groups (people, minimum)
  groups = []
  while people.count >= minimum do
    groups << people.shift(minimum)
  end

  people.each do |person|
    groups.rotate!
    groups[0] << person
  end
  return groups
end

def chorus_frogs
  cohort =   ["Jack Abernethy",
        "Mohammad Amin",
        "Zollie Barnes",
        "Reuben Brandt",
        "Dana Breen",
        "Breton Burnett",
        "Saundra Vanessa Castaneda",
        "Luis De Castro",
        "Nicolette Chambers",
        "Kerry Choy",
        "Nick Davies",
        "KB DiAngelo",
        "Adrian Diaz",
        "David Diaz",
        "Bob Dorff",
        "Michael Du",
        "Paul Dynowski",
        "Jenna Espezua",
        "Sean Fleming",
        "Marcel Haesok",
        "Albert Hahn",
        "Arthur Head",
        "Jonathan Huang",
        "Thomas Huang",
        "Alex Jamar",
        "Kevin Jones",
        "Steven Jones",
        "Cole Kent",
        "Caroline Kenworthy",
        "Calvin Lang",
        "Yi Lu",
        "David Ma",
        "Sean Massih",
        "Tom McHenry",
        "Alex Mitzman",
        "Lydia Nash",
        "Brenda Nguyen",
        "Matthew Oppenheimer",
        "Mason Pierce",
        "Joe Plonsker",
        "Mira Scarvalone",
        "Joseph Scott",
        "Chris Shahin",
        "Benjamin Shpringer",
        "Lindsey Stevenson",
        "Phil Thomas",
        "Gary Tso",
        "Ting Wang",
        "Monique Williamson",
        "Regina Wong",
        "Hanah Yendler"]
  return cohort
end

#Release 5: Driver code
puts "Welcome. Would you like to make groups for the Chorus Frogs cohort? (yes/no)"
yes_no = gets.chomp
if yes_no == "yes"
  cohort = chorus_frogs
else
  cohort = []
  puts "Put in a list of names with spaces in between."
  cohort = gets.chomp.split
end
puts "Input your minimum group size."
minimum = gets.chomp.to_i
puts "Would you like to randomize the cohort list?"
yes_no = gets.chomp
if yes_no == "yes"
  cohort.shuffle!
end
groups = assign_groups(cohort,minimum)
p groups