use oltp_commerce

create view v_invoice_item as
select 
	i.id_invoice,
	p.name,
	p.price,
	i.quantity,
	i.total_value_item
from product as p
inner join invoice_item as i
on i.id_product = p.id_product

select * from v_invoice_item 