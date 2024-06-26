USE oltp_commerce

CREATE VIEW v_load_invoice AS
SELECT i.number, i.total_value_invoice, v.total AS "total_invoice" 
FROM invoice i
INNER JOIN v_invoice v
ON i.number = v.id_invoice
GO

SELECT * FROM v_load_invoice
ORDER BY 1

UPDATE v_load_invoice SET total_value_invoice = total_invoice
GO

SELECT * FROM v_invoice

drop view v_invoice