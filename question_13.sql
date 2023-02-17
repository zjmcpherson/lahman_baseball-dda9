-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective.
-- 	   Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare
-- 	   left-handed pitchers are compared with right-handed pitchers.
-- 	   Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?

WITH left_stats AS (SELECT COUNT(*) total_left_pitchers,
						   ROUND(AVG(era::numeric),2) as avg_era_left,
				   		   ROUND(AVG(baopp::numeric),3) as left_opp_batting_avg,
						   		SUM(so) as total_strikeouts_left
				   FROM pitching INNER JOIN people USING(playerid)
				   WHERE throws LIKE 'L'
				   AND era IS NOT NULL
				   AND era <> 0),

	right_stats AS (SELECT COUNT(*) total_right_pitchers,
						   ROUND(AVG(era::numeric),2) as avg_era_right,
						   ROUND(AVG(baopp::numeric),3) as right_opp_batting_avg,
								SUM(so) as total_strikeouts_right
					FROM pitching INNER JOIN people USING(playerid)
					WHERE throws LIKE 'R'
					AND era IS NOT NULL
					AND era <> 0)

SELECT *
FROM left_stats, right_stats

-- In this dataset, left-handed pitchers account for only one third (12121) of all pitchers, in comparison to 31244 total right-handed pitchers.
-- The stats are similar with only a few differences. The opponents batting average is slightly lower when facing a left-handed pitcher, but the average era
-- is higher than right-handed pitchers.



--Left/right-handed CY Young winners
SELECT throws,
	COUNT(*) AS total
FROM awardsplayers
JOIN people USING(playerid)
WHERE awardid LIKE 'C%'
GROUP BY throws;

-- 44/12121 left-handed cy young award winners   .36% of all left-handed pitchers to win the cy young award
-- 92/31244 right-handed cy young award winners  .29% of all right-handed pitchers to win the cy young award


SELECT DISTINCT playerid, namefirst, namelast, throws
FROM halloffame LEFT JOIN pitching USING(playerid)
				LEFT JOIN people USING (playerid)
WHERE era IS NOT NULL
		AND era <> 0
		AND throws LIKE 'L'
-- 136 left-handed pitchers are in the hall of fame

SELECT DISTINCT playerid, namefirst, namelast, throws
FROM halloffame LEFT JOIN pitching USING(playerid)
				LEFT JOIN people USING (playerid)
WHERE era IS NOT NULL
		AND era <> 0
		AND throws LIKE 'R'
-- 332 right-handed pitchers are in the hall of fame

-- Looking at the total of left-handed pitchers to right-handed pitchers, the variance in their stats are marginal.
