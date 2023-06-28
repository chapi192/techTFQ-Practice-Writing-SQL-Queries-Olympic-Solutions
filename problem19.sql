/*
19. In which Sport/event, India has won highest medals.
*/
SELECT
	sport,
	COUNT(medal) as totalFromSport
FROM
	olympics_history
WHERE
	team = 'India'
	AND
	medal <> 'NA'
GROUP BY
	sport
ORDER BY 
	totalFromSport DESC
LIMIT
	1
