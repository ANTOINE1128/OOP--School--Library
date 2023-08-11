# spec/classroom_spec.rb
require_relative '../classroom'

RSpec.describe Classroom do
  describe '#initialize' do
    it 'creates a new classroom object with provided label' do
      classroom = Classroom.new(label: 'Math')

      expect(classroom).to be_a(Classroom)

      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and updates student classroom' do
      classroom = Classroom.new(label: 'History')
      student = double('Student', classroom: nil)

      allow(student).to receive(:classroom=) # Allow the method call

      classroom.add_student(student)

      expect(classroom.students).to include(student)
      expect(student).to have_received(:classroom=).with(classroom)
    end
  end
end
