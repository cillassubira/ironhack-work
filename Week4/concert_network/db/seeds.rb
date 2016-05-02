10.times do |event| 
	c = Concert.create(
		artist: "Artist num #{event}", 
		venue: "#{event} Hall", 
		city: "Here and there", 
		date: Date.today, 
		price: 10.0, 
		description: "Come and see!"
	)
	rand_comments = rand(1..3)
	rand_comments.times.each do |rand_comment|
		c.comments.create(commentator: "Mr: #{rand_comment}", comment: "Blablabla #{rand_comment}")
	end
end