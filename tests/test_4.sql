--T4. puis-je afficher le prix d’une commande donnée ?

SELECT SUM(Price * quantity)
FROM (  SELECT order_ID AS ID, article_ID, quantity
        FROM orderline
        WHERE order_id = 14
    ) Order_summary
INNER JOIN
    -- Affiche les prix des articles TTC
    (SELECT Article.ID AS id,
            ROUND(
                (Article.UnitPrice * (1+Article.VATrate100::NUMERIC/100))::NUMERIC, 2
            ) AS Price
    FROM Article
    ) price_table
ON Order_summary.article_ID = Price_table.ID;
