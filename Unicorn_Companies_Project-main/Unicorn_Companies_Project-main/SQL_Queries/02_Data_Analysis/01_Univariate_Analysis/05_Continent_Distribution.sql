-- Continent distribution
-- Counting how many distinct continents there are
SELECT COUNT(DISTINCT(continent))
FROM unicorn;
-- There is data from all 6 continents in the dataset

-- Checking all the distinct countries in the dataset
SELECT DISTINCT(continent)
FROM unicorn
ORDER BY continent ASC;

-- Checking the distribution of unicorn companies across each continent
SELECT continent, COUNT(continent)
FROM unicorn
GROUP BY continent
ORDER BY COUNT(continent) DESC;
-- The top 3 most frequent continents for unicorn companies are: North America, Asia, and Europe (North America being the most dominant)