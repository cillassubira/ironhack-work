class TextInspectionsController < ApplicationController
	
	def new
	end

	def create
		text = params[:text_inspection][:user_text]
		@word_count = text.split(" ").length
		@min_reading = @word_count/275
		@frequency = Hash.new(0)
		text.scan(/\w+/){|word| @frequency[word] = @frequency[word] + 1}
		@sorted_frequency = @frequency.sort_by {|k, v| v}
		@sorted_frequency.reverse!	
		render "results"
	end
end
