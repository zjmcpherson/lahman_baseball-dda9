-- 9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
-- Give their full name and the teams that they were managing when they won the award.



WITH nl_award AS (SELECT playerid, yearid AS nlyear, teamid AS nl_team
				  FROM awardsmanagers INNER JOIN managers USING(playerid, yearid)
				  WHERE awardid LIKE 'TSN%'
							AND yearid > 1985
		 					AND awardsmanagers.lgid LIKE 'NL'),
		
		al_award AS (SELECT playerid, yearid AS alyear, teamid AS al_team
					 FROM awardsmanagers INNER JOIN managers USING(playerid, yearid)
					 WHERE awardid LIKE 'TSN%'
					 AND yearid > 1985
					 AND awardsmanagers.lgid LIKE 'AL')

SELECT namefirst, namelast, alyear, al_team, nlyear, nl_team
FROM nl_award INNER JOIN al_award USING(playerid)
				INNER JOIN people USING(playerid)
				





			
			
			