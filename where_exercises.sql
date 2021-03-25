-- 1. use employees
USE employees;

DESCRIBE employees;

-- 2. returns 709 records

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 3. also returns 709 records

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

-- 4. returns 441 records

SELECT *
FROM employees
WHERE gender = 'M' AND
		(first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');
		
-- 5. returns 7330 records

SELECT *
FROM employees
WHERE last_name LIKE 'E%';

-- 6a. returns 30723 records 
SELECT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';

-- 6b. returns 23393 records
SELECT *
FROM employees
WHERE last_name LIKE '%e' AND last_name NOT LIKE 'E%';

*/
-- 7. returns 899 records
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

-- 7b. returns 24292 records
SELECT *
FROM employees
WHERE last_name LIKE '%e';

-- 8. returns 135214 records
SELECT *
FROM employees
WHERE hire_date LIKE '199%';

-- 9. returns 842 records
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

-- 10. returns 362 records
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

-- 11. 1873 records returned
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- 12. returns 547 records
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';