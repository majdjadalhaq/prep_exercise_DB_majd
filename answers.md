1. What are the collections?

A collection is like a folder that holds similar things.

In my project, we just need one collection called recipes.

Every recipe you make goes into this folder.

So instead of many tables like SQL, we just have one main collection.

2. What information will you embed and what will you keep separate?

Embed = put it inside the recipe

Separate = keep it in another collection

For my project:

Embedded inside the recipe document (all in the same place):

categories → like tags for the recipe (["Japanese","Vegetarian"])

ingredients → list of ingredients ([{"name":"spaghetti"}, {"name":"garlic"}])

steps → instructions with order ([{"order":1,"description":"Cook pasta"},...])

Not separate / normalized:

We don’t need separate tables for categories, ingredients, or steps anymore. Everything the recipe needs is inside its own document.