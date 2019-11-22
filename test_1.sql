SELECT COUNT(*) FROM (
    -- bellow gives something like :
    -- count | order_id 
    -- -------+----------
    --      2 |       22
    --      2 |       44
    --      2 |       11
    --      2 |       42
    --      3 |       40
    --      2 |       43
    SELECT
        -- ARRAY_AGG(article_ID), order_ID
        COUNT(article_ID), order_ID
    FROM
        orderline
    GROUP BY
        order_ID
    HAVING
        COUNT(article_ID) > 1
)
AS
    toto
    ;

