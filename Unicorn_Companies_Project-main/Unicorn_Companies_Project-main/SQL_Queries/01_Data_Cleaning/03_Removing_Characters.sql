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