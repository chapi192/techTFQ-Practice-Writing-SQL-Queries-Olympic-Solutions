/*
12. Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
*/

SELECT
	name,
	team,
	COUNT(medal) medalCount
FROM 
	olympics_history
WHERE
	medal NOT LIKE '%NA%'
GROUP BY
	name, team
ORDER BY 
	medalCount DESC
LIMIT
	5;