-- 9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
-- Give their full name and the teams that they were managing when they won the award.

WITH nl_award AS (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid LIKE 'TSN%'
							AND yearid > 1985
		 					AND lgid LIKE 'NL'),
		
		al_award AS (SELECT playerid
					 FROM awardsmanagers
					 WHERE awardid LIKE 'TSN%'
					 AND yearid > 1985
					 AND lgid LIKE 'AL'),
					 
		managers AS ((SELECT *
				  	FROM nl_award)
				  	INTERSECT
				 	(SELECT *
				  	FROM al_award))

SELECT namefirst, namelast, awardid, awardsmanagers.yearid, awardsmanagers.lgid
FROM managers LEFT JOIN awardsmanagers USING(playerid)
				LEFT JOIN people USING(playerid)
				LEFT JOIN teams USING(yearid)
WHERE awardid LIKE 'TSN%'
GROUP BY namefirst, namelast, awardid, awardsmanagers.yearid, awardsmanagers.lgid
ORDER BY yearid;

	
			
			
			