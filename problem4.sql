/*
4. Which year saw the highest and lowest no of countries participating in olympics
*/

WITH gameCountryCount AS (
	SELECT 
		games, 
		COUNT(DISTINCT noc) AS country_count, 
		STRING_AGG(DISTINCT noc, ', ') AS country_list
	FROM
		olympics_history
	GROUP BY 
		games
	),
	
counts AS (
	SELECT
		MIN(country_count) AS minimum,
		MAX(country_count) AS maximum
	FROM
		gameCountryCount
	),

countriesAndCounts AS (
	SELECT * FROM
		gameCountryCount, counts
	WHERE 
		country_count = minimum or country_count = maximum
	)
	
SELECT 
	CONCAT((SELECT games FROM countriesAndCounts LIMIT 1), ' - ', minimum) AS lowest,
	CONCAT((SELECT games FROM countriesAndCounts OFFSET 1 LIMIT 1), ' - ', maximum) AS highest
FROM
	counts;