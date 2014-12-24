class OmniauthController < ApplicationController

	def facebook
		logger.info request.env["omniauth.auth"] #.info.image
		@image = request.env["omniauth.auth"].info.image
		render "cars/index"
	end

	def twitter
		logger.info request.env["omniauth.auth"] #.info.image
		@image = request.env["omniauth.auth"].info.image
		render "cars/index"
	end

end