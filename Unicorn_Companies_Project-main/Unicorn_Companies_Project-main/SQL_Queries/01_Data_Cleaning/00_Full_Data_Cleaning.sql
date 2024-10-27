-- Creating table
CREATE TABLE unicorn
(
	id SERIAL PRIMARY KEY,
	company VARCHAR(255),
	industry VARCHAR(255),
	year_founded INTEGER,
	city VARCHAR(255),
	country VARCHAR(255),
	continent VARCHAR(255),
	date_joined DATE,
	valuation_billion VARCHAR(255),
	funding VARCHAR(255),
	investors TEXT
);
-- Importing .csv file

-- Returning entire table
SELECT *
FROM unicorn;
-- No errors


-- Handling NULLs
-- Finding NULLs
SELECT *
FROM unicorn
WHERE NOT (unicorn IS NOT NULL);

-- Counting NULLs
SELECT COUNT(*)
FROM unicorn
WHERE NOT (unicorn IS NOT NULL);

-- Inserting 'Nassau' as the city
UPDATE unicorn 
SET city = 'Nassau' 
WHERE city IS NULL
AND id = 12;

-- Checking changes
SELECT *
FROM unicorn
WHERE id = 12;

-- Inserting 'Hong Kong' as the city
UPDATE unicorn 
SET city = 'Hong Kong' 
WHERE city IS NULL
AND country = 'Hong Kong';

-- Checking changes
SELECT *
FROM unicorn
WHERE city = 'Hong Kong';

-- Inserting 'China' as the country where was previously 'Hong Kong' as country
UPDATE unicorn 
SET country = 'China' 
WHERE city = 'Hong Kong';

-- Checking changes
SELECT *
FROM unicorn
WHERE id IN (325, 893, 1061);

-- Correcting other 'Hong Kong' as a country errors
SELECT *
FROM unicorn
WHERE country = 'Hong Kong';

UPDATE unicorn 
SET city = 'Hong Kong' 
WHERE country = 'Hong Kong';

UPDATE unicorn 
SET country = 'China' 
WHERE id IN (56, 595, 720);

-- Checking changes
SELECT *
FROM unicorn
WHERE id IN (56, 595, 720);

-- Inserting 'Singapore' as a city into the remaining NULLs
UPDATE unicorn 
SET city = 'Singapore' 
WHERE city IS NULL;

-- Checking changes
SELECT id, company, city, country
FROM unicorn
WHERE id IN (170, 242, 251, 382, 541, 811, 848, 880, 889, 980, 986, 994)
ORDER BY id ASC;

-- Checking all the rows that were previously NULLs
SELECT id, company, city, country
FROM unicorn
WHERE id IN (12, 170, 242, 251, 325, 382, 541, 811, 848, 880, 889, 893, 980, 986, 994, 1061)
ORDER BY id ASC;

-- Checking the other rows that had 'Hong Kong' as a country
SELECT id, company, city, country
FROM unicorn
WHERE id IN (56, 595, 720)
ORDER BY id ASC;



-- Cleaning unwanted characters
-- Removing the '$' sign from the valuation_billion column
UPDATE unicorn
SET valuation_billion = REPLACE(valuation_billion, '$', '');

-- Removing the letter 'B' from the valuation_billion column
UPDATE unicorn
SET valuation_billion = REPLACE(valuation_billion, 'B', '');

-- Altering the data type of the valuation_billion from VARCHAR to INTEGER
ALTER TABLE unicorn
ALTER COLUMN valuation_billion TYPE INT USING valuation_billion::INT;

-- Removing the '$' sign from the funding column
UPDATE unicorn
SET funding = REPLACE(funding, '$', '');

-- Checking changes
SELECT *
FROM unicorn;



-- Fixing typos in the investors field
-- Companies 'SVOLT' and 'Evidation' both have double comma typo in the investors column; their id are 105 and 910, respectively 
SELECT *
FROM unicorn
WHERE investors LIKE '%,,%';

-- Updating 'SVOLT' to the correct string 
UPDATE unicorn
SET investors = 'IDG Capital, Bank Of China Group Investment, SDIC CMC Investment Management'
WHERE id = 105;

