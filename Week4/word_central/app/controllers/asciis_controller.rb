require 'artii'
class AsciisController < ApplicationController
	def new
		
	end

	def create
		text_to_ascii = params[:asciis][:user_text]
		a = Artii::Base.new
		@final_ascii = a.asciify(text_to_ascii)
		render "ascii"
	end
end

