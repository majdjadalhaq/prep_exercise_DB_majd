
-- WEEK 2 PREP - COMPLETE DATABASE 

DROP DATABASE IF EXISTS recipesdb;
CREATE DATABASE recipesdb;
\c recipesdb;

-- TABLE: recipes
CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

-- TABLE: categories
CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- TABLE: ingredients
CREATE TABLE ingredients (
  ingredient_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- MANY-TO-MANY: recipe_categories
CREATE TABLE recipe_categories (
  recipe_id INT REFERENCES recipes(recipe_id) ON DELETE CASCADE,
  category_id INT REFERENCES categories(category_id) ON DELETE CASCADE,
  PRIMARY KEY (recipe_id, category_id)
);

-- MANY-TO-MANY: recipe_ingredients
CREATE TABLE recipe_ingredients (
  recipe_id INT REFERENCES recipes(recipe_id) ON DELETE CASCADE,
  ingredient_id INT REFERENCES ingredients(ingredient_id) ON DELETE CASCADE,
  quantity VARCHAR(50),
  PRIMARY KEY (recipe_id, ingredient_id)
);

-- ONE-TO-MANY: steps
CREATE TABLE steps (
  step_id SERIAL PRIMARY KEY,
  recipe_id INT REFERENCES recipes(recipe_id) ON DELETE CASCADE,
  step_order INT NOT NULL,
  instruction TEXT NOT NULL
);


-- INSERT DATA FOR THE 4 RECIPES


-- RECIPE 1: No-Bake Cheesecake
INSERT INTO recipes(name, description)
VALUES ('No-Bake Cheesecake', 'Cheesecake that requires no baking.');

-- Categories
INSERT INTO categories(name) VALUES
('Cake'), ('No-Bake'), ('Vegetarian');

-- Ingredients
INSERT INTO ingredients(name) VALUES
('Condensed milk'),
('Cream Cheese'),
('Lemon Juice'),
('Pie Crust'),
('Cherry Jam');

-- Link categories
INSERT INTO recipe_categories VALUES
(1, 1),
(1, 2),
(1, 3);

-- Link ingredients
INSERT INTO recipe_ingredients VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL);

-- Steps
INSERT INTO steps(recipe_id, step_order, instruction) VALUES
(1, 1, 'Beat Cream Cheese'),
(1, 2, 'Add condensed Milk and blend'),
(1, 3, 'Add Lemon Juice and blend'),
(1, 4, 'Add the mix to the pie crust'),
(1, 5, 'Spread the Cherry Jam'),
(1, 6, 'Place in refrigerator for 3h.');

-------------------------------------------------------

-- RECIPE 2: Roasted Brussels Sprouts
INSERT INTO recipes(name, description)
VALUES ('Roasted Brussels Sprouts', 'Oven-roasted vegetables.');

INSERT INTO categories(name) VALUES
('Vegan'), ('Gluten-Free');

INSERT INTO ingredients(name) VALUES
('Brussels Sprouts'),
('Lemon juice'),
('Sesame seeds'),
('Pepper'),
('Salt'),
('Olive oil');

INSERT INTO recipe_categories VALUES
(2, 4),
(2, 5);

INSERT INTO recipe_ingredients VALUES
(2, 6, NULL),
(2, 7, NULL),
(2, 8, NULL),
(2, 9, NULL),
(2, 10, NULL),
(2, 11, NULL);

INSERT INTO steps(recipe_id, step_order, instruction) VALUES
(2, 1, 'Preheat the oven'),
(2, 2, 'Mix the ingredients in a bowl'),
(2, 3, 'Spread the mix on baking sheet'),
(2, 4, 'Bake for 30''');

-------------------------------------------------------

-- RECIPE 3: Mac & Cheese
INSERT INTO recipes(name, description)
VALUES ('Mac & Cheese', 'Classic creamy pasta.');


INSERT INTO ingredients(name) VALUES
('Macaroni'),
('Butter'),
('Flour'),
('Milk'),
('Shredded Cheddar cheese');

INSERT INTO recipe_categories VALUES (3, 3);

INSERT INTO recipe_ingredients VALUES
(3, 12, NULL),
(3, 13, NULL),
(3, 14, NULL),
(3, 10, NULL),
(3, 9, NULL),
(3, 15, NULL),
(3, 16, NULL);

INSERT INTO steps(recipe_id, step_order, instruction) VALUES
(3, 1, 'Cook Macaroni for 8'''),
(3, 2, 'Melt butter in a saucepan'),
(3, 3, 'Add flour, salt, pepper and mix'),
(3, 4, 'Add Milk and mix'),
(3, 5, 'Cook until mix is smooth'),
(3, 6, 'Add cheddar cheese'),
(3, 7, 'Add the macaroni');

-------------------------------------------------------

-- RECIPE 4: Tamagoyaki Japanese Omelette
INSERT INTO recipes(name, description)
VALUES ('Tamagoyaki Japanese Omelette', 'Traditional Japanese rolled omelette.');

INSERT INTO categories(name) VALUES ('Japanese');

INSERT INTO ingredients(name) VALUES
('Eggs'),
('Soy sauce'),
('Sugar');

INSERT INTO recipe_categories VALUES
(4, 3),
(4, 6);

INSERT INTO recipe_ingredients VALUES
(4, 17, NULL),
(4, 18, NULL),
(4, 19, NULL),
(4, 10, NULL),
(4, 11, NULL);

INSERT INTO steps(recipe_id, step_order, instruction) VALUES
(4, 1, 'Beat the eggs'),
(4, 2, 'Add soya sauce, sugar and salt'),
(4, 3, 'Add oil to a sauce pan'),
(4, 4, 'Bring to medium heat'),
(4, 5, 'Add some mix to the sauce pan'),
(4, 6, 'Let it cook for 1'''),
(4, 7, 'Add oil to a sauce pan'),
(4, 8, 'Add some mix to the sauce pan'),
(4, 9, 'Let it cook for 1'''),
(4, 10, 'Remove pan from fire');

-------------------------------------------------------
-- REQUIRED QUERIES
-------------------------------------------------------

-- A) Vegetarian recipes with potatoes (example ingredient)
SELECT DISTINCT r.name
FROM recipes r
JOIN recipe_categories rc ON r.recipe_id = rc.recipe_id
JOIN categories c ON rc.category_id = c.category_id
JOIN recipe_ingredients ri ON ri.recipe_id = r.recipe_id
JOIN ingredients i ON i.ingredient_id = ri.ingredient_id
WHERE c.name='Vegetarian'
  AND i.name='Potatoes';

-- B) Cakes that do not need baking
SELECT DISTINCT r.name
FROM recipes r
WHERE r.recipe_id IN (
    SELECT recipe_id FROM recipe_categories rc
    JOIN categories c ON rc.category_id = c.category_id
    WHERE c.name='Cake'
)
AND r.recipe_id IN (
    SELECT recipe_id FROM recipe_categories rc
    JOIN categories c ON rc.category_id = c.category_id
    WHERE c.name='No-Bake'
);

-- C) Vegan AND Japanese recipes
SELECT DISTINCT r.name
FROM recipes r
WHERE r.recipe_id IN (
    SELECT recipe_id FROM recipe_categories rc
    JOIN categories c ON rc.category_id=c.category_id
    WHERE c.name='Vegan'
)
AND r.recipe_id IN (
    SELECT recipe_id FROM recipe_categories rc
    JOIN categories c ON rc.category_id=c.category_id
    WHERE c.name='Japanese'
);
