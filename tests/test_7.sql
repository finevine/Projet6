-- puis-je lister les pizzas pour lesquelles tous les ingrédients sont en stock dans un restaurant donné ?

WITH NotEnough AS(
        SELECT
        Composition.article_id, Composition.ingredient_ID, Stock.quantity AS available, Composition.quantity AS needed
    FROM
        Composition, Stock
    WHERE
        Composition.quantity > Stock.quantity
        AND Stock.ingredient_ID = Composition.ingredient_ID
        AND Stock.restaurant_ID = 3
    ORDER BY Composition.article_id
    )
    SELECT
        Article.id, COUNT(NotEnough.ingredient_ID)
    FROM
        Article
        FULL JOIN NotEnough
            ON Article.id = NotEnough.article_id
    GROUP BY
        Article.id
    HAVING
        COUNT(NotEnough.ingredient_ID) = 0
    ORDER BY Article.id;
