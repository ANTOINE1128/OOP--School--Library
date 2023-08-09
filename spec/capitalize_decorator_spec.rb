require_relative '../capitalize_decorator' 
require_relative '../decorator'            

RSpec.describe CapitalizeDecorator do
  class FakeNameable < Decorator
    def initialize
      super(nil)  
    end

    def correct_name
      'john doe'
    end
  end

  describe '#correct_name' do
    it 'returns the correct name from the wrapped nameable object in capitalized form' do
      fake_nameable = FakeNameable.new
      capitalize_decorator = CapitalizeDecorator.new(fake_nameable)
      
      expect(capitalize_decorator.correct_name).to eq('John doe')
    end
  end
end
