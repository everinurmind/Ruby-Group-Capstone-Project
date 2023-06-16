require_relative './classes/item'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
require 'json'
require 'fileutils'
require_relative 'storage'
require_relative 'app'

DATA_DIR = 'data'.freeze
BOOKS_FILE = "#{DATA_DIR}/books.json".freeze
LABELS_FILE = "#{DATA_DIR}/labels.json".freeze
MUSIC_ALBUMS_FILE = "#{DATA_DIR}/music_albums.json".freeze
GENRES_FILE = "#{DATA_DIR}/genres.json".freeze
FileUtils.mkdir_p(DATA_DIR)

books = []
labels = []
music_albums = []
genres = []

load_books(books)
load_labels(labels)
load_music_albums(music_albums)
load_genres(genres)

loop do
  puts 'Hello! What would you like to do?'
  puts '1. List all books'
  puts '2. List all labels'
  puts '3. List all music albums'
  puts '4. List all genres'
  puts '5. Add a book'
  puts '6. Add a music album'
  puts '7. Quit'
  print 'Enter your choice: '
  choice = gets.chomp.to_i

  case choice
  when 1
    list_books(books)
  when 2
    list_labels(labels)
  when 3
    list_music_albums(music_albums)
  when 4
    list_genres(genres)
  when 5
    add_book(books, labels, genres)
  when 6
    add_music_album(music_albums, labels, genres)
  when 7
    save_books(books)
    save_labels(labels)
    save_music_albums(music_albums)
    save_genres(genres)
    puts 'Thank you for using the app! Have a Good Day!'
    break
  else
    puts 'Invalid choice. Please try again.'
    puts
  end
end
