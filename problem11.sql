/*
11. Fetch the top 5 athletes who have won the most gold medals.
*/

SELECT
	name,
	team,
	COUNT(meadal) goldMeadalCount
FROM 
	olympics_history
WHERE
	meadal LIKE '%Gold%'
GROUP BY
	name, team
ORDER BY 
	goldMeadalCount DESC
LIMIT
	5;