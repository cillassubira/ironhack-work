require File.expand_path '../spec_helper.rb', __FILE__
require 'pry'

describe "Online Calculator App" do
	it "shows result of sum first number and second number" do
		post '/calculate_add', { :first_number => 7, :second_number => 7, :operation => "sum"}
		expect(last_response.body).to include(14.0.to_s)
	end

	it "shows result of substract the second_number from the first_number " do
		post '/calculate_add', { :first_number => 10, :second_number => 7, :operation => "subs"}
		expect(last_response.body).to include(3.0.to_s)
	end

	it "shows result of multiplying first_number and second_number " do
		post '/calculate_add', { :first_number => 10, :second_number => 7, :operation => "mult"}
		expect(last_response.body).to include(70.0.to_s)
	end

	it "shows result of dividing first_number into second_number " do
		post '/calculate_add', { :first_number => 10, :second_number => 2, :operation => "div"}
		expect(last_response.body).to include(5.0.to_s)
	end


end
