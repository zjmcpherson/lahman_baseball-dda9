-- 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?


SELECT namefirst, namelast, g_all AS games_played, teams.name,
		MIN(height) AS height_inches
FROM people AS p INNER JOIN appearances AS a USING(playerid)
					LEFT JOIN teams USING(yearid)
GROUP BY namefirst, namelast, g_all, teams.name
ORDER BY MIN(height)
LIMIT 1;