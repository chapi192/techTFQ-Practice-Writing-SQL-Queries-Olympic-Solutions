/*
13. Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
*/

SELECT
	noc as country,
	COUNT(meadal) as totalMeadalCount
FROM
	olympics_history
WHERE
	meadal IN ('Gold', 'Silver', 'Bronze')
GROUP BY
	country
ORDER BY
	totalMeadalCount DESC
LIMIT 
	5;