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