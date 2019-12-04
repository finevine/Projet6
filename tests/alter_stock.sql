ALTER TABLE stock ALTER COLUMN quantity DROP NOT NULL;
-- also possible to SET NOT NULL

UPDATE Stock SET
    Quantity = 0
WHERE Ingredient_ID = 6 AND Restaurant_ID = 3;