require_relative 'person'

class Reporter
  def report
    a = Person.new
    a.name = "Alvaro" 
    a.age  = 29
    a.report
  end
end

puts Reporter.new.report









=begin

Report.new(Person.new).report
Report.new(Dog.new).report
Report.new(Money.new).report
Report.new(Cat.new).report



Dependency Injection
Dependency Reversion

class PersonReporter

  def initialize(name)
    @person = Person.new
    @person.name = name
  end

  def report
    @person.report
  end
end

PersonReporter.new("Alvaro").report

class Person
  "ASDÑ$KWJRFASDKL}{}{"
end



=end
