USE employees;
SELECT database();
SHOW TABLES;
-- 5 int, date, varchar, enum
-- 6 salaries
-- 7 departments, dept_emp, dept_manager, employees, titles
-- 8 dept_emp, dept_manager, employees, salaries, titles
-- 9 in dept_emp, sql makes sure that the dept number exists in deparments and the employee number exists in employees before allowing the row to be made
SHOW CREATE TABLE dept_manager;