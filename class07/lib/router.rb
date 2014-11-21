class Router
	
	def	route(env)
		path = env["PATH_INFO"].split("/").last
	  	if path == "elcomercio"
	  		#...
	  		[File.read("index.html")]
	  	else
	    	[env.to_s]		
	  	end
	end

end