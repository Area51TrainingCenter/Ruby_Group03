require_relative 'http_response'
require_relative 'controller'

class Frank

	def initialize(env)
		@env = env
	end

	def run
		HTTPResponse.new(@env).deliver
	end

end