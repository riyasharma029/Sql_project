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