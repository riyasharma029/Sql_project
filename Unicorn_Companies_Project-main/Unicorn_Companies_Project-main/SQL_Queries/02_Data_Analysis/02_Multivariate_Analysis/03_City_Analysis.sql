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