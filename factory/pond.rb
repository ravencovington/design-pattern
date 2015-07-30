require_relative 'duck.rb'
require_relative 'frog.rb'
require_relative 'algae.rb'

class Pond
  def initialize(number_animals, animal_class, number_plants, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class

    @animals = []
    number_animals.times do |i|
      animal = new_organism(:animal, "Animals#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism(:plant, "Plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each {|plant| plant.grow }
    @animals.each {|animal| animal.speak}
    @animals.each {|animal| animal.eat}
    @animals.each {|animal| animal.sleep}
  end

  def new_organism(type, name)
    if type == :animal
      @animal_class.new(name)
    elsif type == :plant
      @plant_class.new(name)
    else
      raise "Unknown organism type: #{type}"
    end
  end
end

# puts pond = Pond.new(3)
# puts pond.simulate_one_day

puts pond = Pond.new(3, Duck, 2, WaterLily)
puts pond.simulate_one_day

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end

puts pond = FrogPond.new(3)
puts pond.simulate_one_day

# class DuckWaterLilyPond < Pond
#   def new_organism(type, name)
#     if type == :animal
#       Duck.new(name)
#     elsif type == :plant
#       WaterLily.new(name)
#     else
#       raise "Unknown organism type: #{type}"
#     end
#   end

#   def new_plant(name)
#     WaterLily.new(name)
#   end
# end

# class FrogAlgaePond < Pond
#   def new_animal(name)
#     Frog.new(name)
#   end

#   def new_plant(name)
#     Algae.new(name)
#   end
# end

# create a parameterized factory method to produce whatever is passed in according
# to its symbol -- here instead of new_animal or new_plant, we use the more vague
# new_organism and pass in appropriate symbols. parameterized factory methods
# slim down the code bc each subclass defines one factory method

# To avoid weird class/object naming we can initialize the pond with these objects
# because we know all of these objects are relevant and necessary to the pond object
# we can leave behind the random named classes and pull out the new_organism method
