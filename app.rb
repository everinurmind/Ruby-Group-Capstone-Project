def list_books(books)
  puts 'Listing all books:'
  books.each do |book|
    puts "Title: #{book.title}, Publisher: #{book.publisher}, Published Date: #{book.publish_date}"
    puts "Cover State: #{book.cover_state}", "Genre: #{book.genre}", "Label: #{book.label}"
  end
  puts
end

def list_labels(labels)
  puts 'Listing all labels:'
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
