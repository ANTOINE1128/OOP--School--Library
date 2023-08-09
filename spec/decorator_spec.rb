require_relative '../decorator'  
require_relative '../nameable'    

RSpec.describe Decorator do
  class FakeNameable < Nameable
    def correct_name
      'John Doe'
    end
  end

  describe '#correct_name' do
    it 'returns the correct name from the wrapped nameable object' do
      fake_nameable = FakeNameable.new
      decorator = Decorator.new(fake_nameable)
      
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
