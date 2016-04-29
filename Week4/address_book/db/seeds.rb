20.times do |person| 
	Contact.create(name: "Mr #{person}", address: "#{person} Street", phone_num: "#{person}#{person}", email: "#{person}@example.com", favorite: false)
end