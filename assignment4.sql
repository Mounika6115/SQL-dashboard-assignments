-- Question 1
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    publication_date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Question 2
DELIMITER $$

CREATE PROCEDURE sp_insert_author(
    IN p_name VARCHAR(100),
    IN p_birthdate DATE
)
BEGIN
    INSERT INTO authors(name, birthdate)
    VALUES (p_name, p_birthdate);
END $$

DELIMITER ;

-- Question 3
DELIMITER $$

CREATE PROCEDURE sp_insert_book(
    IN p_title VARCHAR(200),
    IN p_author_id INT,
    IN p_publication_date DATE,
    IN p_price DECIMAL(10,2)
)
BEGIN
    IF EXISTS (SELECT 1 FROM authors WHERE author_id = p_author_id) THEN
        INSERT INTO books(title, author_id, publication_date, price)
        VALUES (p_title, p_author_id, p_publication_date, p_price);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Author ID does not exist';
    END IF;
END $$

DELIMITER ;

-- Question 4
DELIMITER $$

CREATE PROCEDURE sp_get_books_by_author(
    IN p_author_id INT
)
BEGIN
    SELECT *
    FROM books
    WHERE author_id = p_author_id;
END $$

DELIMITER ;

-- Question 5
CALL sp_insert_author('J.K. Rowling', '1965-07-31');
CALL sp_insert_author('George Orwell', '1903-06-25');

CALL sp_insert_book('Harry Potter', 1, '1997-06-26', 499.99);
CALL sp_insert_book('1984', 2, '1949-06-08', 299.99);

CALL sp_get_books_by_author(1);

-- Question 6 (Example Execution Results)

-- Author inserted successfully.
-- Author inserted successfully.
-- Book inserted successfully.
-- Book inserted successfully.

-- Output of:
-- CALL sp_get_books_by_author(1);

-- Book ID: 1
-- Title: Harry Potter
-- Author ID: 1
-- Publication Date: 1997-06-26
-- Price: 499.99
