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