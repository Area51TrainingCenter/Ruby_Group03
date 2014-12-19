class SessionsController < ApplicationController

	def new
		cookies[:current_user] = 10
		redirect_to root_path
	end

	def error
	end


end