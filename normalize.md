# Database Normalization Report – My Recipes Project

My database design for recipes was already in 2NF in Week 2:

- All tables are in 1NF (atomic values, no repeating groups).
- Many-to-many relationships are modeled with junction tables:
    - `recipe_categories` between `recipes` and `categories`
    - `recipe_ingredients` between `recipes` and `ingredients`
    - `recipe_steps` between `recipes` and `step_templates`
- In tables with composite primary keys (`recipe_categories`, `recipe_ingredients`)
  every non-key attribute depends on the whole key, not on part of it.
- Step instructions are separated into `step_templates` to remove repetition and ensure 3NF.
- There are no transitive dependencies between non-key attributes.

In Week 3 I mostly **verified** the normalization and improved the schema:

- I added `UNIQUE` constraints on:
    - `categories.name`
    - `ingredients.name`
    - `step_templates.instruction`
- I added `ON DELETE CASCADE` to foreign keys from junction tables pointing to `recipes` to ensure recipe deletion cleans up related data automatically.
- I used `ON DELETE RESTRICT` for foreign keys referencing `categories`, `ingredients`, and `step_templates` to prevent accidental deletion of important reference data.
- I ensured that `recipe_steps` has a unique combination of `recipe_id` and `step_number` to maintain proper step ordering.

The logical design did not change, but now the database enforces the functional dependencies
and ensures data integrity while making it easier to query recipes by category, ingredient, or steps.  

This setup allows queries such as:

- Find vegetarian recipes with potatoes.
- Find cakes that do not need baking.
- Find recipes that are both vegan and Japanese.
