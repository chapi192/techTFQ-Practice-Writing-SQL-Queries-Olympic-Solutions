/*
20. Break down all olympic games where India won medal for Hockey and how many medals in each olympic games
*/
SELECT
	games,
	COUNT(medal) as totalFromHockey
FROM
	olympics_history
WHERE
	team = 'India'
	AND
	medal <> 'NA'
	AND
	sport = 'Hockey'
GROUP BY
	games
ORDER BY 
	games