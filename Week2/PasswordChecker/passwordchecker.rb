class PasswordChecker
	def initialize
		@email
		@password
		@conditions = []
	end

	def check_password(email, password)
		@email = email
		@password = password
		@conditions << check_seven
		@conditions << check_one_letter
		@conditions << check_one_number
		@conditions << check_one_symbol
		@conditions << check_upper
		@conditions << check_lower
		@conditions << check_user
		@conditions << check_domain
	end

	def check_seven
		@password.length >= 7
	end

	def check_one_letter
		unless @password.index("/[a-zA-Z]/")
			false
		end
	end

	def check_one_number
		unless @password.index("/[0-9]/")
			false
		end
	end

	def check_one_symbol
		unless @password.index("/[^a-zA-Z0-9]/")
			false
		end
	end

	def check_upper
		unless @password.index("/[A-Z]/")
			false
		end
	end

	def check_lower
		unless @password.index("/[a-z]/")
			false
		end
	end

	def check_user
		password = @password.upcase
		user = @email.split('@')
		if password.index(user[0].upcase)
			false
		end
	end

	def check_domain
		password = @password.upcase
		user = @email.split('@')
		if password.index(user[1].split('.')[0].upcase)
			false
		end
	end
end
