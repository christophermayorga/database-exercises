USE employees;

-- 1.
SELECT emp_no, dept_no, from_date, to_date, IF(to_date > curdate(), 1, 0) AS is_current_employee
FROM dept_emp;

-- 2.
SELECT first_name, last_name,
	CASE
		WHEN last_name LIKE 'A%' THEN 'A-H'
		WHEN last_name LIKE 'B%' THEN 'A-H'
		WHEN last_name LIKE 'C%' THEN 'A-H'
		WHEN last_name LIKE 'D%' THEN 'A-H'
		WHEN last_name LIKE 'E%' THEN 'A-H'
		WHEN last_name LIKE 'F%' THEN 'A-H'
		WHEN last_name LIKE 'G%' THEN 'A-H'
		WHEN last_name LIKE 'H%' THEN 'A-H'
		WHEN last_name LIKE 'I%' THEN 'I-Q'
		WHEN last_name LIKE 'J%' THEN 'I-Q'
		WHEN last_name LIKE 'K%' THEN 'I-Q'
		WHEN last_name LIKE 'L%' THEN 'I-Q'
		WHEN last_name LIKE 'M%' THEN 'I-Q'
		WHEN last_name LIKE 'N%' THEN 'I-Q'
		WHEN last_name LIKE 'O%' THEN 'I-Q'
		WHEN last_name LIKE 'P%' THEN 'I-Q'
		WHEN last_name LIKE 'Q%' THEN 'I-Q'
		WHEN last_name LIKE 'R%' THEN 'R-Z'
		WHEN last_name LIKE 'S%' THEN 'R-Z'
		WHEN last_name LIKE 'T%' THEN 'R-Z'
		WHEN last_name LIKE 'U%' THEN 'R-Z'
		WHEN last_name LIKE 'V%' THEN 'R-Z'
		WHEN last_name LIKE 'W%' THEN 'R-Z'
		WHEN last_name LIKE 'X%' THEN 'R-Z'
		WHEN last_name LIKE 'Y%' THEN 'R-Z'
		WHEN last_name LIKE 'Z%' THEN 'R-Z'
		ELSE last_name
		END AS alpha_group
FROM employees;

-- 3.
SELECT 
	CASE 
		WHEN birth_date LIKE '195%' THEN '1950s'
		WHEN birth_date LIKE '196%' THEN '1960s'
		ELSE 'Other'
		END AS decade_of_employee,
	COUNT(*) AS count_of_employees
FROM employees
GROUP BY decade_of_employee
ORDER BY count_of_employees DESC;