--T2. puis-je retrouver le contenu d'une commande ?

SELECT
    orderline.Order_ID, orderline.quantity, article.name
FROM
    orderline
    LEFT JOIN article
    ON orderline.article_ID = article.ID
WHERE Order_ID = 14;

