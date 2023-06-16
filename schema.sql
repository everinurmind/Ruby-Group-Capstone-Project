-- Table for Item class
CREATE TABLE items (
  id INT PRIMARY KEY,
  genre VARCHAR(255),
  author_id INT,
  source VARCHAR(255),
  label_id INT,
  publish_date DATE,
  archived BOOLEAN
);

-- Table for Book class
CREATE TABLE books (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY (id) REFERENCES items(id)
);

-- Table for MusicAlbum class
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255),
  on_spotify BOOLEAN,
  FOREIGN KEY (id) REFERENCES items(id)
);

-- Table for Genre class
CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

-- Table for Game class
CREATE TABLE games (
  id INT PRIMARY KEY,
  genre VARCHAR(255),
  author_id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (id) REFERENCES items(id)
);

-- Table for Author class
CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Table for Label class
CREATE TABLE labels (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Association table for books and labels (one-to-many)
CREATE TABLE books_labels (
  book_id INT,
  label_id INT,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Association table for music albums and labels (one-to-many)
CREATE TABLE music_albums_labels (
  music_album_id INT,
  label_id INT,
  FOREIGN KEY (music_album_id) REFERENCES music_albums(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Association table for genres and items (one-to-many)
CREATE TABLE genres_items (
  genre_id INT,
  item_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Association table for authors and items (one-to-many)
CREATE TABLE authors_items (
  author_id INT,
  item_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (item_id) REFERENCES items(id)
);
