-- Country distribution
-- Counting how many distinct countries there are
SELECT COUNT(DISTINCT(country))
FROM unicorn;
-- There are 45 different values in the country column 

-- Checking all the distinct countries in the dataset
SELECT DISTINCT(country)
FROM unicorn
ORDER BY country ASC;

-- Checking the distribution of unicorn companies across each country
SELECT country, COUNT(country)
FROM unicorn
GROUP BY country
ORDER BY COUNT(country) DESC;
-- The top 5 most frequent countries for unicorn companies are: U.S., China, India, U.K., and Germany (U.S. being the most dominant)