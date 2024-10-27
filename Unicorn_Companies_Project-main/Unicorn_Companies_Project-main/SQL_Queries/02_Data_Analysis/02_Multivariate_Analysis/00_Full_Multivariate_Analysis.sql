-- Multivariate Analysis: analyzing multiple variables
-- Retrieving the entire table
SELECT *
FROM unicorn
ORDER BY id;



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



-- Industry Analysis
-- The average year founded per industry
SELECT industry, ROUND(AVG(year_founded)) AS avg_year_founded
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY industry ASC;

-- The average year joined per industry
SELECT industry, ROUND(AVG(EXTRACT(YEAR FROM date_joined))) AS avg_year_joined
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY industry ASC;

-- The average time to unicorn per industry
SELECT industry, ROUND(AVG(EXTRACT(YEAR FROM date_joined) - year_founded), 2) AS avg_years_to_unicorn
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY ROUND(AVG(EXTRACT(YEAR FROM date_joined) - year_founded), 2) ASC;
-- The shortest average time to unicorn per industry: Auto & transportation, AI, Hardware, Mobile & telecom, E-commerce  

-- The shortest time to unicorn of each industry
SELECT industry, ROUND(MIN(EXTRACT(YEAR FROM date_joined) - year_founded)) AS min_years_to_unicorn
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY ROUND(MIN(EXTRACT(YEAR FROM date_joined) - year_founded)) ASC;

-- The longest time to unicorn of each industry
SELECT industry, ROUND(MAX(EXTRACT(YEAR FROM date_joined) - year_founded)) AS max_years_to_unicorn
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY ROUND(MAX(EXTRACT(YEAR FROM date_joined) - year_founded)) DESC;

-- The average valuation per industry
SELECT industry, ROUND(AVG(valuation_billion), 1) AS avg_valuation
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY ROUND(AVG(valuation_billion), 1) DESC;
-- Highest average valuations: AI, Consumer & retail, Fintech, E-commerce, Edtech

-- The highest valuation of each industry
SELECT industry, ROUND(MAX(valuation_billion)) AS highest_valuation
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY ROUND(MAX(valuation_billion)) DESC;
-- Top 3: AI, E-commerce, and Fintech



-- City Analysis
-- The average valuation per city 
SELECT city, ROUND(AVG(valuation_billion)) AS avg_valuation
FROM unicorn
GROUP BY city
ORDER BY ROUND(AVG(valuation_billion)) DESC;

-- The highest valuation of each city 
SELECT city, ROUND(MAX(valuation_billion)) AS highest_valuation
FROM unicorn
GROUP BY city
ORDER BY ROUND(MAX(valuation_billion)) DESC;



-- Country Analysis
-- The average valuation per country 
SELECT country, ROUND(AVG(valuation_billion)) AS avg_valuation
FROM unicorn
GROUP BY country
ORDER BY ROUND(AVG(valuation_billion)) DESC;
-- There are some outliers in Bahamas, Sweden, and Australia

-- The highest valuation of each country
SELECT country, ROUND(MAX(valuation_billion)) AS highest_valuation
FROM unicorn
GROUP BY country
ORDER BY ROUND(MAX(valuation_billion)) DESC;



-- Continent Analysis
-- The average valuation per continent 
SELECT continent, ROUND(AVG(valuation_billion)) AS avg_valuation
FROM unicorn
GROUP BY continent
ORDER BY ROUND(AVG(valuation_billion)) DESC;

-- The highest valuation of each continent 
SELECT continent, ROUND(MAX(valuation_billion)) AS highest_valuation
FROM unicorn
GROUP BY continent
ORDER BY ROUND(MAX(valuation_billion)) DESC;