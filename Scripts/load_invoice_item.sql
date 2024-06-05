USE oltp_commerce
GO

DECLARE
	@ID_PRODUCT INT,
	@ID_INVOICE INT,
	@QUANTITY INT,
	@VALUE NUMERIC(10,2),
	@TOTAL NUMERIC(10,2)

BEGIN
	SET @ID_PRODUCT = (SELECT TOP 1 id_product FROM product ORDER BY NEWID())
	SET @ID_INVOICE = (SELECT TOP 1 number FROM invoice ORDER BY NEWID())
	SET @QUANTITY = (SELECT ROUND( (RAND() * 4) + 1, 0 ))
	SET @VALUE = (SELECT price FROM product WHERE id_product = @ID_PRODUCT)
	SET @TOTAL = (@QUANTITY * @VALUE)

	INSERT INTO
		invoice_item(id_product, id_invoice, quantity, total_value_item)
	VALUES
		(@ID_PRODUCT, @ID_INVOICE, @QUANTITY, @TOTAL)

END
GO 27000

SELECT TOP 1 id_product FROM product ORDER BY NEWID()
SELECT TOP 1 number FROM invoice ORDER BY NEWID()
(SELECT ROUND( (RAND() * 4) + 1, 0 ))