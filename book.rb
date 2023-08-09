class Book
  attr_accessor :title, :author, :date, :person
  attr_reader :rentals

  def initialize(title = 'no title', author = 'no author')
    @id = Random.rand(100..10_000)
    @title = title
    @author = author
    @rentals = []
  end

  # def add_rental(person, date)
  #   Rental.new(date, person, self)
  # end

  def to_hash
    {
      'title' => @title,
      'author' => @author
      # "rentals" = []
    }
  end

  def add_rental(rental)
    @rentals << rental
  end
end
