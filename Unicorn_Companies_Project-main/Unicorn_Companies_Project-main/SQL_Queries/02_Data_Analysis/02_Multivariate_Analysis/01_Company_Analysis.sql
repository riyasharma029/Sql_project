-- Company Analysis
-- The oldest unicorn companies in the dataset
SELECT company, industry, year_founded
FROM unicorn
ORDER BY year_founded ASC
LIMIT 10;

-- The newest unicorn companies in the dataset
SELECT company, industry, year_founded
FROM unicorn
ORDER BY year_founded DESC
LIMIT 10;

-- The companies with the longest time to unicorn
SELECT company, industry, EXTRACT(YEAR FROM date_joined) - year_founded AS years_to_unicorn
FROM unicorn
ORDER BY EXTRACT(YEAR FROM date_joined) - year_founded DESC
LIMIT 10;

-- The companies with the shortest time to unicorn
SELECT company, industry, EXTRACT(YEAR FROM date_joined) - year_founded AS years_to_unicorn
FROM unicorn
ORDER BY EXTRACT(YEAR FROM date_joined) - year_founded ASC
LIMIT 10;

-- Companies with the highest valuations
SELECT company, industry
FROM unicorn
ORDER BY valuation_billion DESC
LIMIT 10;