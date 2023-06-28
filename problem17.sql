/*
17. Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
*/
WITH 
	meadalAndCountry as (
		SELECT
			games,
			noc as country,
			SUM(CASE WHEN meadal LIKE '%Gold%' THEN 1 ELSE 0 END) AS goldCount,
			SUM(CASE WHEN meadal LIKE '%Silver%' THEN 1 ELSE 0 END) AS silverCount,
			SUM(CASE WHEN meadal LIKE '%Bronze%' THEN 1 ELSE 0 END) AS bronzeCount,
			SUM(CASE WHEN meadal NOT LIKE '%NA%' THEN 1 ELSE 0 END) AS totalCount
		FROM
			olympics_history
		GROUP BY 
			games, country
		ORDER BY
			games, goldCount DESC, silverCount DESC, bronzeCount DESC, totalCount DESC
		),

	meadalSorted as (
		SELECT
			games,
			CONCAT(country, ' - ', goldCount) as max_gold,
			CONCAT(country, ' - ', silverCount) as max_silver,
			CONCAT(country, ' - ', bronzeCount) as max_bronze,
			CONCAT(country, ' - ', totalCount) as max_total,	
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY goldCount DESC) AS rnG,
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY silverCount DESC) AS rnS,
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY bronzeCount DESC) AS rnB,
			ROW_NUMBER() OVER (PARTITION BY games ORDER BY totalCount DESC) AS rnT
		FROM
			meadalAndCountry
		),
		
	goldSorted as (
		SELECT 
			games,
			max_gold
		FROM
			meadalSorted
		WHERE
			rnG = 1
		),
		
	silverSorted as (
		SELECT
			games,
			max_silver
		FROM
			meadalSorted
		WHERE
			rnS = 1
		),
		
	bronzeSorted as (
		SELECT
			games,
			max_bronze
		FROM 
			meadalSorted
		WHERE
			rnB = 1
		),
		
	totalSorted as (
		SELECT
			games,
			max_total
		FROM 
			meadalSorted
		WHERE
			rnT = 1
		)

SELECT 
	GS.games,
	GS.max_gold,
	SS.max_silver,
	BS.max_bronze,
	TS.max_total
FROM
	goldSorted GS
JOIN silverSorted SS ON GS.games = SS.games
JOIN bronzeSorted BS ON GS.games = BS.games
JOIN totalSorted TS ON GS.games = TS.games

