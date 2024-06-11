USE oltp_commerce

SELECT 
	c.first_name,
	c.last_name,
	c.gender,
	i.date,
	i.number,
	p.name,
	i.total_value_invoice
FROM 
	client c
INNER JOIN invoice i
ON c.id_client = i.id_client
INNER JOIN invoice_item it
ON i.number = it.id_invoice
INNER JOIN product p
ON p.id_product = it.id_product
ORDER BY 5

CREATE VIEW v_invoice AS
SELECT id_invoice, SUM(total_value_item) AS total 
FROM invoice_item
GROUP BY id_invoice

ORDER BY 1