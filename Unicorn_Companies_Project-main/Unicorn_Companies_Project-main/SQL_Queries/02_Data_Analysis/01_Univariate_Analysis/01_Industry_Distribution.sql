-- Industry distribution
-- Checking distinct industry names
SELECT DISTINCT(industry)
FROM unicorn
ORDER BY industry ASC;

-- Counting how many distinct industries there are
SELECT COUNT(DISTINCT(industry))
FROM unicorn;
-- There are 15 different industries in the dataset

-- Checking the distribution of unicorns companies across each industry field
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