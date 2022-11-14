-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. Sort the the output by candidate ID in ascending order.

select candidate_id
from candidates
where skill IN ('Tableau', 'Python', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3;
