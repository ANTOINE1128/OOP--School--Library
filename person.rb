require_relative 'Nameable'

class Person < Nameable
  def initialize(name, age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def correct_name
    @name
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    @parent_permission == true || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
# capitalizeDecorator.rb

class CapitalizeDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Nameable
  def initialize(nameable, max_length = 10)
    @nameable = nameable
    @max_length = max_length
    super()
  end

  def correct_name
    @nameable.correct_name.slice(0, @max_length)
  end
end

person = Person.new('maximilianus', 22)
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
