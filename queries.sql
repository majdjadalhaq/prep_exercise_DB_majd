-- Week 3 – Query Examples

-- 1. Vegetarian recipes with potatoes
SELECT DISTINCT r.name
FROM recipes r
JOIN recipe_categories rc ON r.id = rc.recipe_id
JOIN categories c ON c.id = rc.category_id
JOIN recipe_ingredients ri ON r.id = ri.recipe_id
JOIN ingredients i ON i.id = ri.ingredient_id
WHERE c.name = 'Vegetarian'
  AND i.name = 'potatoes';

-- 2. Cakes that do NOT need baking
SELECT DISTINCT r.name
FROM recipes r
WHERE r.id IN (
    SELECT rc1.recipe_id FROM recipe_categories rc1
    JOIN categories c1 ON c1.id = rc1.category_id
    WHERE c1.name = 'Cake'
)
AND r.id IN (
    SELECT rc2.recipe_id FROM recipe_categories rc2
    JOIN categories c2 ON c2.id = rc2.category_id
    WHERE c2.name = 'No-Bake'
);

-- 3. Recipes that are BOTH Vegan AND Japanese
SELECT r.name
FROM recipes r
JOIN recipe_categories rc ON r.id = rc.recipe_id
JOIN categories c ON rc.category_id = c.id
WHERE c.name IN ('Vegan', 'Japanese')
GROUP BY r.id, r.name
HAVING COUNT(DISTINCT c.name) = 2;
