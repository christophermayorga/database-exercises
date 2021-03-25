USE employees;

DESCRIBE employees;

/*
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned = 709 returned.
*/

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

/*
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? 709 returned, yes same number of rows from Q2.
*/

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

/*
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. 441 rows returned.
*/

SELECT *
FROM employees
WHERE gender = 'M' AND
		(first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');
		
/*
Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. 7330 returned.
*/

SELECT *
FROM employees
WHERE last_name LIKE 'E%';

/*
Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. 30723 employees. How many employees have a last name that ends with E, but does not start with E? 23393 employees.
*/

SELECT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE '%e' AND last_name NOT LIKE 'E%';

/*
Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. 899 employees. How many employees' last names end with E, regardless of whether they start with E? 24292 employees.
*/

SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE '%e';

/*
Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
135,214 employees returned.
*/

SELECT *
FROM employees
WHERE hire_date LIKE '199%';

/*
Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
842 employees.
*/

SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

/*
Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. 362 employees.
*/

SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

/*
Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. 1873 returned.
*/

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

/*
Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? 189 employees.
*/

SELECT *
FROM employees
WHERE last_name LIKE '%q' AND last_name NOT LIKE '%qu%';