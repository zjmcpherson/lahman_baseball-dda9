--Question #4:

SELECT CASE 
           WHEN POS = 'OF' THEN 'Outfield'
    	   WHEN POS IN ('SS', '1B', '2B', '3B') THEN 'Infield'
    	   WHEN POS IN ('P', 'C') THEN 'Battery' 
	END AS position_group,
	SUM(PO) AS total_putouts
FROM fielding
WHERE yearID = 2016
GROUP BY position_group;