CREATE DATABASE ruby_capstone;

CREATE TABLE genre(
  id SERIAL PRIMARY KEY
);

CREATE TABLE source(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE label(
  id SERIAL PRIMARY KEY
);

CREATE TABLE author(
  id SERIAL PRIMARY KEY
);

CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);

CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  publish_date date,
  archived boolean,
  silent boolean,
  genre_id INT,
  source_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);