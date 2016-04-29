class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find_by(id: params[:id])
		@products = @user.products
		# unless @user
		# 	#render "No_user_found"
		# end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(
			name: params[:user][:name],
			email: params[:user][:email]
			)
		redirect_to "/users"
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@user.destroy
	end

end
