#Textbnb

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
  Home.new("AB's place", "New York", 9, 32),
  Home.new("CD's place", "Los Angeles", 7, 47),
  Home.new("EF's place", "Chicago", 5, 12),
  Home.new("GH's place", "Houston", 2, 90),
  Home.new("IJ's place", "Philadelphia", 1, 49),
  Home.new("KL's place", "Phoenix", 10, 38),
  Home.new("MN's place", "San Antonio", 8, 99),
  Home.new("OP's place", "Dallas", 3, 110),
  Home.new("QR's place", "Dallas", 6, 45),
  Home.new("ST's place", "San Jose", 6, 49)
]

def printing(homes)
	homes.each do |home|
		puts "Name: #{home.name} | City: #{home.city} | Capacity: #{home.capacity} | Price: #{home.price}"
	end
end


#SORTING BY PRICE(Lowest to highest)

lth_sorting_prices = homes.sort_by {|home| home.price}

puts "Homes sorted by price (Lowest to Highest):"
printing(lth_sorting_prices)

#FILTER BY CITY
puts "Which city do you want to visit?:"
chosen_city = gets.chomp

chosen_city_homes = homes.select do |home|
	home.city == chosen_city
end

chosen_city_homes = homes.select {|home| home.city == chosen_city}

puts "In #{chosen_city} you can find rooms at this places: "
printing(chosen_city_homes)


#AVERAGE
total_amount_chosen = chosen_city_homes.reduce(0.0) do |sum, home|
	sum + home.price
end

puts "In #{chosen_city} the average of price for room is: #{total_amount_chosen/chosen_city_homes.length}"


#FIND BY PRICE
puts "How much do you want to pay per room?"
chosen_price = gets.chomp.to_i

cp_home = homes.find{|home| home.price == chosen_price}

puts "The place that costs #{chosen_price} is #{cp_home.name}"


