-- Assume you are given the table below that shows job postings for all companies on the LinkedIn platform.
-- Write a query to get the number of companies that have posted duplicate job listings.

with jobs_grouped
AS(
  SELECT company_id, title, description, count(job_id) as job_count 
from job_listings
GROUP BY company_id, title, description)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
from jobs_grouped
where job_count >1
;
