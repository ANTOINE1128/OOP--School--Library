require_relative 'person'
require_relative 'nameable'
require_relative 'Decorator'
require_relative 'Trimmer_Decorator'
require_relative 'Capitalize_Decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

require_relative 'app'

def main
  books = []
  people = []

  loop do
    puts "\nSelect an option:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'

    choice = gets.chomp.to_i

    case choice
    when 1
      list_books(books)
    when 2
      list_people(people)
    when 3
      person = create_person
      people << person
      puts "Person created: #{person.name}"
    when 4
      book = create_book
      books << book
      puts "Book created: #{book.title}"
    when 5
      rental = create_rental(books, people)
      rental.person.add_rental(rental)
      rental.book.add_rental(rental)
      puts "Rental created for #{rental.person.name} - #{rental.book.title}"
    when 6
      puts 'Select a person by entering their number:'
      list_people(people)
      person_index = gets.chomp.to_i - 1
      selected_person = people[person_index]
      list_rentals_for_person(selected_person)
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid choice. Please select a valid option.'
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
