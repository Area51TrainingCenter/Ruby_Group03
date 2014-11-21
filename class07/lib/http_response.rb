require_relative "router"

class HTTPResponse

	def initialize(env)
		@env = env
	end

	def deliver

		begin
			body = Router.new.route(@env)
			["200", {}, body] 	
		rescue Exception => ex
			["500", {}, [ex.message + ex.backtrace.join] ]
		end

	end

end