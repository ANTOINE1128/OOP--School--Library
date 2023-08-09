class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(id = Random.rand(100..10_000), title = 'no title', author = 'no author')
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  def to_hash
    {
      # 'id' => @id,
      'title' => @title,
      'author' => @author,
      # 'rentals' => @rentals.map { |rental| 'date' => rental.date }
    }
  end

  # def add_rental(rental)
  #   @rentals << rental
  # end
end
