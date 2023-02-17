-- 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places.
--    Do the same for home runs per game. Do you see any trends?
SELECT pitching.yearid / 10 * 10 AS decade,
  		AVG(pitching.so::numeric/ pitching.g) AS avg_strikeouts_per_game,
  		ROUND(AVG(pitching.hr::numeric/ pitching.g),2) AS avg_home_runs_per_game
FROM teams 
JOIN pitching ON teams.yearid = pitching.yearid AND teams.teamid = pitching.teamid
WHERE teams.yearid >= 1920
GROUP BY decade
ORDER BY decade;



--6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases. 
SELECT namefirst, 
	namelast, 
	ROUND(sb/(sb+cs)::numeric,2)*100 AS attempt_freq
FROM batting
LEFT JOIN people USING(playerid)
WHERE sb>=20
	AND cs>0
	AND yearid=2016
GROUP BY namefirst, namelast, sb, cs
ORDER BY attempt_freq DESC;


-- 10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years,
-- and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.
SELECT 
    people.namefirst AS first_name,
    people.namelast AS last_name,
	batting.yearid AS player_id,
	MAX(batting.hr) AS max_hr_2016,
	people.debut AS people_debut
FROM 
    batting
    INNER JOIN people ON batting.playerid = people.playerid
WHERE 
    batting.yearid = 2016 AND people.debut ILIKE '%2006%' AND batting.hr >= 1
GROUP BY first_name, last_name, batting.yearid, batting.hr, people.debut
ORDER BY batting.hr DESC;
