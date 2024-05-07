-- One-to-One
CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(100),
  passport_number VARCHAR(10) UNIQUE,
  CONSTRAINT fk_employee FOREIGN KEY (passport_number) REFERENCES passport(number)
);

CREATE TABLE passport (
  number VARCHAR(10) PRIMARY KEY,
  country VARCHAR(50),
  issue_date DATE
);

-- One-to-Many
CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50) UNIQUE
);

CREATE TABLE order (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  order_date DATE,
  total_amount NUMERIC(10,2),
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- Many-to-Many
CREATE TABLE song (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50),
  duration TIME
);

CREATE TABLE artist (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  genre VARCHAR(50)
);

CREATE TABLE song_artist (
  song_id INTEGER,
  artist_id INTEGER,
  PRIMARY KEY (song_id, artist_id),
  CONSTRAINT fk_song FOREIGN KEY (song_id) REFERENCES song(id),
  CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES artist(id)
);