-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

-- USE DATABASE
USE ecommerce_db;

-- Create Category table
CREATE TABLE category (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(255)
);

-- Create Product table
CREATE TABLE product (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  category_id INTEGER,
  FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Create Tag table
CREATE TABLE tag (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  tag_name VARCHAR(255) NOT NULL
);

-- Create ProductTag table
CREATE TABLE product_tag (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  product_id INTEGER,
  tag_id INTEGER,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (tag_id) REFERENCES tag(id)
);
