class Person
  attr_accessor :name, :age

  def report
    puts name + " : " + age.to_s
  end
end
