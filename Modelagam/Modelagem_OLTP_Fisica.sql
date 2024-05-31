/* Create database */
CREATE DATABASE oltp_commerce

/* Active the database */
USE oltp_commerce

/* Create tables */
CREATE TABLE client (
	id_client INT PRIMARY KEY IDENTITY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(60) NOT NULL,
	gender CHAR(1) NOT NULL,
	birthday DATE NOT NULL
)

CREATE TABLE address (
	id_address INT PRIMARY KEY IDENTITY,
	street VARCHAR(100) NOT NULL,
	city VARCHAR(50) NOT NULL,
	state VARCHAR(20) NOT NULL,
	region VARCHAR(20) NOT NULL,
	id_client INT UNIQUE
)

CREATE TABLE seller (
	id_seller INT PRIMARY KEY IDENTITY,
	name VARCHAR(30) NOT NULL,
	gender CHAR(1) NOT NULL,
	email VARCHAR(60) NOT NULL,
	id_manager INT
)

CREATE TABLE product (
	id_product INT PRIMARY KEY IDENTITY,
	name VARCHAR(100) NOT NULL,
	price NUMERIC(10,2) NOT NULL,
	avg_cost NUMERIC NOT NULL,
	id_supplier INT,
	id_categoty INT
)

CREATE TABLE supplier (
	id_supplier INT PRIMARY KEY IDENTITY,
	name VARCHAR(50) NOT NULL
)

CREATE TABLE category (
	id_category INT PRIMARY KEY IDENTITY,
	name VARCHAR(30) NOT NULL
)

CREATE TABLE method_of_payment (
	id_method_of_payment INT PRIMARY KEY IDENTITY,
	method VARCHAR(50) NOT NULL
)

CREATE TABLE invoice_item (
	id_invoice_item INT PRIMARY KEY IDENTITY,
	quantity INT NOT NULL,
	total_value_item NUMERIC(10,2) NOT NULL,
	id_invoice INT,
	id_product INT
)

CREATE TABLE invoice (
	number INT PRIMARY KEY IDENTITY(1000, 1),
	date DATE NOT NULL,
	id_method_of_payment INT,
	id_client INT,
	id_seller INT
)

