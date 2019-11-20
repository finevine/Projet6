SELECT Orders.ID, Client.ID
FROM Orders
INNER JOIN client ON Orders.client_ID = client.ID;

-- SELECT orders.ID AS order_ID, orders.Restaurant_ID, orders.client_ID, client.ID AS client_ID, client.phoneNumber
-- FROM orders
-- INNER JOIN client
-- ON orders.client_ID=client.ID;

-- SELECT o.ID, o.Restaurant, o.client_ID, c.ID, c.phoneNumber
-- FROM orders AS o, client AS c
-- INNER JOIN orders ON o.client_ID=client.ID;