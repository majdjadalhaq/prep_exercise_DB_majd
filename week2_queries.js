
import pg from 'pg';
const client = new pg.Client({
  user: 'postgres',
  host: 'localhost',
  database: 'recipesdb',
  password: '',
  port: 5432
});

async function runQueries() {
  await client.connect();

  console.log("Vegetarian recipes with potatoes:");
  let q1 = await client.query(`
    SELECT DISTINCT r.name
    FROM recipes r
    JOIN recipe_categories rc ON r.recipe_id = rc.recipe_id
    JOIN categories c ON rc.category_id = c.category_id
    JOIN recipe_ingredients ri ON ri.recipe_id = r.recipe_id
    JOIN ingredients i ON i.ingredient_id = ri.ingredient_id
    WHERE c.name='Vegetarian'
      AND i.name='Potatoes';
  `);
  console.log(q1.rows);

  console.log("Cakes that do not need baking:");
  let q2 = await client.query(`
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
  `);
  console.log(q2.rows);

  console.log("Vegan AND Japanese recipes:");
  let q3 = await client.query(`
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
  `);
  console.log(q3.rows);

  await client.end();
}

runQueries().catch(err => {
  console.error(err);
  client.end();
});

runQueries();
