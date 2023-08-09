require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher object with provided attributes' do
      teacher = Teacher.new(name: 'Mr. Smith', age: 35, specialization: 'Mathematics')
      
      expect(teacher).to be_a(Teacher)
      expect(teacher.name).to eq('Mr. Smith')
      expect(teacher.age).to eq(35)
      expect(teacher.instance_variable_get(:@specialization)).to eq('Mathematics')
    end
  end
  
  describe '#can_use_services?' do
    it 'returns true for teacher' do
      teacher = Teacher.new(name: 'Mrs. Johnson', age: 42, specialization: 'History')
      
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end