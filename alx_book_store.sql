CREATE DATABASE alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  ISBN VARCHAR(20) UNIQUE,
  genre VARCHAR(50),
  publisher VARCHAR(100),
  description TEXT,
  image_url VARCHAR(255),
  price DOUBLE NOT NULL,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) UNIQUE NOT NULL,
  address TEXT,
  phone_number VARCHAR(20),
  city VARCHAR(50),
  postal_code VARCHAR(20),
  country VARCHAR(50)
);

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  shipping_address TEXT,
  billing_address TEXT,
  order_status VARCHAR(20),
  total_price DOUBLE,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity INT NOT NULL,
  price DOUBLE NOT NULL,
  discount DOUBLE,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
