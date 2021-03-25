USE albums_db;

SELECT *
FROM albums;

SELECT DISTINCT artist
FROM albums;

SELECT name
FROM albums
WHERE release_date = 1990;

SELECT name 
FROM albums
WHERE name LIKE '%at%';

SELECT name 
FROM albums
WHERE name LIKE '%the%';

SELECT name
FROM albums
WHERE name LIKE '%a';

SELECT name 
FROM albums
WHERE name LIKE 'a%';

SELECT *
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT *
FROM albums
WHERE release_date LIKE '199%';

SELECT 
	artist,
	name,
	sales
FROM albums
WHERE sales BETWEEN 10 AND 20;

USE chipotle;

DESCRIBE orders;

SELECT *
FROM orders;

SELECT DISTINCT item_name
FROM orders;

SELECT item_name
FROM orders
WHERE item_name LIKE "%chicken%";

SELECT DISTINCT item_name
FROM orders
WHERE item_name LIKE "%chicken%";

SELECT *
FROM orders
WHERE item_name IN ('Veggie Soft Tacos', 'Steak Bowl', 'Crispy Tacos');

SELECT *
FROM orders
WHERE order_id IN (1, 7, 10);

USE join_example_db;

SELECT *
FROM users;

SELECT *
FROM users
WHERE role_id IS NOT NULL;

SELECT *
FROM users
WHERE role_id IS NULL;

USE chipotle;

SELECT *
FROM orders
WHERE item_name = 'Veggie Soft Tacos' OR item_name = 'Steak Bowl' OR item_name = 'Crispy Tacos';

SELECT *
FROM orders
WHERE order_id = 1 OR order_id = 7 OR order_id = 10;

SELECT *
FROM orders
WHERE item_name LIKE '%chicken%'
    OR order_id = 10;
    
SELECT *
FROM orders
WHERE item_name LIKE '%chicken%'
    AND order_id = 10;
    
SELECT *
FROM orders
WHERE item_name = 'Veggie Soft Tacos'
    AND order_id IN (304, 322)
    OR item_name = 'Crispy Tacos';
    
SELECT *
FROM orders
WHERE item_name = 'Veggie Soft Tacos'
    AND (
        order_id IN (304, 322)
        OR item_name = 'Crispy Tacos'
        );
        
SELECT *
FROM orders
WHERE choice_description LIKE '%red%'
    AND item_name LIKE '%tacos%'
    OR item_name LIKE '%soft%';

SELECT *
FROM orders
WHERE choice_description LIKE '%red%'
    AND (
        item_name LIKE '%tacos%'
        OR item_name LIKE '%soft%'
        );