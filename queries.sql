-- Filename: queries.sql
-- Example Queries

-- Vegetarian recipes with potatoes
SELECT DISTINCT r.name
FROM recipes r
JOIN recipe_categories rc ON r.id = rc.recipe_id
JOIN categories c ON c.id = rc.category_id
JOIN recipe_ingredients ri ON r.id = ri.recipe_id
JOIN ingredients i ON i.id = ri.ingredient_id
WHERE c.name = 'Vegetarian'
  AND i.name = 'potatoes';

-- Cakes that do not need baking
SELECT DISTINCT r.name
FROM recipes r
JOIN recipe_categories rc ON r.id = rc.recipe_id
JOIN categories c ON c.id = rc.category_id
WHERE c.name = 'No-Bake'
  AND r.id IN (
    SELECT rc2.recipe_id
    FROM recipe_categories rc2
    JOIN categories c2 ON c2.id = rc2.category_id
    WHERE c2.name = 'Cake'
  );

-- Vegan AND Japanese recipes
SELECT r.name
FROM recipes r
JOIN recipe_categories rc ON r.id = rc.recipe_id
JOIN categories c ON c.id = rc.category_id
WHERE c.name IN ('Vegan','Japanese')
GROUP BY r.id, r.name
HAVING COUNT(DISTINCT c.name) = 2;
