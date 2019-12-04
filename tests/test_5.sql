-- T5. puis-je afficher les commandes en attente d'un client ?

-- SELECT
--    Orders.ID
-- FROM
--    Orders
-- WHERE (Orders.DateDelivered IS NULL AND Orders.Client_ID = 4);

-- pour afficher en plus le nom du client
WITH NotDelivered AS (
   SELECT
      ARRAY_AGG(Orders.ID) AS orders
   FROM
      Orders
   WHERE (Orders.DateDelivered IS NULL AND Orders.Client_ID = 4)
   )
   SELECT
      Addresses.Name, NotDelivered.orders
   FROM
      NotDelivered, 
      Addresses
         RIGHT JOIN Client
         ON Addresses.id = Client.address_ID
   WHERE Client.ID = 4;
