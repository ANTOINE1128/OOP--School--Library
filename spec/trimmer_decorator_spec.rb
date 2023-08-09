require_relative '../decorator'

class TrimmerDecorator < Decorator
  def initialize(nameable, max_length = 10)
    @nameable = nameable
    @max_length = max_length
    super(nameable)
  end

  def correct_name
    @nameable.correct_name.slice(0, @max_length)
  end
end

require_relative '../trimmer_decorator' 
require_relative '../decorator'         

RSpec.describe TrimmerDecorator do
  class FakeNameable < Decorator
    def initialize(name)
      @name = name
      super(name)  # Pass the name argument to the parent constructor
    end

    def correct_name
      @name
    end
  end

  describe '#correct_name' do
    it 'trims the name to the specified max length' do
      fake_nameable = FakeNameable.new('John Doe')
      trimmer_decorator = TrimmerDecorator.new(fake_nameable, 5)
      
      expect(trimmer_decorator.correct_name).to eq('John ')
    end

    it 'does not trim if max length is greater than or equal to the name length' do
      fake_nameable = FakeNameable.new('Alice')
      trimmer_decorator = TrimmerDecorator.new(fake_nameable, 5)
      
      expect(trimmer_decorator.correct_name).to eq('Alice')
    end
  end
end
