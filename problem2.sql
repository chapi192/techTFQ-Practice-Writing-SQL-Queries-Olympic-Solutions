/*
2. List down all Olympics games held so far.
*/

SELECT DISTINCT 
	OH.year, OH.season, OH.city
FROM 
	olympics_history OH
ORDER BY 
	OH.year;