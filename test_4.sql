--T4. puis-je afficher le prix d’une commande donnée ?

-- SELECT
--     orderline.Order_ID, article.name
-- FROM
--     orderline
--     LEFT JOIN article
--     ON orderline.article_ID = article.ID
-- WHERE Order_ID = 14;

-- Affiche les prix des articles TTC
SELECT  Article.ID,
        ROUND(
            (Article.UnitPrice * (1+Article.VATrate100::NUMERIC/100)
            )::NUMERIC, 2) AS Price
FROM Article  
ORDER BY ID ASC;



---------------------
-- SELECT COUNT(*) FROM (
--     -- bellow gives something like :
--     -- count | order_id 
--     -- -------+----------
--     --      2 |       22
--     --      2 |       44
--     --      2 |       11
--     --      2 |       42
--     --      3 |       40
--     --      2 |       43
--     SELECT
--         -- ARRAY_AGG(article_ID), order_ID
--         COUNT(article_ID), order_ID
--     FROM
--         orderline
--     GROUP BY
--         order_ID
--     HAVING
--         COUNT(article_ID) > 1
-- )
-- AS
--     toto
--     ;