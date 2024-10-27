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