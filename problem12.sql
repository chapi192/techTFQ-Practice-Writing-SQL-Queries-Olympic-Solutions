/*
12. Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
*/

SELECT
	name,
	team,
	COUNT(meadal) meadalCount
FROM 
	olympics_history
WHERE
	meadal NOT LIKE '%NA%'
GROUP BY
	name, team
ORDER BY 
	meadalCount DESC
LIMIT
	5;