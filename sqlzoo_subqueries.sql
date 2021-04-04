SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name
FROM world
WHERE gdp/population >
(SELECT gdp/population
FROM world
WHERE name = 'United Kingdom')
AND continent = 'Europe'

SELECT name, continent
FROM world
WHERE continent IN(
SELECT continent
FROM world
WHERE name = 'Argentina' OR name = 'Australia')
ORDER BY name

SELECT name, population
FROM world
WHERE population >
(SELECT population
FROM world
WHERE name = 'Canada')
AND population <
(SELECT population
FROM world
WHERE name = 'Poland')

SELECT name, 
  CONCAT  (CAST (100*population/(SELECT population 
                                   FROM world 
                                   WHERE name 
                                       ='Germany') AS DECIMAL(5,0)),'%') as  percentage

FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp >
(SELECT MAX(gdp)
FROM world
WHERE continent = 'Europe')

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)