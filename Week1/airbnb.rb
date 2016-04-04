class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

def printing(homes)
	homes.each do |home|
		puts "Name: #{home.name} | City: #{home.city} | Capacity: #{home.capacity} | Price: #{home.price}"
	end
end

homes.each do |home|
	puts home.name
end

homes.each do |home|
	puts "#{home.name} in #{home.city}\nPrice: $#{home.price} a night"
end

cities = homes.map do |home|
	home.city
end

puts cities

capacity_of_homes = homes.reduce(0.0) do |sum, home|
	sum + home.capacity

end

puts "The average capacity is: #{capacity_of_homes/homes.length}"

homes.each_with_index do |home, index|
	puts "Home Number #{index+1}: #{home.name}"
end

#Select homes in San Juan

homes_sanjuan = homes.select do |home| 
	home.city == "San Juan"
end

puts "Homes is San Juan: "
printing(homes_sanjuan)

#Homes with capacity lower than 4

homes_lower4 = homes.select do |home|
	home.capacity < 4
end 

puts "Homes with capacity lower than 4: "
printing(homes_lower4)

#Homes with capacity 4 or more

homes_high_capacity = homes.select do |home|
	home.capacity >= 4
end

puts "Homes with capacity equal or greater than 4: "
printing(homes_high_capacity)

#Any homes with price 49?

home_49 = homes.find {|home| home.price == 49}

puts "The first home that costs $49 is: #{home_49.name}"

#Sort houses by capacity greater to lower

# sorted_capacity = homes.sort_by {|home| home.capacity}
# puts "Homes sorted by capacity: "
# printing(sorted_capacity)

sorted_capacity = homes.sort do |home1, home2|
	home2.capacity <=> home1.capacity
end

 puts "Homes sorted by capacity: "
 printing(sorted_capacity)


