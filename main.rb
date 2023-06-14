require_relative './classes/item'
require_relative './classes/book'
require_relative './classes/label'
require 'json'
require 'fileutils'

DATA_DIR = 'data'.freeze
BOOKS_FILE = "#{DATA_DIR}/books.json".freeze
LABELS_FILE = "#{DATA_DIR}/labels.json".freeze

FileUtils.mkdir_p(DATA_DIR)

def list_books(books)
  puts 'Listing all books:'
  books.each do |book|
    puts "Title: #{book.title}, Publisher: #{book.publisher}, Published Date: #{book.publish_date}"
  end
  puts
end

def list_labels(labels)
  puts 'Listing all labels:'
  labels.each do |label|
    puts "Label: #{label.title}, Color: #{label.color}"
  end
  puts
end

def add_book(books)
  puts 'Adding a new book:'
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  gets.chomp
  print 'Publisher: '
  publisher = gets.chomp
  print 'Published Date (YYYY-MM-DD): '
  publish_date = gets.chomp
  print 'Cover State: '
  cover_state = gets.chomp

  book = Book.new(Date.parse(publish_date), publisher, cover_state)
  book.title = title
  books << book

  puts 'Book added successfully!'
  puts
end

books = []
labels = []

if File.exist?(BOOKS_FILE)
  books_data = JSON.parse(File.read(BOOKS_FILE))
  books_data.each do |book_data|
    book = Book.new(Date.parse(book_data['publish_date']), book_data['publisher'], book_data['cover_state'],
                    book_data['id'])
    book.genre = book_data['genre']
    book.author = book_data['author']
    book.source = book_data['source']
    book.label = book_data['label']
    book.archived = book_data['archived']
    books << book
  end
end

if File.exist?(LABELS_FILE)
  labels_data = JSON.parse(File.read(LABELS_FILE))
  labels_data.each do |label_data|
    label = Label.new(label_data['id'], label_data['title'], label_data['color'])
    label.items = label_data['items']
    labels << label
  end
end

loop do
  puts 'Hello! What would you like to do?'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. Add a book'
  puts '4. Quit'
  print 'Enter your choice: '

  choice = gets.chomp.to_i

  case choice
  when 1
    list_books(books)
  when 2
    list_labels(labels)
  when 3
    add_book(books)
  when 4
    books_data = books.map(&:to_hash)
    labels_data = labels.map(&:to_hash)
    File.write(BOOKS_FILE, JSON.generate(books_data))
    File.write(LABELS_FILE, JSON.generate(labels_data))
    puts 'Thank you for using app! Have a Good Day!.'
    break
  else
    puts 'Invalid choice. Please try again.'
    puts
  end
end
