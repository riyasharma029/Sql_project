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