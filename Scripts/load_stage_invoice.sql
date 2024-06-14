CREATE VIEW report_sales AS
SELECT
	c.id_client AS id_client,
	s.id_seller AS id_seller,
	p.id_product AS id_product,
	su.id_supplier AS id_supplier,
	i.number AS id_invoice,
	m.id_method_of_payment AS id_method,
	it.quantity AS quantity,
	(it.quantity * p.avg_cost) AS total_cost,
	(it.total_value_item - (it.quantity  * p.avg_cost)) AS total_profit,
	it.total_value_item AS total_item,
	i.date AS date 
FROM invoice AS i
INNER JOIN invoice_item AS it
ON i.number = it.id_invoice
INNER JOIN client AS c
ON i.id_client = c.id_client
INNER JOIN seller AS s
ON i.id_seller = s.id_seller
INNER JOIN product AS p
ON it.id_product = p.id_product
INNER JOIN method_of_payment AS m
ON i.id_method_of_payment = m.id_method_of_payment
INNER JOIN supplier AS su
ON p.id_supplier = su.id_supplier

