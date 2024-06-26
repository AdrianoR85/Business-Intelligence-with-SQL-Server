![Project Status](https://img.shields.io/badge/status-completed-brightgreen)
# Business-Intelligence-with-SQL-Server

## Project Description
This repository documents the development of a complete Business Intelligence (BI) project for a fictitious retail store. The project covers the modeling of the relational database and 
data warehouse, the construction of cubes in Analysis Services, and the generation of reports with Report Services.

## Objectives:
- Introduce Microsoft BI tools in a practice project.
- Demonstrate data modeling for OLTP and OLAP.
- Implement data loading using Integration Services.
- Create multidimensional cubes in Analysis Services.

## Tools:
- SQL Server
- SQL Server Integration Services
- SQL Server Analysis Services
- SQL Server Reporting Services
- Windows Server 2022 
- StarUML
- VirtualBox

## [Certificate](Images/Certificado_BI_SQL_Server.jpg) 

## Projects Steps
1. Environment Setup
   - [x] Create a virtual machine.
   - [x] Install Windows Server 2022.
   - [x] Install and configure SQL Server BI tools.
   - [x] Install StarUML.

2. Setup an OLTP environment:
   - [x] Logical Modeling and Relationships.
   - <div><img src="/Modelagam/ERDDiagram.png" width="400"></div>
   - [x] Fisical Modeling. [Link](https://github.com/AdrianoR85/Business-Intelligence-with-SQL-Server/blob/main/Modelagam/Modelagem_OLTP_Fisica.sql)
   ```
   CREATE DATABASE oltp_commerce
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
   	total_value_invoice NUMERIC(10.2),
   	id_method_of_payment INT,
   	id_client INT,
   	id_seller INT
   )
   ```
   
3. OLTP Load
   - [x] Scripts. [Link](https://github.com/AdrianoR85/Business-Intelligence-with-SQL-Server/blob/main/Scripts)
   ```
   DECLARE
	@ID_CLIENT INT, @ID_SELLER INT, @ID_METHOD INT,
	@INVOICE_DATE DATE

   BEGIN
   	SET @ID_CLIENT = (SELECT TOP 1 id_client FROM client ORDER BY NEWID())
   	SET @ID_SELLER = (SELECT TOP 1 id_seller FROM seller ORDER BY NEWID())
   	SET @ID_METHOD = (SELECT TOP 1 id_method_of_payment FROM method_of_payment ORDER BY NEWID())
   	SET @INVOICE_DATE = (SELECT
                           CONVERT(DATE, CONVERT(VARCHAR(15), '2022-' + 
                           CONVERT(VARCHAR(5), (CONVERT(INT, RAND() * 12)) + 1) + '-' +
                           CONVERT(VARCHAR(5), (CONVERT(INT, RAND() * 27)) + 1))))

   	INSERT INTO 
   		invoice(id_client, id_method_of_payment, id_seller, date)
   	VALUES (
   		@ID_CLIENT, @ID_METHOD, @ID_SELLER, @INVOICE_DATE)
   END
   GO 9000
   ```

4. Stage Area
   - [x] Logical Modeling
   <img src="Images/02-STAGE_Picture.PNG">
   
   - [x] Fisical Modeling [Links](https://github.com/AdrianoR85/Business-Intelligence-with-SQL-Server/blob/main/Modelagam/02-STAGE_Fisico.sql)
   
   - [x] Load - OLTP to Stage 
   <img src="Images/Carga Produto.PNG">
   <img src="Images/Data flow da carga produto.PNG">

5. OLAP
   - [x] Fisical Modeling [Link](Images/03-DW_Picture.PNG)
   - [x] Logical Modeling [Link](Modelagam/03-DW_Fisico.sql)
   - [x] Load 
   - [x] Create Data Source
   - [x] Create Dimensions
   - [x] Create Cube
   <img src="Images/Projeto OLAP.PNG">

6. Reporting
   - [x] Configure Report Server
   - [x] Create Shared DataSource
   - [x] Create DataSet
   - [x] Create Reports
   <img src="Images/Reporting Serves.PNG">
   <img src="Images/Relatorio vendas.PNG">
		

### COMPLETED
