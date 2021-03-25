USE employees;

SELECT DISTINCT title
FROM titles;

-- 2. Zykh
-- Zyda
-- Zwicker
-- Zweizig
-- Zumaque
-- Zultner
-- Zucker
-- Zuberek
-- Zschoche
-- Zongker
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- 3.Alselm, Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroutstrup
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;

-- 4. Lucien Rosenbaum, Zvonko Nyanchama, Florian Syrotiuk, Basil Tramer, Yinghua Dredge
-- offset = (page number - 1) * limit 
SELECT *
FROM employees
LIMIT 5 OFFSET 45;