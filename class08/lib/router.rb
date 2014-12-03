class Router	
	
	def	route(env)
		path = env["PATH_INFO"].split("/").last
		# /elcomercio /misitio /perfil/123
    # /users -> UsersController
    # /profile -> ProfileController
    # /cats    -> CatsController

  	controller_name = path.capitalize + "Controller"	
		controller = Object.const_get(controller_name).new
		[controller.index]
	end

end
