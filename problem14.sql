/*
14. List down total gold, silver and bronze medals won by each country.
*/

/*
Here I decided to order it so that the countries with the most meadals appear first.
We count gold, silver and bronze for each country, and the total of all meadals. With
this sub query method, we can only show the types of meadals but order based on 
the total amount any country has. I think the solution on the blog orders by gold,
then silver then bronze. This can easily be done without a subquery and with

ORDER BY
	goldCount DESC, silverCount DESC, bronzeCount DESC
*/

WITH meadalAndCountry AS (
	SELECT
		noc as country,
		SUM(CASE WHEN meadal LIKE '%Gold%' THEN 1 ELSE 0 END) AS goldCount,	
		SUM(CASE WHEN meadal LIKE '%Silver%' THEN 1 ELSE 0 END) AS silverCount,	
		SUM(CASE WHEN meadal LIKE '%Bronze%' THEN 1 ELSE 0 END) AS bronzeCount,
	
		SUM(CASE WHEN meadal NOT LIKE '%NA%' THEN 1 ELSE 0 END) AS totalCount
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
	meadalAndCountry
ORDER BY
	totalCount DESC
LIMIT 
	5;