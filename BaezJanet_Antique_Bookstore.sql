CREATE DATABASE IF NOT EXISTS antique_bookstore_db;
USE antique_bookstore_db;

CREATE TABLE AUTHOR (
    Author_ID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Birth_Year INT,
    PRIMARY KEY (Author_ID)
);

CREATE TABLE CUSTOMER (
    Customer_ID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200),
    PRIMARY KEY (Customer_ID)
);

CREATE TABLE SUPPLIER (
    Supplier_ID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200),
    PRIMARY KEY (Supplier_ID)
);

CREATE TABLE CATEGORY (
    Category_ID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Category_ID)
);

CREATE TABLE BOOK (
    Book_ID INT AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    `Condition` VARCHAR(50),
    Publication_Year INT,
    Category_ID INT NOT NULL,
    PRIMARY KEY (Book_ID),
    CONSTRAINT fk_book_category
        FOREIGN KEY (Category_ID)
        REFERENCES CATEGORY(Category_ID)
);

CREATE TABLE BOOK_AUTHOR (
    Book_ID INT NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY (Book_ID, Author_ID),
    CONSTRAINT fk_bookauthor_book
        FOREIGN KEY (Book_ID)
        REFERENCES BOOK(Book_ID),
    CONSTRAINT fk_bookauthor_author
        FOREIGN KEY (Author_ID)
        REFERENCES AUTHOR(Author_ID)
);

CREATE TABLE PURCHASE (
    Customer_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Purchase_Date DATE NOT NULL,
    PRIMARY KEY (Customer_ID, Book_ID, Purchase_Date),
    CONSTRAINT fk_purchase_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES CUSTOMER(Customer_ID),
    CONSTRAINT fk_purchase_book
        FOREIGN KEY (Book_ID)
        REFERENCES BOOK(Book_ID)
);

CREATE TABLE BOOK_SUPPLIER (
    Book_ID INT NOT NULL,
    Supplier_ID INT NOT NULL,
    Supply_Date DATE NOT NULL,
    Supply_Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Book_ID, Supplier_ID, Supply_Date),
    CONSTRAINT fk_booksupplier_book
        FOREIGN KEY (Book_ID)
        REFERENCES BOOK(Book_ID),
    CONSTRAINT fk_booksupplier_supplier
        FOREIGN KEY (Supplier_ID)
        REFERENCES SUPPLIER(Supplier_ID)
);
USE antique_bookstore_db;
SHOW TABLES;
