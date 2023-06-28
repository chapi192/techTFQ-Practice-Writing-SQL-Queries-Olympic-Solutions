/*
14. List down total gold, silver and bronze medals won by each country.
*/

/*
Here I decided to order it so that the countries with the most medals appear first.
We count gold, silver and bronze for each country, and the total of all medals. With
this sub query method, we can only show the types of medals but order based on 
the total amount any country has. I think the solution on the blog orders by gold,
then silver then bronze. This can easily be done without a subquery and with

ORDER BY
	goldCount DESC, silverCount DESC, bronzeCount DESC
*/

WITH medalAndCountry AS (
	SELECT
		noc as country,
		SUM(CASE WHEN medal LIKE '%Gold%' THEN 1 ELSE 0 END) AS goldCount,	
		SUM(CASE WHEN medal LIKE '%Silver%' THEN 1 ELSE 0 END) AS silverCount,	
		SUM(CASE WHEN medal LIKE '%Bronze%' THEN 1 ELSE 0 END) AS bronzeCount,
	
		SUM(CASE WHEN medal NOT LIKE '%NA%' THEN 1 ELSE 0 END) AS totalCount
	FROM
		olympics_history
	GROUP BY
		country
	)
	
SELECT
	country,
	goldCount,
	silverCount,
	bronzeCount
FROM 
	medalAndCountry
ORDER BY
	totalCount DESC
LIMIT 
	5;