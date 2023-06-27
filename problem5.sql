/*
5. Which nation has participated in all of the olympic games
*/

WITH gamesAndCountries AS (
	SELECT 
		noc AS country, 
		COUNT(DISTINCT games) AS numberOfGames
	FROM 
		olympics_history
	GROUP BY 
		noc
	)
		
SELECT 
	country, 
	numberOfGames
FROM 
	gamesAndCountries
WHERE numberOfGames = 
	(
	SELECT 
		COUNT(DISTINCT games)
	FROM 
		olympics_history
	);
