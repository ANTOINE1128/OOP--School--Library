class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_hash(persons, books)
    {
      'date' => @date,
      'book_id' => books.index(@book),
      'person_id' => persons.index(@person)
    }
  end
end
