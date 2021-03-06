USE join_example_db;

SELECT *
FROM users
WHERE role_id IN(
-- subquery goes here
SELECT id
FROM roles
WHERE NAME = 'reviewer'
);

-- this does not need to be done on a different table
USE chipotle;
SELECT * FROM orders LIMIT 5;

SELECT * FROM orders
WHERE item_name IN(
SELECT item_name FROM orders
WHERE item_name LIKE '%bowl%'
);

SELECT * FROM orders
WHERE item_name LIKE '%bowl%';

-- use an aggregation in a subquery
SELECT * FROM orders
WHERE quantity = (
SELECT MIN(quantity) FROM orders
);

-- Find the name of all current managers that are women
USE employees;
SELECT first_name, last_name FROM employees
WHERE emp_no IN(
SELECT emp_no FROM dept_manager
WHERE to_date > NOW()
)
AND gender LIKE '%f%';

-- 1. 
SELECT *
FROM employees
JOIN. salaries AS s
	ON s.emp_no = employees.emp_no
WHERE hire_date IN(
SELECT hire_date FROM employees
WHERE emp_no = '101010')
AND to_date > CURDATE();

-- 2.
SELECT *
FROM titles
WHERE emp_no IN(
SELECT emp_no
FROM employees
WHERE first_name = 'Aamod')
AND to_date > NOW();

SELECT
      t.title AS 'Titles Held by Aamods',
      COUNT(t.title) AS 'Total Aamods Who Held Title'
FROM titles AS t
WHERE
      t.emp_no IN
      (
            SELECT
                  e.emp_no
            FROM employees AS e
            JOIN salaries AS s
                  ON e.emp_no = s.emp_no
                        AND s.to_date > CURDATE()
            WHERE
                first_name LIKE 'Aamod'
      )
GROUP BY
      t.title
;

-- 3. 59,900 employees are no longer working for the company 
SELECT *
FROM employees
WHERE emp_no NOT IN(
SELECT emp_no
FROM dept_emp
WHERE to_date = '9999-01-01');

-- 4. Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil
SELECT first_name, last_name FROM employees
WHERE emp_no IN(
SELECT emp_no FROM dept_manager
WHERE to_date > NOW()
)
AND gender LIKE '%f%';

-- 5.
SELECT *
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE to_date > NOW()
AND salary > (
SELECT AVG(salary)
FROM salaries);

-- 6. 83 salaries or .035%
SELECT *
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
WHERE to_date > NOW()
AND salary > 141315.17; 

SELECT STD(salary)
FROM salaries
WHERE to_date > curdate();

SELECT AVG(salary)
FROM salaries;

SELECT *
FROM salaries
WHERE to_date > NOW();

SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()
	AND salary >= (
		SELECT
		MAX(salary) - STDDEV(salary)
		FROM salaries
		WHERE to_date > CURDATE()
		);

-- BONUS
-- 1.
SELECT dept_name FROM departments AS d
JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
JOIN employees AS e
	ON de.emp_no = e.emp_no
WHERE e.emp_no IN(
SELECT emp_no FROM dept_manager
WHERE to_date > NOW()
)
AND gender LIKE '%f%';

-- 2. Tokuyasu Pesch
SELECT first_name, last_name, salary 
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
ORDER BY salary DESC
LIMIT 1;

-- 3.
SELECT first_name, last_name, salary, dept_name
FROM employees AS e
JOIN salaries AS s
	ON e.emp_no = s.emp_no
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no 
ORDER BY salary DESC
LIMIT 1;