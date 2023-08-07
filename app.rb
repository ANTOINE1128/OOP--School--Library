require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'user_input_helper'

class App
  attr_accessor :books, :persons, :rentals

  include UserInputHelper

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # List all books.
  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "📚 Title: #{book.title} by #{book.author}"
    end
  end

  # List all people.
  def list_people
    puts 'No persons available' if @persons.empty?
    @persons.each do |person|
      if person.instance_of?(Student)
        puts "[Student 🧍], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      else
        puts "[Teacher 👨‍🏫], ID: #{person.id}, Name: #{person.name}, age: #{person.age}"
      end
    end
  end

  def input_age
    puts 'Age'
    gets.chomp.to_i
  end

  def input_name
    puts 'Name'
    gets.chomp
  end

  # Create a person (teacher or student)
  def create_a_person
    is_student = get_user_input('Do you want to add a student (1) or a teacher (2)? [Insert the number]')
    age = input_age
    name = input_name

    create_person_value(is_student.to_i, age, name)
  end

  def create_student(age, name)
    student = Student.new(age: age, name: name)
    populate_array(@persons, student)
  end

  def populate_array(array, content)
    array.push(content)
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age: age, specialization: specialization, name: name)
    populate_array(@persons, teacher)
  end

  def create_person_value(person, age, name)
    student = 1
    teacher = 2
    case person
    when student
      response = get_user_input('Has parent permission? [Y/N]')
      if response == 'n'
        get_user_input('Access denied')
      elsif response == 'y'
        create_student(age, name)
      else
        puts 'Out of range'
      end
    when teacher
      puts 'Specialization'
      specialization = gets.chomp
      create_teacher(age, specialization, name)
    end
    puts '🎉 Person added successfully.'
  end

  # Create a book
  def create_a_book
    puts 'Title'
    book_title = gets.chomp
    puts 'Author'
    book_author = gets.chomp
    book = Book.new(title: book_title, author: book_author)
    @books.push(book)
    puts '🎉 Book added successfully.'
  end

  # Create a rental
  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    selected_book = @books[book_index]
    puts 'Select a person from the following list by number (not ID)'
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    selected_person = @persons[person_index]
    puts 'Enter Rental Date (yyyy-mm-dd)'
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_person)
    @rentals.push(rental)
    puts '🔑 Rental added successfully'
  end

  # List all rentals for a given person id.
  def list_rentals
    puts 'ID of person'
    input_person_id = gets.chomp.to_i
    puts 'Rentals'
    @rentals.each do |rental|
      if rental.person.id == input_person_id
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author} 🤝"
      end
    end
  end
end
<<<<<<< HEAD








# app1 = App.new
# # puts app1.create_person_value(2, 34, 'charles')
# app1.create_teacher(34, 'kids', 'sa')
# app1.persons.each { |n| puts "#{n.name}" }
=======
>>>>>>> 951d5f194d4266d1346982cb7f7c31bb4d77e121
