USE florence06;

CREATE TEMPORARY TABLE my_numbers(
    n INT UNSIGNED NOT NULL 
);

INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers;

CREATE TEMPORARY TABLE current_salary AS (
	SELECT employees.employees.first_name,
	employees.employees.last_name,
	employees.salaries.salary
	FROM employees.salaries
	JOIN employees.employees USING(emp_no)
	WHERE to_date > curdate()
);

SELECT *
FROM current_salary;

-- If we do 5% raises for all current employees
-- what is the sum of those salaries

-- UPDATE my_numbers SET n = n + 1 (where clause, if needed)

UPDATE current_salary SET salary = salary + salary * .05;

SELECT sum(salary) FROM current_salary;

SELECT sum(salary) FROM employees.salaries;

SELECT (SELECT sum(salary) FROM current_salary) -
(SELECT sum(salary) FROM employees.salaries
WHERE to_date > curdate());

CREATE TEMPORARY TABLE fruits AS (
	SELECT *
	FROM fruits_db.fruits
);

SELECT * FROM fruits;

-- 1.
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

ALTER TABLE employees_with_departments DROP COLUMN dept_no;

ALTER TABLE employees_with_departments ADD Full_name VARCHAR(100);

UPDATE employees_with_departments
SET Full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT * FROM employees_with_departments;

-- 2.
CREATE TEMPORARY TABLE new_payments AS (
	SELECT * FROM sakila.payment);
	
SELECT * FROM new_payments;

ALTER TABLE new_payments MODIFY amount INT UNSIGNED NOT NULL;

UPDATE new_payments
SET amount = amount * 100;

-- 3.
-- Find current average pay for each department (these will be actual values)
SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd001'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd002'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd003'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd004'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd005'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd006'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd007'
;

SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd008'
;

SELECT
((SELECT AVG(s.salary)
FROM employees.salaries AS s
JOIN employees.dept_emp AS de USING(emp_no)
WHERE s.to_date > NOW() AND dept_no = 'd009')
-
(SELECT AVG(salary)
FROM employees.salaries))
/
(SELECT STD(salary)
FROM employees.salaries)
;
-- Find historical averge pay (this will be mean value)
SELECT AVG(salary)
FROM employees.salaries
;
-- Find standard deviation for historical salaries
SELECT STD(salary)
FROM employees.salaries
;
-- Find z score for average salaries of each department 
CREATE TEMPORARY TABLE trial AS
	SELECT dept_no, salary
	FROM employees.dept_emp
	JOIN employees.salaries USING(emp_no);
	
SELECT * FROM comparisons;
SELECT * FROM trial;

CREATE TEMPORARY TABLE averages5 AS
	SELECT dept_no, ((AVG(salary) - 63810.7448)/16904.8283) AS z_score
	FROM employees.dept_emp
	JOIN employees.salaries USING (emp_no)
WHERE employees.salaries.to_date > NOW() AND employees.dept_emp.to_date > NOW()
GROUP BY dept_no;

SELECT * FROM averages5;

-- Best department: Sales. Worst department: Human resources.

CREATE TEMPORARY TABLE averages4 AS
	SELECT dept_no, AVG(salary) AS avg_dept_salaries
	FROM employees.dept_emp
	JOIN employees.salaries USING (emp_no)
WHERE employees.salaries.to_date > NOW() AND employees.dept_emp.to_date > NOW()
GROUP BY dept_no;

SELECT * FROM averages4;