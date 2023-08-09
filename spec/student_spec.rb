# spec/student_spec.rb
require_relative '../student'
require_relative '../classroom'  

RSpec.describe Student do
  describe '#play_hooky' do
    context 'when the student is already playing' do 
      it 'should return ¯(ツ)/¯' do 
        student = Student.new(name: 'Alice', age: 20)
        expect(student.play_hooky).to eq('¯(ツ)/¯')
      end
    end
  end
  
  describe '#add_classroom' do
    it 'adds the student to the classroom if not already present' do
      student = Student.new(name: 'Alice', age: 20)
      classroom = Classroom.new( 'Math')
  
      student.add_classroom(classroom)
  
      expect(student.classroom.label).to eq(classroom.label)  
      expect(classroom.students).to include(student)  
    end
  
    it 'does not add the student again if already in the classroom' do
      student = Student.new(name: 'Bob', age: 18)
      classroom = Classroom.new(name: 'History')
  
      student.add_classroom(classroom)
      initial_students = classroom.students.dup
  
      student.add_classroom(classroom)
  
      expect(student.classroom.label).to eq(classroom.label)
      expect(classroom.students).to eq(initial_students)
    end
  end
end
