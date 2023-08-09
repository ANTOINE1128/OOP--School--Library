require_relative '../rental'
require_relative '../book'  
require_relative '../person'

RSpec.describe Rental do
  describe '#initialize' do
    it 'creates a new rental object with provided date, book, and person' do
      book = Book.new
      person = Person.new(name: 'Alice', age: 25)
      date = '2023-08-09'
      rental = Rental.new(date, book, person)
      
      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
  
  describe '#to_hash' do
    it 'converts the rental object to a hash with appropriate references' do
      book1 = Book.new(123, 'The Great Gatsby', 'F. Scott Fitzgerald')
      book2 = Book.new(456, 'To Kill a Mockingbird', 'Harper Lee')
      person1 = Person.new(name: 'Alice', age: 25)
      person2 = Person.new(name: 'Bob', age: 30)
      
      rental = Rental.new('2023-08-09', book1, person2)
      
      hash = rental.to_hash([person1, person2], [book1, book2])
      
      expect(hash).to eq({
        'date' => '2023-08-09',
        'book_id' => 0,  
        'person_id' => 1  
      })
    end
  end
end
