SELECT 
	S.id_seller,
	S.name AS manager,
	M.name AS seller,
	M.id_seller
FROM 
	seller AS S
INNER JOIN seller AS M
ON M.id_manager = S.id_seller
GO