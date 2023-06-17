def list_books(books)
  puts '=== List of Books ==='
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}, Publisher: #{book.publisher}, Published Date: #{book.publish_date}"
    puts "Cover State: #{book.cover_state}", "Genre: #{book.genre}", "Label: #{book.label}"
    puts '---------------------'
  end
  puts
end

def list_music_albums(music_albums)
  puts '=== List of Music Albums ==='
  music_albums.each do |album|
    puts "Title: #{album.title}, Artist: #{album.artist}, Published Date: #{album.publish_date}"
    puts "On Spotify: #{album.on_spotify}", "Genre: #{album.genre}", "Label: #{album.label}"
    puts '---------------------------'
  end
  puts
end

def list_games(games)
  puts '=== List of Games ==='
  games.each do |game|
    puts "ID: #{game.id}, Genre: #{game.genre}, Author: #{game.author}, Multiplayer: #{game.multiplayer}"
    puts "Last Played At: #{game.last_played_at}"
    puts '---------------------'
  end
  puts
end

def list_genres(genres)
  puts '=== List of Genres ==='
  genres.each do |genre|
    puts genre.name
  end
  puts
end

def list_labels(labels)
  puts '=== List of Labels ==='
  labels.each do |label|
    puts label.title
  end
  puts
end

def list_authors(authors)
  puts '=== List of Authors ==='
  authors.each do |author|
    puts "#{author.first_name} #{author.last_name}"
  end
  puts
end

def add_book(books, labels, genres)
  puts '=== Add a Book ==='
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

def add_music_album(music_albums, labels, genres)
  puts '=== Add a Music Album ==='
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

def add_game(games, authors)
  puts '=== Add a Game ==='
  print 'Genre: '
  genre = gets.chomp
  print 'Author ID: '
  author_id = gets.chomp.to_i
  author = authors.find { |a| a.id == author_id }
  print 'Multiplayer? (true/false): '
  multiplayer = gets.chomp.downcase == 'true'
  print 'Last Played At (YYYY-MM-DD): '
  last_played_at = gets.chomp
  game = Game.new(nil, genre, author, multiplayer, Date.parse(last_played_at))
  games << game
  puts 'Game added successfully!'
  puts
end
