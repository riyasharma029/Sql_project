-- Univariate Analysis: checking data distribution across every aspect of the dataset
-- Retrieving the entire table
SELECT *
FROM unicorn
ORDER BY id ASC;

-- Counting how many rows the entire dataset has
SELECT COUNT(*)
FROM unicorn;
-- A total of 1074 entries 



-- Industry distribution
-- Counting how many distinct industries there are
SELECT COUNT(DISTINCT(industry))
FROM unicorn;
-- There are 15 different industries in the dataset

-- Checking distinct industry names
SELECT DISTINCT(industry)
FROM unicorn
ORDER BY industry ASC;

-- Checking the distribution of unicorn companies across each industry field
SELECT industry, COUNT(industry)
FROM unicorn
WHERE industry != 'Other'
GROUP BY industry
ORDER BY COUNT(industry) DESC;
-- Fintech, Internet Software, E-commerce, and Artificial Intelligence have the highest concentration of unicorns

-- Checking companies within the 'Other' industry field
SELECT *
FROM unicorn
WHERE industry = 'Other';



-- Year Founded distribution
-- Counting how many distinct years the year_founded column holds
SELECT COUNT(DISTINCT(year_founded))
FROM unicorn;
-- There are 35 different values in the year_founded column

-- Checking the year period covered in the dataset
SELECT DISTINCT(year_founded)
FROM unicorn
ORDER BY year_founded ASC;
-- There companies founded from 1919 to 2021 in the dataset

-- Checking the distribution of unicorn companies across each founding year
SELECT year_founded, COUNT(year_founded)
FROM unicorn
GROUP BY year_founded
ORDER BY COUNT(year_founded) DESC;
-- Most unicorn companies in the dataset were founded between 2014 and 2016



-- City distribution
-- Counting how many distinct cities there are
SELECT COUNT(DISTINCT(city))
FROM unicorn;
-- There are 256 different values in the city column 

-- Checking all the distinct cities in the dataset
SELECT DISTINCT(city)
FROM unicorn
ORDER BY city ASC;

-- Checking the distribution of unicorn companies across each city
SELECT city, COUNT(city)
FROM unicorn
GROUP BY city
ORDER BY COUNT(city) DESC;
-- The top 5 most frequent cities for unicorn companies are: San Francisco, New York, Beijing, Shangai, and London



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



-- Year Joined distribution
-- Counting how many distinct years of entry there are
SELECT COUNT(DISTINCT(EXTRACT(YEAR FROM date_joined)))
FROM unicorn;
-- There are 13 different years in the date_joined column

-- Checking all the distinct years in the date_joined colum 
SELECT DISTINCT(EXTRACT(YEAR FROM date_joined)) AS year_joined
FROM unicorn
ORDER BY EXTRACT(YEAR FROM date_joined) ASC;
-- There are companies reaching the unicorn mark from 2007 to 2022

-- Checking the distribution of unicorn companies across each year of entry
SELECT EXTRACT(YEAR FROM date_joined) AS year_joined, COUNT(EXTRACT(YEAR FROM date_joined))
FROM unicorn
GROUP BY EXTRACT(YEAR FROM date_joined)
ORDER BY COUNT(EXTRACT(YEAR FROM date_joined)) DESC;
-- Most companies joined between 2018 and 2022 (2021 being the most dominant year of entry)



-- Valuation distribution
-- Counting how many distinct valuation values there are
SELECT COUNT(DISTINCT(valuation_billion))
FROM unicorn;
-- There are 30 different values in the  column 

-- Checking all the distinct valuation values in the dataset
SELECT DISTINCT(valuation_billion)
FROM unicorn
ORDER BY valuation_billion DESC;

-- Checking the distribution of unicorn companies across each 
SELECT valuation_billion, COUNT(valuation_billion)
FROM unicorn
GROUP BY valuation_billion
ORDER BY COUNT(valuation_billion) DESC;
-- Most companies in the dataset are valued between 1 and 12 billion (the highest valuation is from SpaceX, which is 180 billion)

-- Getting the average valuation for a unicorn company
SELECT ROUND(AVG(valuation_billion), 1) AS avg_valuation
FROM unicorn;
-- 3.5 billion

-- Getting the average but removing some outliers 
SELECT ROUND(AVG(valuation_billion), 1) AS avg_valuation
FROM unicorn
WHERE valuation_billion NOT IN (95, 100, 180);
-- 3.0 billion



-- Investors distribution
-- Counting how many companies with no investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_1 IS NULL;
-- There are 3

-- Checking checking these companies with no investor
SELECT id, company, investors
FROM unicorn
WHERE investor_1 IS NULL;
-- These companies have investors, but they are undisclosed 


-- Counting how many companies with only one investor there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_1 IS NOT NULL
AND investor_2 IS NULL;
-- There are 44 companies with only one investor
  
-- Checking these single investor companies  
SELECT id, company, investor_1, investor_2
FROM unicorn
WHERE investor_1 IS NOT NULL
AND investor_2 IS NULL;


-- Counting how many companies with two investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_2 IS NOT NULL
AND investor_3 IS NULL;
-- There are 82 companies with two investors

-- Checking these companies with two investors
SELECT id, company, investor_1, investor_2, investor_3
FROM unicorn
WHERE investor_2 IS NOT NULL
AND investor_3 IS NULL;


-- Counting how many companies with three investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_3 IS NOT NULL
AND investor_4 IS NULL;
-- There are 940 companies with three investors (most companies have this number of investors)

-- Checking these companies with three investors
SELECT id, company, investor_1, investor_2, investor_3, investor_4
FROM unicorn
WHERE investor_3 IS NOT NULL
AND investor_4 IS NULL;


-- Counting how many companies with four investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_4 IS NOT NULL;
-- There are only 5 companies with four investors  

-- Checking these companies with four investors
SELECT id, company, investors, investor_1, investor_2, investor_3, investor_4
FROM unicorn
WHERE investor_4 IS NOT NULL;


-- Most frequent investors
-- investor_1
SELECT investor_1, COUNT(investor_1)
FROM unicorn
GROUP BY investor_1
ORDER BY COUNT(investor_1) DESC
LIMIT 10;
-- Sequoia Capital China

-- investor_2
SELECT investor_2, COUNT(investor_2)
FROM unicorn
GROUP BY investor_2
ORDER BY COUNT(investor_2) DESC
LIMIT 10;
-- Tiger Global Management

-- investor_3
SELECT investor_3, COUNT(investor_3)
FROM unicorn
GROUP BY investor_3
ORDER BY COUNT(investor_3) DESC
LIMIT 10;
-- Tiger Global Management

-- investor_4
SELECT investor_4, COUNT(investor_4)
FROM unicorn
GROUP BY investor_4
ORDER BY COUNT(investor_4) DESC
LIMIT 4;
-- The sample is too small

-- The top 5 investors overall are: Tiger Global Management, Andreessen Horowitz, Accel, Sequoia Capital, and Insight Partners
-- If we count Sequoia Capital and Sequoia Capital China together, it becomes the top 1, with 87 appearances 