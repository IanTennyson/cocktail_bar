
DROP TABLE ingredients_lists;
DROP TABLE cocktails;
DROP TABLE ingredients;

CREATE TABLE ingredients (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  is_alcoholic BOOLEAN,
  quantity INT4,
  price_per_ltr DECIMAL,
  cost_price INT4,
  sale_price INT4,
  profit INT4,
  mark_up INT4
);

CREATE TABLE cocktails (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  prep_description VARCHAR(255)
);

CREATE TABLE ingredients_lists (
  id SERIAL8 PRIMARY KEY,
  cocktail_id INT4 REFERENCES cocktails(id) ON DELETE CASCADE,
  ingredient_id INT4 REFERENCES ingredients(id) ON DELETE CASCADE,
  measure INT4
);