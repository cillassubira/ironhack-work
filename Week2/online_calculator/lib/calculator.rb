#calculator.rb
require 'pry'
class Calculator
	def initialize(first_number, second_number)
		@first_number = first_number
		@second_number = second_number
	end

	def select_operator(sign)

		case sign
		when :sum
			add_add
		when :subs
			substract
		when :mult
			multiply
		when :div
			divide
		end
		
	end

	def add_add
		@first_number + @second_number
	end

	def substract
		@first_number - @second_number
	end

	def multiply
		@first_number * @second_number
	end

	def divide
		@first_number / @second_number
	end

end

