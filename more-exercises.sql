USE employees;

-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

CREATE TEMPORARY TABLE avg_salaries2 AS
SELECT dept_no, AVG(salary) AS average_salary
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
WHERE salaries.to_date LIKE '%9999%'
GROUP BY dept_no;

USE employees;

SELECT dept_name AS department, CONCAT(first_name, ' ', last_name) AS NAME, salary, average_salary, (average_salary > salary) AS underpaid
FROM salaries
JOIN dept_manager USING(emp_no)
JOIN departments USING(dept_no)
JOIN employees USING(emp_no)
JOIN florence06.avg_salaries2 USING(dept_no)
WHERE salaries.to_date LIKE '%9999%'
AND dept_manager.to_date LIKE '%9999%';

USE world;

-- What languages are spoken in Santa Monica?

SELECT LANGUAGE, Percentage
FROM city
JOIN countrylanguage USING(CountryCode)
WHERE NAME = 'Santa Monica'
ORDER BY Percentage;

-- How many different countries are in each region?

SELECT Region, COUNT(*)
FROM country
GROUP BY region
ORDER BY COUNT(*);

-- What is the population for each region?

SELECT Region, SUM(Population) AS Population
FROM country
GROUP BY region
ORDER BY Population DESC;

-- What is the population for each continent?

SELECT Continent, SUM(Population) AS Population
FROM country
GROUP BY Continent
ORDER BY Population DESC;

-- What is the average life expectancy globally?

SELECT AVG(LifeExpectancy)
FROM country;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

SELECT Continent, AVG(LifeExpectancy)
FROM country
GROUP BY Continent
ORDER BY AVG(LifeExpectancy);

SELECT Region, AVG(LifeExpectancy)
FROM country
GROUP BY region
ORDER BY AVG(LifeExpectancy);

-- Find all the countries whose local name is different from the official name

SELECT NAME, LocalName
FROM country
WHERE NAME NOT LIKE LocalName;

-- How many countries have a life expectancy less than 60?
SELECT COUNT(*)
FROM country
WHERE LifeExpectancy < 60;

-- What state is Madrid located in?
SELECT country.name
FROM country
JOIN city ON city.CountryCode = country.code
WHERE city.name = 'Madrid';

-- What region of the world is Madrid located in?
SELECT country.Region
FROM country
JOIN city ON city.CountryCode = country.code
WHERE city.name = 'Madrid';

-- What is the life expectancy in Madrid?
SELECT country.LifeExpectancy
FROM country
JOIN city ON city.CountryCode = country.code
WHERE city.name = 'Madrid';