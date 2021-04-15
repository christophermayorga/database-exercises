SELECT matchid, player FROM goal 
  WHERE teamid LIKE '%GER'

SELECT id,stadium,team1,team2
FROM game
WHERE id LIKE '1012'

SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid LIKE 'GER'

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (teamid=id)
WHERE gtime<=10

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach LIKE 'Fernando Santos'

SELECT player
FROM game JOIN goal ON (id=matchid)
WHERE stadium LIKE 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid NOT LIKE 'GER'
ORDER BY player

SELECT teamname, COUNT(*) AS number_of_goals
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

SELECT stadium, COUNT(*) AS number_of_goals
FROM game JOIN goal ON (id = matchid)
GROUP BY stadium

