-- Week 3 – Seed Data

-- Categories
INSERT INTO categories (name) VALUES
('Japanese'),('Dessert'),('Vegetarian'),('No-Bake'),
('Vegan'),('Gluten-Free'),('Cake');

-- Ingredients
INSERT INTO ingredients (name) VALUES
('spaghetti'),('unsalted butter'),('garlic'),('soy sauce'),
('mirin'),('eggs'),('granulated sugar'),('cake flour'),
('baking powder'),('matcha powder'),('milk'),
('vegetable oil'),('potatoes'),('cucumber'),('carrot'),
('Kewpie mayo'),('Condensed milk'),('Cream Cheese'),
('Lemon Juice'),('Pie Crust'),('Cherry Jam'),
('Brussels Sprouts'),('Sesame seeds'),('Pepper'),
('Salt'),('Olive oil'),('Macaroni'),('Flour'),
('Shredded Cheddar cheese');

-- Step Templates
INSERT INTO step_templates (instruction) VALUES
('Cook pasta according to the package instructions in salted boiling water.'),
('Melt butter and sauté garlic until fragrant.'),
('Add soy sauce and mirin; toss cooked pasta to coat.'),
('Preheat the oven to 170°C.'),
('Whisk dry ingredients together.'),
('Whip eggs and sugar to ribbon stage.'),
('Fold batter gently.'),
('Boil potatoes until tender.'),
('Salt cucumber slices and squeeze water out.'),
('Combine potatoes, cucumber, carrot, mayo.'),
('Beat cream cheese.'),
('Add condensed milk and blend.'),
('Add lemon juice and blend.'),
('Pour mixture into crust.'),
('Spread cherry jam.'),
('Refrigerate for 3 hours.'),
('Mix ingredients in bowl.'),
('Spread on baking sheet.'),
('Bake for 30 minutes.'),
('Cook macaroni.'),
('Make roux with butter and flour.'),
('Add milk and whisk.'),
('Add cheddar cheese.'),
('Combine with macaroni.'),
('Beat eggs.'),
('Mix soy sauce, sugar, and salt.'),
('Heat oil.'),
('Cook omelette layers.'),
('Remove pan from heat.');

-- Recipes
INSERT INTO recipes (name) VALUES
('Wafu Garlic Butter Pasta'),
('Matcha Sponge Cake'),
('Japanese Potato Salad'),
('No-Bake Cheesecake'),
('Roasted Brussels Sprouts'),
('Mac and Cheese'),
('Tamagoyaki Japanese Omelette');
