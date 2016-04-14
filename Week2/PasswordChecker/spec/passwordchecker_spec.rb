require_relative '../passwordchecker.rb'
require 'pry'

RSpec.describe "PasswordChecker" do
	before {@passwordchecker = PasswordChecker.new}

	it "checks that password length is greater or equal to 7" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "1aB#")[0]).to eq(false)
	end

	it "checks that password contains at least a letter" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "123456#")[1]).to eq(false)
	end

	it "checks that password contains at least a number" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "abcdef#")[2]).to eq(false)
	end

	it "checks that password contains at least a symbol" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "123abcd")[3]).to eq(false)
	end

	it "checks that password contains at least a letter on uppercase" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "12abcd#")[4]).to eq(false)
	end

	it "checks that password contains at least a letter on lowercase" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "12ABCD#")[5]).to eq(false)
	end

	it "checks that password does not contain user name" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "1rAfa2#")[6]).to eq(false)
	end

		it "checks that password does not contain email domain" do
		expect(@passwordchecker.check_password("rafa@ironhack.com", "1Ironhack#")[7]).to eq(false)
	end
end
	
