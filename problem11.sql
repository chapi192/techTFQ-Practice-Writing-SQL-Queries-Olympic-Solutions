/*
11. Fetch the top 5 athletes who have won the most gold medals.
*/

SELECT
	name,
	team,
	COUNT(medal) goldmedalCount
FROM 
	olympics_history
WHERE
	medal LIKE '%Gold%'
GROUP BY
	name, team
ORDER BY 
	goldmedalCount DESC
LIMIT
	5;