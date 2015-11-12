# Leap Years

# I worked on this challenge with: KB DiAngelo.

# Your Solution Below
def leap_year?(year)
  year = year.to_i
  if year % 400 == 0
    return true
  elsif year % 100 == 0
    return false
  elsif year % 4 == 0
    return true
  else
    return false
  end
end