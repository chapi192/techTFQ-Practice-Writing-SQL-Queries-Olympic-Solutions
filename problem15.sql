/*
15. List down total gold, silver and bronze medals won by each country corresponding to each olympic games.
*/

SELECT
	games,
	noc as country,
	SUM(CASE WHEN medal LIKE '%Gold%' THEN 1 ELSE 0 END) as goldCount,
	SUM(CASE WHEN medal LIKE '%Silver%' THEN 1 ELSE 0 END) AS silverCount,	
	SUM(CASE WHEN medal LIKE '%Bronze%' THEN 1 ELSE 0 END) AS bronzeCount
FROM
	olympics_history
GROUP BY 
	games, country
ORDER BY
	games, country;