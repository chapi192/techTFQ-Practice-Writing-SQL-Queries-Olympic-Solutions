/*
8. Fetch the total no of sports played in each olympic games.
*/

SELECT
	games,
	COUNT(DISTINCT sport) AS sportCount
FROM
	olympics_history
GROUP BY
	games
ORDER BY 
	sportCount DESC;