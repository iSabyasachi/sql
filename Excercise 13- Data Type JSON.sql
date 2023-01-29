use superstore_db;
SELECT * FROM items;
SELECT *, properties ->> "$.unit" FROM items where properties -> "$.unit" = 'gram';
SELECT JSON_ARRAY(properties) FROM items;
-- Find all the items that has unit in gram
SELECT * FROM items WHERE isnull(properties -> "$.unit" = 'gram');
-- Find all the items that has color blue element
SELECT * FROM items WHERE properties -> "$.color" = 'blue';