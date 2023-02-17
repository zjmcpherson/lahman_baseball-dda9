-- 7. From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
-- What is the smallest number of wins for a team that did win the world series? 
-- Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. 
-- Then redo your query, excluding the problem year.
-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?
							--10 out of 42 times. cant figure out query
SELECT *
FROM teams
WHERE wswin = 'N'
	AND wswin IS NOT NULL
	AND yearid BETWEEN 1970 AND 2016
ORDER BY w DESC;

SELECT *
FROM teams
WHERE wswin = 'Y'
	AND wswin IS NOT NULL
	AND yearid BETWEEN 1970 AND 2016
	AND yearid <> 1981
ORDER BY w;
-- In 1981, there was a players' strike that lasted from 12 June - 31 July, resulting in a split season.



WITH most_wins AS (SELECT MAX(w), yearid
				   FROM teams
				   WHERE yearid BETWEEN 1970 AND 2016
				   GROUP BY yearid
				   ORDER BY yearid)

SELECT most_wins.max AS most_wins_in_season, yearid, wswin, teamid, teams.w AS total_wins_ws_win
FROM most_wins INNER JOIN teams USING(yearid)
WHERE most_wins.max = teams.w
    AND wswin LIKE 'Y'
ORDER BY yearid;

-- 12 out of 47 times or 25.53%
