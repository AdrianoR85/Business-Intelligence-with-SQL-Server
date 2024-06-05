SELECT * FROM invoice_item
ORDER BY id_invoice
GO

/* Query all invoice without items  */
SELECT number FROM invoice
WHERE number NOT IN(SELECT id_invoice FROM invoice_item)
ORDER BY number
GO