require 'json'
require 'open-uri'

class EarthquakesController < Controller

	def index
		url = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_hour.geojson"
		earthquakes = JSON.parse(open(url).read)
		render "earthquakes", results: earthquakes
	end

end