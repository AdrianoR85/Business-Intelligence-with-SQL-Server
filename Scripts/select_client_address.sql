USE oltp_commerce;

SELECT CONCAT(c.first_name,' ',c.last_name), a.street 
FROM  client as c
INNER JOIN address AS a
ON c.id_client = a.id_client;

SELECT COUNT(*) AS quantity
FROM client AS c
INNER JOIN address AS a
ON c.id_client = a.id_client