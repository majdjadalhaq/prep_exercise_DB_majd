-- data.sql
INSERT INTO categories (name) VALUES
('Japanese'),('Dessert'),('Vegetarian'),
('No-Bake'),('Vegan'),('Gluten-Free'),('Cake');

INSERT INTO ingredients (name) VALUES
('spaghetti'),('unsalted butter'),('garlic'),('soy sauce'),('mirin'),
('eggs'),('granulated sugar'),('cake flour'),('baking powder'),
('matcha powder'),('milk'),('vegetable oil'),('potatoes'),
('cucumber'),('carrot'),('Kewpie mayo'),
('Condensed milk'),('Cream Cheese'),('Lemon Juice'),
('Pie Crust'),('Cherry Jam'),('Brussels Sprouts'),
('Sesame seeds'),('Pepper'),('Salt'),('Olive oil'),
('Macaroni'),('Flour'),('Shredded Cheddar cheese');

INSERT INTO step_templates (instruction) VALUES
('Cook pasta according to the package instructions in salted boiling water.'),
('Melt butter and sauté garlic until fragrant.'),
('Add soy sauce and mirin; toss cooked pasta to coat.'),
('Preheat the oven to 170°C (338°F).'),
('Whisk all dry ingredients together until well combined.'),
('Whip eggs and sugar to ribbon stage.'),
('Fold the batter gently until just combined.'),
('Boil potatoes until tender; drain and lightly mash.'),
('Salt cucumber slices, rest, then squeeze excess water.'),
('Combine potatoes, cucumber, carrot, mayo; season to taste.'),
('Beat Cream Cheese'),
('Add condensed Milk and blend'),
('Add Lemon Juice and blend'),
('Add the mix to the pie crust'),
('Spread the Cherry Jam'),
('Place in refrigerator for 3h.'),
('Preheat the oven'),
('Mix the ingredients in a bowl'),
('Spread the mix on baking sheet'),
('Bake for 30 minutes'),
('Cook Macaroni for 8 minutes'),
('Melt butter in a saucepan'),
('Add flour, salt, pepper and mix'),
('Add Milk and mix'),
('Cook until mix is smooth'),
('Add cheddar cheese'),
('Add the macaroni'),
('Beat the eggs'),
('Add soya sauce, sugar and salt'),
('Add oil to a sauce pan'),
('Bring to medium heat'),
('Add some mix to the sauce pan'),
('Let it cook for 1 minute'),
('Remove pan from fire');

INSERT INTO recipes (name) VALUES
('Wafu Garlic Butter Pasta'),
('Matcha Sponge Cake'),
('Japanese Potato Salad'),
('No-Bake Cheesecake'),
('Roasted Brussels Sprouts'),
('Mac and Cheese'),
('Tamagoyaki Japanese Omelette');
