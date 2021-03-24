USE fruits_db;

DESCRIBE fruits;

SHOW COLUMNS
FROM fruits;

SELECT *
FROM fruits;

SELECT name
FROM fruits;

SELECT
	name,
	quantity
FROM fruits;

SELECT DISTINCT name
FROM fruits;

USE chipotle;

DESCRIBE orders;

SELECT *
FROM orders;

SELECT item_name
FROM orders;

SELECT DISTINCT item_name
FROM orders;

SELECT *
FROM orders
WHERE item_name = 'Chicken Bowl';

SELECT *
FROM orders
WHERE item_price = '$4.45';

SELECT *
FROM orders
WHERE id = 15;

SELECT *
FROM orders
WHERE quantity BETWEEN 3 AND 5;

SELECT *
FROM orders WHERE order_id > 1500;

SELECT *
FROM orders WHERE quantity <> 1;

SELECT
	item_name AS "Multiple Item Order",
	quantity AS Number 
FROM orders
WHERE quantity >= 2;
