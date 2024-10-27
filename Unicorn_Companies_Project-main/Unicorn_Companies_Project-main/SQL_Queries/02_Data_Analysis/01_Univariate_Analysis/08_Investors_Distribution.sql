-- Investors distribution
-- Counting how many companies with no investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_1 IS NULL;
-- There are 3

-- Checking checking these companies with no investor
SELECT id, company, investors
FROM unicorn
WHERE investor_1 IS NULL;
-- These companies have investors, but they are undisclosed 


-- Counting how many companies with only one investor there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_1 IS NOT NULL
AND investor_2 IS NULL;
-- There are 44 companies with only one investor
  
-- Checking these single investor companies  
SELECT id, company, investor_1, investor_2
FROM unicorn
WHERE investor_1 IS NOT NULL
AND investor_2 IS NULL;


-- Counting how many companies with two investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_2 IS NOT NULL
AND investor_3 IS NULL;
-- There are 82 companies with two investors

-- Checking these companies with two investors
SELECT id, company, investor_1, investor_2, investor_3
FROM unicorn
WHERE investor_2 IS NOT NULL
AND investor_3 IS NULL;


-- Counting how many companies with three investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_3 IS NOT NULL
AND investor_4 IS NULL;
-- There are 940 companies with three investors (most companies have this number of investors)

-- Checking these companies with three investors
SELECT id, company, investor_1, investor_2, investor_3, investor_4
FROM unicorn
WHERE investor_3 IS NOT NULL
AND investor_4 IS NULL;


-- Counting how many companies with four investors there are
SELECT COUNT(*)
FROM unicorn
WHERE investor_4 IS NOT NULL;
-- There are only 5 companies with four investors  

-- Checking these companies with four investors
SELECT id, company, investors, investor_1, investor_2, investor_3, investor_4
FROM unicorn
WHERE investor_4 IS NOT NULL;


-- Most frequent investors
-- investor_1
SELECT investor_1, COUNT(investor_1)
FROM unicorn
GROUP BY investor_1
ORDER BY COUNT(investor_1) DESC
LIMIT 10;
-- Sequoia Capital China

-- investor_2
SELECT investor_2, COUNT(investor_2)
FROM unicorn
GROUP BY investor_2
ORDER BY COUNT(investor_2) DESC
LIMIT 10;
-- Tiger Global Management

-- investor_3
SELECT investor_3, COUNT(investor_3)
FROM unicorn
GROUP BY investor_3
ORDER BY COUNT(investor_3) DESC
LIMIT 10;
-- Tiger Global Management

-- investor_4
SELECT investor_4, COUNT(investor_4)
FROM unicorn
GROUP BY investor_4
ORDER BY COUNT(investor_4) DESC
LIMIT 4;
-- The sample is too small

-- The top 5 investors overall are: Tiger Global Management, Andreessen Horowitz, Accel, Sequoia Capital, and Insight Partners
-- If we count Sequoia Capital and Sequoia Capital China together, it becomes the top 1, with 87 appearances 