Post.where(created_at: 10.days.ago..Date.today)

select * from posts where created_at between '2014-11-13' and '2014-11-23'

select * from posts where created_at >= '2014-11-13' or created_at < '2014-11-23'


def total
  result = 0
  @numbers.each do |number|
    if number.odd? && number > 100
      result += number
    end
  end
  result
end

@numbers.select{|n| n.odd? && n > 100 }.reduce{|sum, n| sum + n }
re

<a href="/">Click me</a>


function test(){
 $("a").on("click", function(){
  alert("Click!");
})

}


def hola(a, b)
end


do

end

{

}

5.times do 
 # ...
end


yield(variable)

block.call(variable)


def potencia(cantidad)
  x = yield(cantidad)
  yield x
end

potencia(2) do |number|
   if number.even?
     exp = 15 
   else
     exp = 10
   end
   number ** exp
end


def eleva(number)
   if number.even?
     exp = 15 
   else
     exp = 10
   end
   number ** exp
end

eleva(12)

2**15



def metodo(a, b)
  yield
end

def metodo(a, b, &pokeball)
  pokeball.call
end


metodo(1,2) do
  puts "CAPTURADO"
end



class LaserPrinter
  def print
    puts "BZZZZZ"
    yield
    puts "PEW PEW PEW"
  end
end

class DotMatrixPrinter
  def print
    puts "REPORT".center(40, "*")
    yield
    puts "END REPORT".center(40, "*")
  end
end

def report(type, &block)
  if type == "laser"
    LaserPrinter.new.print(&block)
  else
    DotMatrixPrinter.new.print(&block)
  end
end

report "laser" do 
  puts "Este es mi reporte TPS:" + Time.now.to_s
end

report "dot_matrix" do 
  puts "Programadores: " + rand(40).to_s
end


report "laser" do 
  # products = Product.limit(10).order("price DESC")
  # products.each do |p|
  #   puts p.price
  # end
  #
end



[1, 2, 3, 4, 5].each do |number|
  puts number
end

[1, 2, 3, 4, 5].my_each do |number|
  puts number * 100
end

for i in 1..5
  valor = self[i-1]
end

class Array  

  def my_each
     self  #this
  end

end


[1,2,3].my_each


[1,2,3].map {|i| i ** 2 }
[1,2,3].my_map {|i| i ** 2 }

#=> [1, 4, 9]


class Array
  def my_each
   min = 0
   max = self.size - 1
   for i in min..max
     puts self[i]
   end
  end
end

class Array
  def my_each
   i = 0
   while self[i]
     i += 1
   end
  end
end


class Array
  def my_each
   for i in self
     yield(i)
   end
  end
end

[1, 2, 3, 4].my_each do |number|
  puts number ** 16
end

class Array
  def my_select
    temp = []
      self.my_each do |i|
        temp << i if yield(i)
      end 
    temp
  end
end

[1,2,3].my_select{|i| i.odd? }

class Array
  def my_map
    temp = []
    self.my_each do |i|
      temp << yield(i)
    end
    tempgit
  end
end

[1, 2, 3, 4].my_map do |number|
  number ** 16
end


