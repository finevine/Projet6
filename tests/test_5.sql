--T5. puis-je afficher les commandes en attente d'un client ?

SELECT
   Orders.ID
FROM
   Orders
WHERE (Orders.DateDelivered IS NULL AND Orders.Client_ID = 4);
