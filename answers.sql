-- Library Management System Database --
-- Author: Andiswa Cyria Molangathi -- 
-- Date: 2025-05-08

DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Book_Author;
DROP TABLE IF EXISTS Members;

-- Categories table -- 
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY, 
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Authors table --
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    join_date DATE NOT NULL
);

-- Members table -- 


-- Books table -- 
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    category_id INT,
    publication_year YEAR,
    isbn VARCHAR(13) UNIQUE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Loans table --
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Book_Author table (Many-to-Many)
CREATE TABLE Book_Author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);