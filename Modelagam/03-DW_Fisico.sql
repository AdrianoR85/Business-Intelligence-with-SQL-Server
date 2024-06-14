--CREATE DATABASE dw_commerce;
--GO

USE dw_commerce;
/*
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS [DIM_SELLER];
DROP TABLE IF EXISTS [DIM_INVOICE];
DROP TABLE IF EXISTS [DIM_METHOD];
DROP TABLE IF EXISTS [CATEGORY];
DROP TABLE IF EXISTS [DIM_PRODUCT];
DROP TABLE IF EXISTS [DIM_CLIENT];
DROP TABLE IF EXISTS [DIM_SUPPLIER];
DROP TABLE IF EXISTS [DIM_TIME];
DROP TABLE IF EXISTS [FACT];

SET FOREIGN_KEY_CHECKS = 1;
*/
CREATE TABLE [dim_seller] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [id_seller] INTEGER NOT NULL,
    [start] DATE NOT NULL,
    [end] DATE NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [gender] VARCHAR(20) NOT NULL,
    [id_manager] INTEGER NOT NULL
);
GO

CREATE TABLE [dim_invoice] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [id_invoice] INTEGER NOT NULL
);
GO

CREATE TABLE [dim_method] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [id_method] INTEGER NOT NULL,
    [method] VARCHAR(30) NOT NULL
);
GO

CREATE TABLE [category] (
    [id_category] INTEGER PRIMARY KEY NOT NULL,
    [name] VARCHAR(50) NOT NULL
);

CREATE TABLE [dim_product] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [id_product] INTEGER NOT NULL,
    [start] DATE NOT NULL,
    [end] DATE NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [id_category] INTEGER NOT NULL,
	FOREIGN KEY(id_category) REFERENCES [category]([id_category])
);
GO

CREATE TABLE [dim_client] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [id_client] INTEGER NOT NULL,
    [start] DATE NOT NULL,
    [end] DATE NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [gender] VARCHAR(20) NOT NULL,
    [email] VARCHAR(50) NOT NULL,
    [birth_date] DATE NOT NULL,
    [city] VARCHAR(50) NOT NULL,
    [state] VARCHAR(30) NOT NULL,
    [region] VARCHAR(30) NOT NULL,
    [Column1] VARCHAR(30) NOT NULL
);
GO

CREATE TABLE [dim_supplier] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [id_supplier] INTEGER NOT NULL,
    [start] DATE NOT NULL,
    [end] DATE NOT NULL,
    [name] VARCHAR(100) NOT NULL
);
GO

CREATE TABLE [dim_time] (
    [id_sk] INTEGER PRIMARY KEY NOT NULL,
    [date] DATE NOT NULL,
    [day] CHAR(2) NOT NULL,
    [weekday] VARCHAR(15) NOT NULL,
    [month] CHAR(2) NOT NULL,
    [month_names] VARCHAR(15) NOT NULL,
    [quarter] TINYINT NOT NULL,
    [quarter_year] VARCHAR(15) NOT NULL,
    [year] CHAR(4) NOT NULL,
    [season] VARCHAR(15) NOT NULL,
    [weekend] CHAR(3) NOT NULL,
    [full_date] VARCHAR(15) NOT NULL
);
GO

CREATE TABLE [fact] (
    [id_invoice] INTEGER REFERENCES [dim_invoice]([id_sk])  NOT NULL,
    [id_client] INTEGER REFERENCES [dim_client]([id_sk]) NOT NULL,
    [id_seller] INTEGER REFERENCES [dim_seller]([id_sk]) NOT NULL,
    [id_method] INTEGER REFERENCES [dim_method]([id_sk]) NOT NULL,
    [id_product] INTEGER REFERENCES [dim_product]([id_sk]) NOT NULL,
    [id_supplier] INTEGER REFERENCES [dim_supplier]([id_sk]) NOT NULL,
    [id_time] INTEGER REFERENCES [dim_time]([id_sk]) NOT NULL,
    [quantity] INTEGER NOT NULL,
    [total_item] DECIMAL(10,2) NOT NULL,
    [total_cost] DECIMAL(10,2) NOT NULL,
    [total_profit] DECIMAL(10,2) NOT NULL
);
GO
