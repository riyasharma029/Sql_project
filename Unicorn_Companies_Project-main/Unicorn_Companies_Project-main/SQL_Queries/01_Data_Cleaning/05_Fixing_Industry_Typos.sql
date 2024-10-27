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