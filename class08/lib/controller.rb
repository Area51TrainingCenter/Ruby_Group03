require 'erubis'

class Controller

	def render(controller, params = {})
		path = "./views/" + controller + "/index.html"
		template = File.read(path)
		Erubis::Eruby.new(template).result(params)
	end

end