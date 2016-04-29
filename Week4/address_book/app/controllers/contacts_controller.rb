class ContactsController < ApplicationController
	def index
		@contacts = Contact.order("name ASC")
	end

	def new
	end

	def create
		contact = Contact.new(
			:name => params[:contact][:name], 
			:address => params[:contact][:address], 
			:phone_num => params[:contact][:phone_num], 
			:email => params[:contact][:email], 
			)
		contact.save
		#render(:text => contact.attributes) 
		#redirect_to("/contacts")
		redirect_to contacts_path
	end

	def show
		@selected_contact = Contact.find(params[:id])
	end

end
