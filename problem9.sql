/*
9. Fetch oldest athletes to win a gold medal
*/

SELECT
	name,
	games,
	age,
	year,
	sport,
	event,
	medal	
FROM
	olympics_history
WHERE
	medal LIKE '%Gold%' 
	AND
	age NOT LIKE '%NA%'
ORDER BY
	age DESC
LIMIT 
	3;