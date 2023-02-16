-- Find all players who hit their career highest number of home runs in 2016. Consider only 
-- players who have played in the league for at least 10 years, and who hit at least one home run in 2016. 
-- Report the players' first and last names and the number of home runs they hit in 2016.

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

    

