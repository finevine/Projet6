-- puis-je afficher l'adresse de livraison d'une commande terminée même après que le client a changé son adresse ?
SELECT
   Orders.ID, Addresses.Road, Addresses.PostalCode, Addresses.City
FROM 
   Orders
   LEFT JOIN Addresses
      ON Addresses.ID = Orders.Address_ID
WHERE
   Orders.ID = 53;