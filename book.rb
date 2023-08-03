class Book
  attr_accessor :title, :author, :date
  attr_reader :rentals

  def initialize(title = 'no title', author = 'no author')
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end
