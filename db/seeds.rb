# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# typed: true

extend T::Sig

Author.destroy_all
Publisher.destroy_all
Customer.destroy_all
Book.destroy_all
Library.destroy_all
LibraryBook.destroy_all

authors = T.let([], T::Array[Author])
publishers = T.let([], T::Array[Publisher])
customers = T.let([], T::Array[Customer])
books = T.let([], T::Array[Book])

3.times do
  publishers.push(Publisher.create(name: Faker::Company.name))
end

12.times do
  authors.push(Author.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name))
end

5.times do
  customers.push(Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, telephone: Faker::PhoneNumber, email: Faker::Internet.email))
end

20.times do
  books.push(Book.create(author_id: T.cast(authors.sample, Author).id, publisher_id: T.cast(publishers.sample, Publisher).id, title: Faker::Books::Lovecraft.tome, genre: Faker::Book.genre, isbn: Faker::Number.number(digits: 10)))
end

2.times do
  library = Library.create(name: Faker::FunnyName.name, street_number: Faker::Address.building_number, street: Faker::Address.street_name, city: Faker::Address.city)
  library_books = T.cast(books.sample(rand(0..20)), T::Array[Book])

  library.library_books = library_books.map do |l_book|
    state = rand(0..1) === 0 ? :available : :rented
    LibraryBook.create(book_id: T.cast(books.sample, Book).id, library_id: library.id, state: state, renting_price: rand(0..100), rented_by_id: state == :rented ? T.cast(customers.sample, Customer).id : nil, rented_since: state == :rented ? DateTime.now.days_ago(rand(0..14)):nil)
  end
end
