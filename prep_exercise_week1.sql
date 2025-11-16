-- Drop and recreate the database
DROP DATABASE IF EXISTS recipesdb;
CREATE DATABASE recipesdb;
\c recipesdb;

-- Table: recipes
CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

-- Table: categories
CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL
);

-- Table: ingredients
CREATE TABLE ingredients (
  ingredient_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);

-- Table: steps
CREATE TABLE steps (
  step_id SERIAL PRIMARY KEY,
  instruction TEXT UNIQUE NOT NULL
);

-- Table: recipe_categories (relation between recipes and categories)
CREATE TABLE recipe_categories (
  recipe_id INT REFERENCES recipes(recipe_id),
  category_id INT REFERENCES categories(category_id),
  PRIMARY KEY (recipe_id, category_id)
);

-- Table: recipe_ingredients (relation between recipes and ingredients)
CREATE TABLE recipe_ingredients (
  recipe_id INT REFERENCES recipes(recipe_id),
  ingredient_id INT REFERENCES ingredients(ingredient_id),
  quantity VARCHAR(50),
  PRIMARY KEY (recipe_id, ingredient_id)
);

-- Table: recipe_steps (relation between recipes and steps)
CREATE TABLE recipe_steps (
  recipe_id INT REFERENCES recipes(recipe_id),
  step_id INT REFERENCES steps(step_id),
  step_order INT NOT NULL,
  PRIMARY KEY (recipe_id, step_id)
);
