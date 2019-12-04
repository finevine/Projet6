-- puis-je lister les pizzas pour lesquelles tous les ingrédients sont en stock dans un restaurant donné ?
-- à la base non. Ajout d'une colonne unitpricetaxed dans orderline.

UPDATE 
    Orderline
SET 
    unitpricetaxed = ROUND((Article.unitprice * (1+Article.vatrate100::NUMERIC/100))::NUMERIC, 2)
FROM Article
WHERE Orderline.article_ID = Article.ID;

-- désormais OK.