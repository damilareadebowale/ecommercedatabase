DROP DATABASE IF EXISTS newecommerce;
CREATE DATABASE newecommerce;
USE newecommerce;

CREATE TABLE customers (
    customer_id INT(5) NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(20) DEFAULT NULL,
    customer_address VARCHAR(100),
    customer_state CHAR(5) NOT NULL,
    PRIMARY KEY (`customers_id`)
);

CREATE TABLE productcategory (
    productcategory_id INT(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    productname VARCHAR(50) NOT NULL,
    productcategory_info VARCHAR(150)
);

CREATE TABLE product_description (
    product_description_id INT(5) NOT NULL AUTO_INCREMENT,
    productname VARCHAR(50) NOT NULL,
    productquantity INT(10) NOT NULL,
    unit_price (10, 2) NOT NULL,
    size VARCHAR(5) NULL,
    images VARCHAR(10000) NOT NULL,
    productcategory_id INT,
    FOREIGN KEY (productcategory_id) REFERENCES productcategory(productcategory_id);
);

CREATE TABLE payment(
    payment_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    payment_type VARCHAR(10),
    amount DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_name VARCHAR(50),
    productquantity INT,
    transaction_status VARCHAR(20),
    customer_id INT,
    order_date DATETIME,
    shipper_date DATETIME,
    payment_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (productquantity) REFERENCES product_description(productquantity)
);

CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    shipping_address VARCHAR(150),
    shipping_city VARCHAR(50),
    shipping_state VARCHAR(30),
    shipping_country VARCHAR(20),
    shipping_status VARCHAR(30)
    order_id INT,
    payment_id INT,
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(payment_id) REFERENCES payment(payment_id);
);

CREATE TABLE shippers(
    shipper_id INT PRIMARY KEY AUTO_INCREMENT,
    shipper_name VARCHAR(50) NOT NULL,
    shipper_address VARCHAR(150) NOT NUL,
);

CREATE TABLE suppliers(
    supplier_id INT PRIMARY KEY,
    company_name VARCHAR (20),
    supplier_address VARCHAR(200),
    city VARCHAR(50),
    supplier_country VARCHAR(30),
    phone_number VARCHAR(15)
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);