# Calculate a Grade

# I worked on this challenge with: KB DiAngelo.

# Your Solution Below

def get_grade(average)
  average = average.to_i
    if average < 60
       return "F"
    elsif average < 70
      return "D"
    elsif average < 80
      return "C"
    elsif average < 90
      return "B"
    else
      return "A"
  end
end