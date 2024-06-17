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
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [id_seller] INTEGER,
    [start] DATE,
    [end] DATE,
    [name] VARCHAR(50),
    [gender] VARCHAR(20),
    [id_manager] INTEGER
);
GO

CREATE TABLE [dim_invoice] (
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [id_invoice] INTEGER
);
GO

CREATE TABLE [dim_method] (
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [id_method] INTEGER,
    [method] VARCHAR(30)
);
GO

CREATE TABLE [category] (
    [id_category] INTEGER PRIMARY KEY,
    [name] VARCHAR(50)
);

CREATE TABLE [dim_product] (
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [id_product] INTEGER,
	[id_category] INTEGER REFERENCES [category]([id_category]),
    [start] DATE,
    [end] DATE,
    [name] VARCHAR(50),
	[unit_price] NUMERIC(10,2) DEFAULT NULL,
	[avg_cost] NUMERIC(10,2) DEFAULT NULL
);
GO

CREATE TABLE [dim_client] (
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [id_client] INTEGER,
    [start] DATE,
    [end] DATE,
    [name] VARCHAR(100),
    [gender] VARCHAR(20),
    [birth_date] DATE,
	[email] VARCHAR(50),
    [city] VARCHAR(50),
    [state] VARCHAR(30),
    [region] VARCHAR(30),
);
GO

CREATE TABLE [dim_supplier] (
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [id_supplier] INTEGER,
    [start] DATE,
    [end] DATE,
    [name] VARCHAR(100)
);
GO

CREATE TABLE [dim_time] (
    [id_sk] INTEGER PRIMARY KEY IDENTITY(1,1),
    [date] DATE,
    [day] CHAR(2),
    [weekday] VARCHAR(15),
    [month] CHAR(2),
    [month_names] VARCHAR(15),
    [quarter] TINYINT,
    [quarter_year] VARCHAR(15),
    [year] CHAR(4),
    [season] VARCHAR(15),
    [weekend] CHAR(3),
    [full_date] VARCHAR(15)
);
GO

CREATE TABLE [fact] (
    [id_invoice] INTEGER REFERENCES [dim_invoice]([id_sk]),
    [id_client] INTEGER REFERENCES [dim_client]([id_sk]),
    [id_seller] INTEGER REFERENCES [dim_seller]([id_sk]),
    [id_method] INTEGER REFERENCES [dim_method]([id_sk]),
    [id_product] INTEGER REFERENCES [dim_product]([id_sk]),
    [id_supplier] INTEGER REFERENCES [dim_supplier]([id_sk]),
    [id_time] INTEGER REFERENCES [dim_time]([id_sk]),
    [quantity] INTEGER,
    [total_item] DECIMAL(10,2),
    [total_cost] DECIMAL(10,2),
    [total_profit] DECIMAL(10,2)
);
GO
