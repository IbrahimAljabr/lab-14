-- We new create table authors
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

--  We fill the authors table from the books table without duplicate the data 
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

--  We add new column for the author_id to the books table 
ALTER TABLE books ADD COLUMN author_id INT;

-- We fill the books table from the authors table by author_id
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

--  We remove the authors column from the books table  
ALTER TABLE books DROP COLUMN author;

--  We connect the books table with the authors table
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);