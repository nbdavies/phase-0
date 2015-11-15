# Factorial

# I worked on this challenge with Albert Hahn.

# Your Solution Below
# Pseudocode:
# Create a method that takes in a positive integer and calculates the factorial of that number.
# WHILE number is greater than 0, method will count down and multiply the return value by the counter.
# IF number is equal to 0, return 1.

def factorial(number)
  if number == 0
    return 1
  end
    factorial = 1
  while number > 1
    factorial = factorial * number
    number = number - 1
  end
  return factorial
end