USE [dw_commerce]
GO

CREATE VIEW v_supplier_analisys AS
SELECT 
	SP.[name] AS Fornecedor, 
	T.year AS Ano,
	SUM(F.quantity) AS Quantidade,
	SUM(F.total_item) AS Total_vendido

FROM stage_commerce.dbo.st_fact AS F 

INNER JOIN dbo.dim_supplier AS SP
ON F.id_supplier = SP.id_supplier

INNER JOIN dbo.dim_time AS T
ON (CONVERT(VARCHAR, F.date,102)) =( CONVERT(VARCHAR, T.date,102))
GROUP BY SP.name, T.year
GO
