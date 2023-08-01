require_relative 'person'

class Teacher < Person
  def initialize(specialization = 'no specialization yet', **args)
    super(**args)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
