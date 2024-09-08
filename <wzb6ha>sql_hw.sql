#1
SELECT Name FROM country WHERE Continent = 'South America';
#2
SELECT Population FROM country WHERE Name = 'Germany';
#3
SELECT city.Name 
FROM city 
JOIN country ON city.CountryCode = country.Code 
WHERE country.Name = 'Japan';
#4
SELECT Name, Population 
FROM country 
WHERE Continent = 'Africa' 
ORDER BY Population DESC 
LIMIT 3;
#5
SELECT Name, LifeExpectancy 
FROM country 
WHERE Population BETWEEN 1000000 AND 5000000;
#6
SELECT country.Name 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';
