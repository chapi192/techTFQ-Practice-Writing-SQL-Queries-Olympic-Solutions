/*
16. Identify which country won the most gold, most silver and most bronze medals in each olympic games.
*/
WITH 
	medalAndCountry as (
		SELECT
			games,
			noc as country,
			SUM(CASE WHEN medal LIKE '%Gold%' THEN 1 ELSE 0 END) AS goldCount,
			SUM(CASE WHEN medal LIKE '%Silver%' THEN 1 ELSE 0 END) AS silverCount,
			SUM(CASE WHEN medal LIKE '%Bronze%' THEN 1 ELSE 0 END) AS bronzeCount
		FROM
			olympics_history
		GROUP BY 
			games, country
		ORDER BY
			games, goldCount DESC, silverCount DESC, bronzeCount DESC
		),

	medalSorted as (
		SELECT
			games,
			CONCAT(country, ' - ', goldCount) as max_gold,
			CONCAT(country, ' - ', silverCount) as max_silver,
			CONCAT(country, ' - ', bronzeCount) as max_bronze,
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY goldCount DESC) AS rnG,
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY silverCount DESC) AS rnS,
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY bronzeCount DESC) AS rnB
		FROM
			medalAndCountry
		),
		
	goldSorted as (
		SELECT 
			games,
			max_gold
		FROM
			medalSorted
		WHERE
			rnG = 1
		),
		
	silverSorted as (
		SELECT
			games,
			max_silver
		FROM
			medalSorted
		WHERE
			rnS = 1
		),
		
	bronzeSorted as (
		SELECT
			games,
			max_bronze
		FROM 
			medalSorted
		WHERE
			rnB = 1
		)

SELECT 
	GS.games,
	GS.max_gold,
	SS.max_silver,
	BS.max_bronze
FROM
	goldSorted GS
JOIN silverSorted SS ON GS.games = SS.games
JOIN bronzeSorted BS ON GS.games = BS.games

