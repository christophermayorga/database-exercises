USE employees;

-- 2. 
SELECT 
concat(first_name, ' ', last_name) AS full_name, first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 3.
SELECT
concat(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 4.
SELECT CURDATE();

SELECT first_name,
last_name,
datediff(CURDATE(), hire_date)
FROM employees
WHERE birth_date LIKE "%12-25"
AND hire_date BETWEEN "1990-01-01" AND "1999-12-31"
;

-- 5.
SELECT MAX(salary)
FROM salaries;

SELECT MIN(salary)
FROM salaries;

-- 6.
SELECT
concat(
LOWER(SUBSTR(first_name, 1, 1)),
LOWER(SUBSTR(last_name, 1, 4)),
'_',
SUBSTR(birth_date, 6, 2),
SUBSTR(birth_date, 3, 2)) AS username,
first_name,
last_name,
birth_date
FROM employees;

-- Previous Exercises

-- 1. use employees
USE employees;

-- 2. Irena Reutenauer, Vidya Simmen
SELECT *
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY first_name
;

-- 3. Irena Acton, Vidya Zweizig
SELECT *
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY first_name, last_name
;

-- 4. Irena Acton, Maya Zyda
SELECT *
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY last_name, first_name
;

-- 5. 899 records, 10021 Ramzi Erde, 499648 Tadahiro Erde
SELECT *
FROM employees
WHERE last_name LIKE "e%" AND last_name LIKE "%e"
ORDER BY emp_no
;

-- 6. 899 records, Teiji Eldridge, Sergi Erde
SELECT *
FROM employees
WHERE last_name LIKE "e%" AND last_name LIKE "%e"
ORDER BY hire_date DESC
;

-- 7. 362 records, Khun Bernin, Douadi Pettis
SELECT * 
FROM employees
WHERE birth_date LIKE "%12-25"
AND hire_date BETWEEN "1990-01-01" AND "1999-12-31"
ORDER BY birth_date, hire_date DESC
;