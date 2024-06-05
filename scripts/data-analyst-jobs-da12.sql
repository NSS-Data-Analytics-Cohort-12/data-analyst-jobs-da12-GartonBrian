-- The dataset for this exercise has been derived from the `Indeed Data Scientist/Analyst/Engineer` [dataset](https://www.kaggle.com/elroyggj/indeed-dataset-data-scientistanalystengineer) on kaggle.com. 

-- Before beginning to answer questions, take some time to review the data dictionary and familiarize yourself with the data that is contained in each column.

-- #### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:

-- 1.	How many rows are in the data_analyst_jobs table?

-- SELECT 
-- COUNT(*)
-- FROM data_analyst_jobs;

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

-- SELECT
-- company
-- FROM data_analyst_jobs
-- LIMIT 10;

--ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

-- SELECT 
-- count(location) AS postings_In_Tennessee
-- FROM data_analyst_jobs
-- WHERE location = 'TN';

-- 21 in TN

-- SELECT 
-- count(location) AS postings_In_Tennessee_or_Kentucky 
-- FROM data_analyst_jobs
-- WHERE location = 'TN' OR location = 'KY';

--27 in the TN or KY

-- 4.	How many postings in Tennessee have a star rating above 4?
-- SELECT 
-- COUNT (star_rating) AS five_star_posting
-- FROM data_analyst_jobs
-- WHERE star_rating >=5 AND location = 'TN'

--1
-- 5.	How many postings in the dataset have a review count between 500 and 1000?
-- SELECT
-- 	COUNT (review_count) AS half_to_one_k_rewviews
-- FROM data_analyst_jobs
-- WHERE review_count 
-- 	BETWEEN 500 AND 1000;

-- 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?


-- SELECT 
-- 	avg(star_rating) as avg_rating,
-- 	company as company,
-- 	location as state
-- FROM data_analyst_jobs
-- WHERE star_rating IS NOT NULL
-- group by company, location, star_rating
-- order by star_rating desc;

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
-- SELECT count(DISTINCT(title))
-- FROM data_analyst_jobs;

-- 881
-- 8.	How many unique job titles are there for California companies?
-- SELECT count(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE location = 'CA';

-- 230
-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- SELECT 
-- 	avg(star_rating) as avg_rating,
-- 	company as company,
-- 	location as state,
-- 	review_count as reviews
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- group by company, location, review_count;

-- 83

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- SELECT 
-- 	avg(star_rating) as avg_rating,
-- 	company,
-- 	location as state,
-- 	review_count as reviews
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP by company, location, review_count
-- ORDER BY avg_rating desc;
--Looks like theres a tie between the top 9 companies

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- SELECT COUNT(DISTINCT title)
-- FROM data_analyst_jobs
-- WHERE title LIKE '%analyst%' or title like '%Analyst%'; 

-- 757

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- SELECT	
-- 	COUNT(DISTINCT title)
-- FROM data_analyst_jobs
-- WHERE title NOT LIKE 'Analyst' AND title NOT LIKE 'Analytics';

-- 881
--ANALY

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
