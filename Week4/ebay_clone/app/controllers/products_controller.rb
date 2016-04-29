class ProductsController < ApplicationController
	def index
		#@user = User.find_by(id: params[:user_id])
		@products = Product.all

	end
	def new
		@user = User.find_by(id: params[:user_id])
		@product = @user.products.new
	end
	def create
		@user = User.find_by(id: params[:user_id])
		@product = @user.products.create(
			title: params[:product][:title],
			description: params[:product][:description],
			deadline: params[:product][:deadline]
		)
		redirect_to user_products_path(@user.id)
	end
	def show
		@user = User.find(params[:user_id])
		@product = @user.products.find(params[:id])
	end

end