-- Updating 'Evidation' to the correct string 
UPDATE unicorn
SET investors = 'B Capital Group, GE Ventures, McKesson Ventures'
WHERE id = 910;

-- Checking the changes made
SELECT id, company, investors
FROM unicorn
WHERE id IN (105, 910);

-- Fixing investor name typo; the company 'Rappi' has one of its investors name written wrongly
UPDATE unicorn
SET investors = 'DST Global, Andreessen Horowitz, Sequoia Capital, Redpoint Ventures'
WHERE id = 149;

-- Checking the change made
SELECT id, company, investors
FROM unicorn
WHERE id = 149;

-- One company has 'N/A' (Non Applicable) in the investors field 
SELECT *
FROM unicorn
WHERE investors = 'N/A';

-- Changing from 'N/A' to NULL
UPDATE unicorn
SET investors = NULL
WHERE investors = 'N/A';

-- Checking changes
SELECT *
FROM unicorn
WHERE id = 629;

-- There are two companies with 'Undisclosed' investors
SELECT *
FROM unicorn
WHERE investors = 'Undisclosed';

-- Changing from 'Undisclosed' to NULL
UPDATE unicorn
SET investors = NULL
WHERE investors = 'Undisclosed';

-- Checking changes
SELECT *
FROM unicorn
WHERE id IN (744, 550);

-- The company 'Skydio' has a duplicate in the investors field
SELECT *
FROM unicorn
WHERE company = 'Skydio'

-- Updating 'Skydio' investors to the correct string
UPDATE unicorn
SET investors = 'Andreessen Horowitz, Institutional Venture Partners, Accel'
WHERE id = 1025;

-- Checking changes
SELECT *
FROM unicorn
WHERE id = 1025;



-- Fixing typos within the industry field
-- There are 73 entries with the industry name of 'Artificial intelligence' with a lowercase 'i'
SELECT *
FROM unicorn 
WHERE industry = 'Artificial intelligence';

-- There are 11 entries with the industry name of 'Artificial Intelligence' with a uppercase 'I'
SELECT *
FROM unicorn 
WHERE industry = 'Artificial Intelligence'
ORDER BY id;

-- Fixing industry typo in 'Artificial Intelligence'
UPDATE unicorn
SET industry = 'Artificial intelligence'
WHERE industry = 'Artificial Intelligence';

-- Checking changes
SELECT *
FROM unicorn
WHERE id IN (270, 412, 443, 523, 637, 643, 789, 863, 896, 929, 991);



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



-- Splitting the investors column into 4 columns: investor_1, investor_2, investor_3, and investor_4
-- First, adding the new columns
ALTER TABLE unicorn
ADD COLUMN investor_1 VARCHAR(255),
ADD COLUMN investor_2 VARCHAR(255),
ADD COLUMN investor_3 VARCHAR(255),
ADD COLUMN investor_4 VARCHAR(255);

-- Splitting the values from the investors column
UPDATE unicorn
SET investor_1 = SPLIT_PART(investors::VARCHAR(255), ',', 1),
	investor_2 = SPLIT_PART(investors::VARCHAR(255), ',', 2),
	investor_3 = SPLIT_PART(investors::VARCHAR(255), ',', 3),
	investor_4 = SPLIT_PART(investors::VARCHAR(255), ',', 4);

-- Checking changes
SELECT *
FROM unicorn;

-- Changing the blanks for NULLs; this will be helpful to further analyze the number of investors
-- investor_1 column
UPDATE unicorn 
SET investor_1 = NULL WHERE investor_1 = '';

-- investor_2 column
UPDATE unicorn 
SET investor_2 = NULL WHERE investor_2 = '';

-- investor_3 column
UPDATE unicorn 
SET investor_3 = NULL WHERE investor_3 = '';

-- investor_4 column
UPDATE unicorn 
SET investor_4 = NULL WHERE investor_4 = '';

-- Checking changes made
SELECT id, company, investors, investor_1, investor_2, investor_3, investor_4
FROM unicorn
ORDER BY id ASC;