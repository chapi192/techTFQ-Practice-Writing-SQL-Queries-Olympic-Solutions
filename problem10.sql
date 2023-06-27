/*
10. Find the Ratio of male and female athletes participated in all olympic games.
*/

/*
This yields the ratio of women:men. So for every woman there are 2.6 men. However the 
problem asks for male to female ratio. I did it this way to reflect the solution
given on the website, which is female:male.
*/

WITH maleCount AS (
	SELECT
		COUNT(sex) AS mCount
	FROM 
		olympics_history
	WHERE
		sex LIKE '%M%'
),

femaleCount AS (
	SELECT 
		COUNT(sex) AS fCount
	FROM 
		olympics_history
	WHERE
		sex LIKE '%F%'
)

SELECT
	CONCAT( '1 : ', ROUND(mCount * 1.0 / fCount, 3)) AS FtoM
FROM
	maleCount,
	femaleCount;