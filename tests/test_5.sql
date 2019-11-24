SELECT
   ARRAY_AGG(Orders.ID) AS orders_not_delivered
FROM
   Orders
WHERE (Orders.DateDelivered IS NULL AND Orders.Client_ID = 75);


SELECT Addresses.Name, Client.ID AS Client_ID
FROM Addresses 
RIGHT JOIN Client
ON Addresses.id = Client.address_ID
WHERE Client.ID = 75;