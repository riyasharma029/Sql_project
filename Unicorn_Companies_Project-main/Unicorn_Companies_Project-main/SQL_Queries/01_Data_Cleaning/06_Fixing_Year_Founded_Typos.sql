-- Fixing typo within the year_founded field
-- The company by the name of 'Yidian Zixun' has the year of foundation as '2021' but the joining year as '2017'
SELECT *
FROM unicorn 
WHERE company = 'Yidian Zixun';

-- Actually, the company was founded in 2013
UPDATE unicorn
SET year_founded = 2013
WHERE id = 714;

-- Checking changes
SELECT *
FROM unicorn 
WHERE id = 714;