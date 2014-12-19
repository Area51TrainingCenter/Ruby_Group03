class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			ContactMailer.contact_customer(@contact.email).deliver
			ContactMailer.contact_team.deliver
		else
			render :new
		end
				
	end

end