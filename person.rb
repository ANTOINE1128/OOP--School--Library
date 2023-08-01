class Person
  def initialize(name: 'Unknown', age: nil, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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