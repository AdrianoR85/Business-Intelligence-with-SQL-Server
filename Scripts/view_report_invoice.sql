USE oltp_commerce

CREATE VIEW v_report_invoice AS
SELECT
	c.first_name, c.last_name, c.gender, i.date, i.number, p.name, i.total_value_invoice
FROM client c
INNER JOIN invoice i
ON c.id_client = i.id_client
INNER JOIN invoice_item	g
ON g.id_invoice = i.number
INNER JOIN product p
ON p.id_product = g.id_product
GO

SELECT * FROM v_report_invoice