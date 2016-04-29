10.times do |time| 
	user = User.create(name: "Mr #{time}", email: "example#{time}@example.com")
	5.times.each do |item|
		user.products.create(title: "Product #{item}", description: "Description of product #{item}", deadline: Time.now + 1.month)
	end
end