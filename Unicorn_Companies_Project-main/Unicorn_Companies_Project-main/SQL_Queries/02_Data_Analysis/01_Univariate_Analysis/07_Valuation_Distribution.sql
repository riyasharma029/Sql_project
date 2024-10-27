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