require_relative 'person'

class Student < Person
  def initialize(classroomm = 'no classroom', **args)
    super(**args)
    @classroomm = classroomm
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
