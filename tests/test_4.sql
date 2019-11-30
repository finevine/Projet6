--T4. puis-je afficher le prix d’une commande donnée ?

WITH Summary AS (
    SELECT
        ROUND((Article.UnitPrice * (1+Article.VATrate100::NUMERIC/100))::NUMERIC, 2) AS Price,
        OrderLine.quantity
    FROM
        OrderLine
    LEFT JOIN Article
        ON OrderLine.article_ID = Article.id
    WHERE
        OrderLine.order_id = 13
    )
SELECT
    SUM(Price * quantity)
FROM
    Summary;

------ BEFORE OPTIMIZATION
-- SELECT SUM(Price * quantity)
-- FROM (  SELECT order_ID AS ID, article_ID, quantity
--         FROM orderline
--         WHERE order_id = 14
--     ) Order_summary
-- INNER JOIN
--     (SELECT Article.ID AS id,
--             ROUND(
--                 (Article.UnitPrice * (1+Article.VATrate100::NUMERIC/100))::NUMERIC, 2
--             ) AS Price
--     FROM Article
--     ) price_table
-- ON Order_summary.article_ID = Price_table.ID;