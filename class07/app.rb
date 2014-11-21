require 'rack'
require_relative "lib/frank"

class App
  def call(env)
  	framework = Frank.new(env)
  	framework.run
  end
end

Rack::Handler::WEBrick.run App.new

# /elcomercio  -> index.html#
# /dfddf       -> env