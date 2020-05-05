1.

1)
SELECT SUM(confirmed) FROM CountyConfirmedERE WHERE stateName = $name
2)
SELECT confirmed FROM CountyConfirmed WHERE countyName = $name
3)
SELECT SUM(confirmed) FROM CountyConfirmedERE WHERE date = $date

2.
1)
SELECT totalPop*pctOver65 FROM CountyData WHERE countyName = $name --county total*pctOver65
2)
SELECT SUM(totalPop*pctOver65) FROM CountyData WHERE stateName = $name     --state total*pctOver65

3.
SELECT t1.countyName 
FROM 
	CountyData AS t1 
	FULL JOIN CountyConfirmed AS t2 
	ON t1.countyName = t2.countyName 
ORDER BY t1.totalPop/t1.numHouseholds * (t2.confirmed/t1.totalPop)

4.
1)
SELECT SQRT(SQUARE(t1.lat - t2.lat) + SQUARE(t1.long - t2.long)) 
FROM 
	County AS t1
	County AS t2
WHERE
	t1.countyName = $name1
	t2.countyName = $name2

2)
SELECT t1.countyName, (t2.deaths/t1.confirmed)
FROM
	CountyConfirmed AS t1
	CountyDeaths AS t2
WHERE 
	t1.countyName IN ('$name1', '$name2')
	t2.countyName IN ('$name1', '$name2')

3)
SELECT totalPop, numHouseholds, medianAge, pctOver65
FROM CountyData
WHERE countyName IN ('$name1', '$name2')