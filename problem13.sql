/*
13. Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
*/

SELECT
	noc as country,
	COUNT(medal) as totalmedalCount
FROM
	olympics_history
WHERE
	medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY
	country
ORDER BY
	totalmedalCount DESC
LIMIT 
	5;