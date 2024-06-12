--CREATE DATABASE stage_commerce
--GO

USE stage_commerce

-- Client
-- Seller
-- Category
-- Supplier
-- Product
-- Method of payment

-- Fato - mensaure 

-- Total
-- Quantity
-- Profit
-- Cost


CREATE TABLE st_client(
	id_client INT DEFAULT NULL,
	name VARCHAR(100) DEFAULT NULL,
	gender VARCHAR(20) DEFAULT NULL,
	birthday DATE DEFAULT NULL,
	city VARCHAR(100) DEFAULT NULL,
	state VARCHAR(10) DEFAULT NULL, 
	region VARCHAR(20) DEFAULT NULL
)
GO

CREATE TABLE st_method(
	id_method INT DEFAULT NULL
)
GO

CREATE TABLE st_supplier(
	id_supplier INT DEFAULT NULL,
	name VARCHAR(100) DEFAULT NULL
)
GO

CREATE TABLE st_product(
	id_product INT DEFAULT NULL,
	name VARCHAR(50) DEFAULT NULL,
	unit_price NUMERIC(10,2) DEFAULT NULL,
	avg_cost NUMERIC(10,2) DEFAULT NULL,
	idcategoty INT DEFAULT NULL
)
GO

CREATE TABLE st_category(
	id_category INT DEFAULT NULL,
	name VARCHAR(50) DEFAULT NULL,
)
GO

CREATE TABLE st_invoice(
	id_invoice INT DEFAULT NULL
)
GO

CREATE TABLE st_seller(
	id_seller INT DEFAULT NULL,
	name VARCHAR(50) DEFAULT NULL,
	gender VARCHAR(20) DEFAULT NULL,
	id_manager INT DEFAULT NULL
)
GO

CREATE TABLE st_fact(
	id_client INT DEFAULT NULL,
	id_seller INT DEFAULT NULL,
	id_product INT DEFAULT NULL,
	id_supplier INT DEFAULT NULL,
	id_invoice INT DEFAULT NULL,
	id_method INT DEFAULT NULL,
	quantity INT DEFAULT NULL,
	total_item NUMERIC(10, 2) DEFAULT NULL,
	date DATE DEFAULT NULL,
	total_cost NUMERIC(10, 2) DEFAULT NULL,
	total_profit NUMERIC(10, 2) DEFAULT NULL,
)
GO
