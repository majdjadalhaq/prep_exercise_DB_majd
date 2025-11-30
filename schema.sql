-- Week 3 – Normalized Database Schema (3NF)

-- Recipes table
CREATE TABLE recipes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Categories table
CREATE TABLE categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Ingredients table
CREATE TABLE ingredients (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Step templates (Normalized for 3NF)
CREATE TABLE step_templates (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instruction TEXT NOT NULL UNIQUE
);

-- Many-to-many: recipes ↔ categories
CREATE TABLE recipe_categories (
    recipe_id BIGINT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    category_id BIGINT NOT NULL REFERENCES categories(id) ON DELETE RESTRICT,
    PRIMARY KEY (recipe_id, category_id)
);

-- Many-to-many: recipes ↔ ingredients
CREATE TABLE recipe_ingredients (
    recipe_id BIGINT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    ingredient_id BIGINT NOT NULL REFERENCES ingredients(id) ON DELETE RESTRICT,
    PRIMARY KEY (recipe_id, ingredient_id)
);

-- Recipe steps with template references
CREATE TABLE recipe_steps (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recipe_id BIGINT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    step_number INT NOT NULL,
    template_id BIGINT NOT NULL REFERENCES step_templates(id) ON DELETE RESTRICT,
    UNIQUE (recipe_id, step_number)
);
