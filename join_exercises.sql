USE employees;

-- 2.
SELECT dept_name AS Department_Name, CONCAT(first_name, '_', last_name) AS Department_Manager
FROM dept_manager AS dm 
JOIN departments AS d
  ON dm.dept_no = d.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no
WHERE to_date = '9999-01-01'
ORDER BY dept_name;

-- 3.
SELECT dept_name AS Department_Name, CONCAT(first_name, '_', last_name) AS Manager_Name
FROM dept_manager AS dm 
JOIN departments AS d
  ON dm.dept_no = d.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no
WHERE to_date = '9999-01-01' AND gender = 'F'
ORDER BY dept_name;

-- 4.
SELECT title, COUNT(t.emp_no)
FROM dept_emp AS de
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN titles AS t
	ON de.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01' AND de.dept_no = 'd009' AND de.to_date = '9999-01-01'
GROUP BY title;

-- 5.
SELECT dept_name AS Department_Name, CONCAT(first_name, '_', last_name) AS Department_Manager, salary
FROM dept_manager AS dm 
JOIN departments AS d
  ON dm.dept_no = d.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no
JOIN salaries AS s ON dm.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY dept_name;

-- 6.
SELECT d.dept_no, dept_name, COUNT(e.emp_no) AS num_employees
FROM dept_emp AS de
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no
WHERE to_date = '9999-01-01'
GROUP BY d.dept_no;

-- 7.
SELECT dept_name, AVG(s.salary) AS average_salary
FROM dept_emp AS de
JOIN departments AS d
	ON d.dept_no = de.dept_no
JOIN salaries AS s
	ON s.emp_no = de.emp_no
WHERE s.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY dept_name DESC
LIMIT 1;

-- 8.
SELECT first_name, last_name
FROM dept_emp AS de
JOIN departments AS d
	ON d.dept_no = de.dept_no
JOIN salaries AS s
	ON s.emp_no = de.emp_no
JOIN employees AS e
	ON e.emp_no = de.emp_no
WHERE s.to_date > curdate() AND dept_name = 'Marketing'
ORDER BY salary DESC
LIMIT 1;

-- 9.
SELECT first_name, last_name, salary, dept_name
FROM dept_manager AS dm 
JOIN departments AS d
  ON dm.dept_no = d.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no
JOIN salaries AS s ON dm.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 1;