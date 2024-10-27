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