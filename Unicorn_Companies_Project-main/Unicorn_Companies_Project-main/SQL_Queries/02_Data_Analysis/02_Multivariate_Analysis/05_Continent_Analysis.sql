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