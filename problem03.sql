/*
3. Mention the total no of nations who participated in each olympics game?
*/

SELECT 
	games, 
	COUNT(DISTINCT noc) AS country_count, 
	STRING_AGG(DISTINCT noc, ', ') AS country_list
FROM 
	olympics_history
GROUP BY
	games;