CREATE DATABASE ruby_capstone;

CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE source(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE label(
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  color VARCHAR(20),
);

CREATE TABLE author(
  id SERIAL PRIMARY KEY
  first_name VARCHAR(30)
  last_name VARCHAR(30)
);

CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
);

CREATE TABLE book(
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(80),
  cover_state VARCHAR(20),
  publish_date date,
  archived boolean,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  silent boolean,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
);

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
  publish_date date,
  archived boolean,
  multiplayer boolean,
  last_played_at date,
);

CREATE TABLE music_album(
  id SERIAL PRIMARY KEY,
  on_spotify: boolean,
  publish_date date,
  archived boolean,
  silent boolean,
  genre_id INT REFERENCES genre(id),
  source_id INT REFERENCES source(id),
  author_id INT REFERENCES author(id),
  label_id INT REFERENCES label(id),
);

CREATE INDEX author_id_asc_item ON item(author_id ASC);
CREATE INDEX source_id_asc_item ON item(source_id ASC);
CREATE INDEX genre_id_asc_item ON item(genre_id ASC);
CREATE INDEX label_id_asc_item ON item(label_id ASC);

CREATE INDEX author_id_asc_book ON book(author_id ASC);
CREATE INDEX source_id_asc_book ON book(source_id ASC);
CREATE INDEX genre_id_asc_book ON book(genre_id ASC);
CREATE INDEX label_id_asc_book ON book(label_id ASC);

CREATE INDEX author_id_asc_movies ON movies(author_id ASC);
CREATE INDEX source_id_asc_movies ON movies(source_id ASC);
CREATE INDEX genre_id_asc_movies ON movies(genre_id ASC);
CREATE INDEX label_id_asc_movies ON movies(label_id ASC);

CREATE INDEX author_id_asc_games ON games(author_id ASC);
CREATE INDEX source_id_asc_games ON games(source_id ASC);
CREATE INDEX genre_id_asc_games ON games(genre_id ASC);
CREATE INDEX label_id_asc_games ON games(label_id ASC);

CREATE INDEX author_id_asc_music_album ON music_album(author_id ASC);
CREATE INDEX source_id_asc_music_album ON music_album(source_id ASC);
CREATE INDEX genre_id_asc_music_album ON music_album(genre_id ASC);
CREATE INDEX label_id_asc_music_album ON music_album(label_id ASC);
