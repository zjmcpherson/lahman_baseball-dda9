--#8

--Top 5 Attendance Averages

SELECT  park_name,

		teams.name AS team_name,

		ROUND(AVG(homegames.attendance/homegames.games),0) AS avg_attendance

FROM parks

LEFT JOIN homegames

USING(park)

LEFT JOIN teams

ON homegames.team=teams.teamid

WHERE homegames.year=2016

	AND games>=10

GROUP BY park_name, teams.name

ORDER BY avg_attendance DESC

LIMIT 5;

​

--Lowest 5 Attendance Averages

SELECT  park_name,

		teams.name AS team_name,

		ROUND(AVG(homegames.attendance/homegames.games),0) AS avg_attendance

FROM parks

LEFT JOIN homegames

USING(park)

LEFT JOIN teams

ON homegames.team=teams.teamid

WHERE homegames.year=2016

	AND games>=10

GROUP BY park_name, teams.name

ORDER BY avg_attendance 

LIMIT 5;

