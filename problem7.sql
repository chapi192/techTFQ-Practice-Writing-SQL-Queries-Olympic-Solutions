/*
7. Which Sports were just played only once in the olympics.
*/

WITH sportCount AS (
	SELECT
		sport, 
		COUNT(DISTINCT games) AS numberOfGames
	FROM 
		olympics_history
	GROUP BY
		sport
	),
	
sportAndGame AS (
	SELECT DISTINCT
		sport, 
		games
	FROM 
		olympics_history
	ORDER BY 
		sport
	)
	
SELECT
	SG.sport,
	SG.games
FROM
	sportAndGame SG
INNER JOIN
	sportCount AS SC ON SG.sport = SC.sport
WHERE
	sc.numberOfGames = 1
ORDER BY
	sport;