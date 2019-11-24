--T3. puis-je afficher les commandes en attente dans un restaurant particulier ?
SELECT
    Restaurant.ID, Addresses.name
FROM
    Restaurant
    LEFT JOIN Addresses
    ON Addresses.ID = Restaurant.Address_ID
WHERE Restaurant.ID = 3;

SELECT
    Orders.ID
FROM
    Orders
WHERE (Orders.DateDelivered IS NULL AND Orders.Restaurant_ID = 3);