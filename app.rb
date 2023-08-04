require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

def list_books(books)
  puts 'List of Books:'
  books.each_with_index do |book, index|
    puts "#{index + 1}. #{book.title} by #{book.author}"
  end
end

def list_people(people)
  puts 'List of People:'
  people.each_with_index do |person, index|
    puts "#{index + 1}. #{person.name} (#{person.class})"
  end
end

def create_person
  puts "Enter person's name:"
  name = gets.chomp
  puts "Enter person's age:"
  age = gets.chomp.to_i
  puts 'Is this person a student? (y/n)'
  is_student = gets.chomp.downcase == 'y'
  return Teacher.new(name: name, age: age) unless is_student

  puts 'Enter classroom label:'
  classroom_label = gets.chomp
  Student.new(Classroom.new(classroom_label), age, name)
end

def create_book
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter author:'
  author = gets.chomp
  Book.new(title, author)
end

def create_rental(books, people)
  puts 'Select a book by entering its number:'
  list_books(books)
  book_index = gets.chomp.to_i - 1
  selected_book = books[book_index]

  puts 'Select a person by entering their number:'
  list_people(people)
  person_index = gets.chomp.to_i - 1
  selected_person = people[person_index]

  puts 'Enter rental date (YYYY-MM-DD):'
  date = gets.chomp

  Rental.new(date, selected_book, selected_person)
end

def list_rentals_for_person(person)
  puts "Rentals for #{person.name}:"
  person.rentals.each do |rental|
    puts "#{rental.date}, Book: #{rental.book.title}"
  end
end
