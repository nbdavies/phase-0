# I worked on this challenge with: KB DiAngelo.


# Your Solution Below

def valid_triangle? (side_one, side_two, side_three)
  if side_one + side_two <= side_three
    return false
  elsif side_two + side_three <= side_one
    return false
  elsif side_one + side_three <= side_two
    return false
  else
    return true
  end
end