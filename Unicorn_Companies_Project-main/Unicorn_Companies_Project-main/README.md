![rainbow-unicorn-1](https://user-images.githubusercontent.com/69180967/206931829-f0c3919b-ab90-4116-ae29-8e357ca1a6e6.jpg)

# Unicorn Companies Project

A unicorn company is a private company with a valuation of at least $1 billion. Many current and recent unicorns are tech startups. These companies are often high-growth companies that have raised private funding aggressively and have differentiated business models in long-term growth markets. The aim of this project is explore and discover insights from a dataset of over 1,000 unicorn companies worldwide. Here I used PostgreSQL for Data Cleaning and Analysis.

## Objective

The chief goals in this project are to properly clean, prepare, and further analyze the data from different angles. Each phase will be concerned with distinct problems.

- In the Data Cleaning phase: handling NULLs, duplicates, unwanted characters, and typos.

- In the Data Preparation phase: creating and defining new columns, inserting values into them, and dealing with any abnormalities.

- In the Data Analysis phase: exploring the dataset, understanding the distribution of values through an Univariate Analysis, comparing multiple variables through a Multivariate Analysis, and extracting the key insights.

## Tools

The main tool used in this project is PostgreSQL. Some of the topics covered are:
- WHERE clause
- GROUP BY statement & aggregate functions
- COUNT / MIN / MAX / AVG functions
- UPDATE statement
- Data types overview  

## The Dataset

The unicorn_companies table has 11 columns, namely:

- __id:__ A serial column, used as Primary Key.
- __company:__ The company name.
- __industry:__ The company industry.
- __year_founded:__ The year the company was founded.
- __city:__ The city the company was founded in.
- __country:__ The country the company was founded in.
- __continent:__ The continent the company was founded in.
- __date_joined:__ The date in which the company reached $1 billion in valuation.
- __valuation_billion:__ The company valuation in billions of dollars.
- __funding:__ The total amount raised across all funding rounds in billions or millions of dollars.
- __investors:__ The top investing firms or individual investors.

The entire dataset has a total of 1074 rows.

## Source

Link to the full article: https://natan4tech.com/2022/12/08/data-cleaning-analysis-unicorn-companies/
