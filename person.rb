require_relative 'nameable'
# require_relative 'Decorator'
# require_relative 'Trimmer_Decorator'
# require_relative 'Capitalize_Decorator'
# require_relative 'classroom'
# require_relative 'student'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :book
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission == true || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
