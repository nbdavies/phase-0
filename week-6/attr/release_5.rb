# Release 4:

#Your refactored code:
class Profile
  attr_accessor :age,:name,:occupation

  def initialize
    self.age = 27
    self.name = "Kim"
    self.occupation = "Cartographer"
  end

  def print_info
    puts
    puts "age: #{self.age}"
    puts
    puts "name: #{self.name}"
    puts
    puts "occupation: #{self.occupation}"
    puts
  end

end
