/*
18. Which countries have never won gold medal but have won silver/bronze medals?
*/
WITH countedMeadals AS (
	SELECT
		OH.noc,
		SUM(CASE WHEN OH.meadal LIKE '%Gold%' THEN 1 ELSE 0 END) AS goldCount,
		SUM(CASE WHEN OH.meadal LIKE '%Silver%' THEN 1 ELSE 0 END) AS silverCount,
		SUM(CASE WHEN OH.meadal LIKE '%Bronze%' THEN 1 ELSE 0 END) AS bronzeCount
	FROM 
		olympics_history OH
	GROUP BY
		OH.noc
	) 
	
SELECT 
	OHNR.reigion,
	CM.silverCount,
	CM.bronzeCount
FROM 
	countedMeadals CM
JOIN olympics_history_noc_reigions OHNR ON CM.noc = OHNR.noc
WHERE
	goldCount = 0
	AND
	(
	silverCount <> 0
	OR
	bronzeCount <> 0
	)
ORDER BY
	silverCount DESC