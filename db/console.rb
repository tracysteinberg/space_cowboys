require('pry-byebug')
require_relative('../models/space_cowboys')

# Bounty.delete_all

alien1 = Bounty.new({ 'name'=> 'Luke', 'home_world'=> 'Moon', 'last_known_location'=> 'Mars', 'favourite_weapon'=> 'Acid'})
alien2 = Bounty.new({ 'name'=> 'Keith', 'home_world'=> 'Earth', 'last_known_location'=> 'Pluto', 'favourite_weapon'=> 'Tongue'})

# alien1.save()
b = Bounty.find(7)

binding.pry
nil