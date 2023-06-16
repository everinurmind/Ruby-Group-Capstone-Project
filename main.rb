require_relative './classes/item'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
require 'json'
require 'fileutils'
DATA_DIR = 'data'.freeze
BOOKS_FILE = "#{DATA_DIR}/books.json".freeze
LABELS_FILE = "#{DATA_DIR}/labels.json".freeze
MUSIC_ALBUMS_FILE = "#{DATA_DIR}/music_albums.json".freeze
GENRES_FILE = "#{DATA_DIR}/genres.json".freeze
FileUtils.mkdir_p(DATA_DIR)
def list_books(books)
  puts 'Listing all books:'
  books.each do |book|
    puts "Title: #{book.title}, Publisher: #{book.publisher}, Published Date: #{book.publish_date}"
    puts "Cover State: #{book.cover_state}", "Genre: #{book.genre}", "Label: #{book.label}"
  end
  puts
end

def list_labels(labels)
  puts 'Listing all lables:'
  Label.all_labels(labels)
end

def add_book(books, labels, genres)
  puts 'Adding a new book:'
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  print 'Publisher: '
  publisher = gets.chomp
  print 'Published Date (YYYY-MM-DD): '
  publish_date = gets.chomp
  print 'Cover State: '
  cover_state = gets.chomp
  book = Book.new(Date.parse(publish_date), publisher, cover_state)
  book.title = title
  book.author = author
  Label.all_labels(labels)
  print 'Label: '
  label_id = gets.chomp.to_i
  label = labels.find { |l| l.id == label_id }
  book.label = label
  Genre.all_genres(genres)
  print 'Genre: '
  genre_id = gets.chomp.to_i
  genre = genres.find { |g| g.id == genre_id }
  book.genre = genre
  books << book
  puts 'Book added successfully!'
  puts
end

def list_music_albums(music_albums)
  puts 'Listing all music albums:'
  music_albums.each do |album|
    puts "Title: #{album.title}, Artist: #{album.artist}, Published Date: #{album.publish_date}"
    puts "On Spotify: #{album.on_spotify}", "Genre: #{album.genre}", "Label: #{album.label}"
  end
  puts
end

def list_genres(genres)
  puts 'Listing all genres:'
  Genre.all_genres(genres)
end

def add_music_album(music_albums, labels, genres)
  puts 'Adding a new music album:'
  print 'Title: '
  title = gets.chomp
  print 'Artist: '
  artist = gets.chomp
  print 'Published Date (YYYY-MM-DD): '
  publish_date = gets.chomp
  print 'On Spotify? (true/false): '
  on_spotify = gets.chomp.downcase == 'true'
  album = MusicAlbum.new(Date.parse(publish_date), artist, on_spotify)
  album.title = title
  Label.all_labels(labels)
  print 'Label: '
  label_id = gets.chomp.to_i
  label = labels.find { |l| l.id == label_id }
  album.label = label
  Genre.all_genres(genres)
  print 'Genre: '
  genre_id = gets.chomp.to_i
  genre = genres.find { |g| g.id == genre_id }
  album.genre = genre
  music_albums << album
  puts 'Music album added successfully!'
  puts
end
books = []
labels = []
music_albums = []
genres = []
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
if File.exist?(MUSIC_ALBUMS_FILE)
  music_albums_data = JSON.parse(File.read(MUSIC_ALBUMS_FILE))
  music_albums_data.each do |album_data|
    album = MusicAlbum.new(Date.parse(album_data['publish_date']), album_data['artist'], album_data['on_spotify'],
                           album_data['id'])
    album.title = album_data['title']
    album.genre = album_data['genre']
    album.archived = album_data['archived']
    music_albums << album
  end
end
if File.exist?(GENRES_FILE)
  genres_data = JSON.parse(File.read(GENRES_FILE))
  genres_data.each do |genre_data|
    genre = Genre.new(genre_data['id'], genre_data['name'])
    genre.items = genre_data['items']
    genres << genre
  end
end
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
    books_data = books.map(&:to_hash)
    labels_data = labels.map(&:to_hash)
    music_albums_data = music_albums.map(&:to_hash)
    genres_data = genres.map(&:to_hash)
    File.write(BOOKS_FILE, JSON.generate(books_data))
    File.write(LABELS_FILE, JSON.generate(labels_data))
    File.write(MUSIC_ALBUMS_FILE, JSON.generate(music_albums_data))
    File.write(GENRES_FILE, JSON.generate(genres_data))
    puts 'Thank you for using the app! Have a Good Day!'
    break
  else
    puts 'Invalid choice. Please try again.'
    puts
  end
end
