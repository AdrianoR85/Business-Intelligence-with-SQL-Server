USE oltp_commerce
GO

ALTER TABLE seller ADD CONSTRAINT fk_invoice_method
FOREIGN KEY(id_manager) REFERENCES seller(id_seller)
GO

ALTER TABLE product ADD CONSTRAINT fk_product_supplier
FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier)
GO

ALTER TABLE product ADD CONSTRAINT fk_product_category
FOREIGN KEY(id_category) REFERENCES category(id_category)
GO

ALTER TABLE invoice_item ADD CONSTRAINT fk_item_product
FOREIGN KEY(id_product) REFERENCES product(id_product)
GO

ALTER TABLE invoice_item ADD CONSTRAINT fk_item_invoice
FOREIGN KEY(id_invoice) REFERENCES invoice(number)
GO

ALTER TABLE invoice ADD CONSTRAINT fk_invoice_client
FOREIGN KEY(id_client) REFERENCES client(id_client)
GO

ALTER TABLE invoice ADD CONSTRAINT fk_invoice_seller
FOREIGN KEY(id_seller) REFERENCES seller(id_seller)
GO

ALTER TABLE invoice ADD CONSTRAINT fk_invoice_method
FOREIGN KEY(id_method_of_payment) REFERENCES method_of_payment(id_method_of_payment)
GO

ALTER TABLE	address ADD CONSTRAINT fk_address_client
FOREIGN KEY(id_client) REFERENCES client(id_client)
GO

