class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_hash
    {
      'date' => @date,
      'person' => @person.to_hash,
      'book' => @book.to_hash
    }
  end
end

