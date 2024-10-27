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



--ALTER TABLE unicorn
--DROP COLUMN investor_1,
--DROP COLUMN investor_2,
--DROP COLUMN investor_3,
--DROP COLUMN investor_4;