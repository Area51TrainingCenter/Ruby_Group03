require 'asciiart'

url = "https://octodex.github.com/images/codercat.jpg"

a = AsciiArt.new(url)

puts a.to_ascii_art(width: 20)
#puts a.to_ascii_art({width: 20})
#puts a.to_ascii_art({:width => 20})
# dfadsfdasf 

=begin
class AsciiArt
  def initialize(url)
    # xxxxxx
  end

  def to_ascii_art(param)
    # ....
  end
end
=end
