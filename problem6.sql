/*
6. Identify the sport which was played in all summer olympics.
*/

WITH gamesAndSports AS (
	SELECT 
		sport, 
		COUNT(DISTINCT games) AS numberOfGames
	FROM 
		olympics_history
	WHERE
		games LIKE '%Summer%'
	GROUP BY 
		sport
	)
	
SELECT 
	sport, 
	numberOfGames
FROM 
	gamesAndSports
WHERE numberOfGames = 
	(
	SELECT 
		COUNT(DISTINCT games)
	FROM 
		olympics_history
	WHERE 
		games LIKE '%Summer%'
	);
