
require_relative 'state_data'
# Virus Predictor

# I worked on this challenge with: Jonathan Huang.
# We spent 1 hours on this challenge.

# EXPLANATION OF require_relative
# This requires that a file called state_data.rb exist in the relative location specified (in this case, in the same directory), and loads the contents.
# .require would take an absolute file path, including file extention.
class VirusPredictor
  
  # Creates the instance variables: state_of_origin, population_density, population
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  
  # Calls the other two methods. Passes in instance variables.
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
  
  #Takes population density and population to determine the number of predicted deaths. Rounds down. Prints to screen.
  def predicted_deaths
    # predicted deaths is solely based on population density
    
    number_of_deaths = case
      when @population_density >= 200
        @population * 0.4
      when @population_density >= 50
        @population * 0.1 * (@population_density.to_i/50)
      else
        @population * 0.05
    end

    print "#{@state} will lose #{number_of_deaths.floor} people in this outbreak"

  end

  # Determines the speed of virus spread based on the state's population density. Prints to screen. Doesn't use state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    speed = 0
    
    speed += case
      when @population_density >= 200
        0.5
      when @population_density >= 150
        1
      when @population_density >= 100
        1.5
      when @population_density >= 50
        2
      else
        2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

#Pseudocode:
=begin
Iterate through state data hash.
  Create a VirusPredictor object for each key in the state data hash.
  Call virus_effect method for each object.
=end

STATE_DATA.each do |state, data|
  VirusPredictor.new(state, data[:population_density], data[:population]).virus_effects
end



=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end

#=======================================================================
# Reflection Section
=begin
What are the differences between the two different hash syntaxes shown in the state_data file?
The colon syntax treats the key as a symbol, while the arrow syntax keeps it a string.

What does require_relative do? How is it different from require?
This requires that a file called state_data.rb exist in the relative location specified (in this case, in the same directory), and loads the contents.
.require would take an absolute file path, including file extention.

What are some ways to iterate through a hash?
.each is the most basic way, where you can specify two variables for the key+value pair. But other enumerable methods also work on hashes.

When refactoring virus_effects, what stood out to you about the variables, if anything? 
The instance variables were being passed as arguments to the other two methods, but those methods weren't using their arguments, just referencing the instance variables directly. We decided to just eliminate the arguments.

What concept did you most solidify in this challenge?
The "private" statement was kind of new. I was also rusty on the syntax of "case" and hadn't used it in a variable assignment before. .floor was a new one, but I kind of picked it up from context.
=end