require 'json'
def load_books(books)
  return unless File.exist?(BOOKS_FILE)

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

def save_books(books)
  books_data = books.map(&:to_hash)
  File.write(BOOKS_FILE, JSON.pretty_generate(books_data))
end

def load_labels(labels)
  return unless File.exist?(LABELS_FILE)

  labels_data = JSON.parse(File.read(LABELS_FILE))
  labels_data.each do |label_data|
    label = Label.new(label_data['id'], label_data['title'], label_data['color'])
    label.items = label_data['items']
    labels << label
  end
end

def save_labels(labels)
  labels_data = labels.map(&:to_hash)
  File.write(LABELS_FILE, JSON.pretty_generate(labels_data))
end

def load_music_albums(music_albums)
  return unless File.exist?(MUSIC_ALBUMS_FILE)

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

def save_music_albums(music_albums)
  music_albums_data = music_albums.map(&:to_hash)
  File.write(MUSIC_ALBUMS_FILE, JSON.pretty_generate(music_albums_data))
end

def load_genres(genres)
  return unless File.exist?(GENRES_FILE)

  genres_data = JSON.parse(File.read(GENRES_FILE))
  genres_data.each do |genre_data|
    genre = Genre.new(genre_data['id'], genre_data['name'])
    genre.items = genre_data['items']
    genres << genre
  end
end

def save_genres(genres)
  genres_data = genres.map(&:to_hash)
  File.write(GENRES_FILE, JSON.pretty_generate(genres_data))
end

def load_games(games)
  return unless File.exist?(GAMES_FILE)

  games_data = JSON.parse(File.read(GAMES_FILE))
  games_data.each do |game_data|
    game = Game.new(nil, game_data['genre'], nil, game_data['multiplayer'], Date.parse(game_data['last_played_at']))
    games << game
  end
end

def save_games(games)
  games_data = games.map(&:to_hash)
  File.write(GAMES_FILE, JSON.pretty_generate(games_data))
end

def load_authors(authors)
  return unless File.exist?(AUTHORS_FILE)

  authors_data = JSON.parse(File.read(AUTHORS_FILE))
  authors_data.each do |author_data|
    author = Author.new(author_data['id'], author_data['first_name'], author_data['last_name'])
    authors << author
  end
end

def save_authors(authors)
  authors_data = authors.map(&:to_hash)
  File.write(AUTHORS_FILE, JSON.pretty_generate(authors_data))
end
