class ConcertsController < ApplicationController

	def search_by_price
		@concerts = Concert.all
		@price = params[:price]
		@results = search_by_price(@concerts, @price)
		render "search_by_price"
	end
	
	def index
		@concerts = Concert.all
	end

	def show
		@concert = Concert.find_by(id: params[:id])
		@comments = @concert.comments.all
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new(entry_params)
		if @concert.save
			redirect_to concerts_path
		else
			render :new
		end
	end

	private
	def entry_params
		params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
	end

end
