module ConcertsHelper
	def concerts_today(concerts)
		concerts.where(date: (Date.today)..(Date.today + 1.day))
	end

	def concerts_this_month(concerts)
		concerts.where(date: ((Date.today - 1.day)..(Date.today + 1.month)))
	end

	def search_by_price(concerts, price)
		concerts.where("price < ?", price)
	end
end
