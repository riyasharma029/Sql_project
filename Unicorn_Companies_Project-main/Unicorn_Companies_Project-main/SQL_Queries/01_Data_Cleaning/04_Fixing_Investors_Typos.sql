-- Fixing typos in the investors field
-- Companies 'SVOLT' and 'Evidation' both have double comma typo in the investors column; their id are 105 and 910, respectively 
SELECT *
FROM unicorn
WHERE investors LIKE '%,,%';

-- Updating 'SVOLT' investors to the correct string 
UPDATE unicorn
SET investors = 'IDG Capital, Bank Of China Group Investment, SDIC CMC Investment Management'
WHERE id = 105;

-- Updating 'Evidation' investors to the correct string 
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