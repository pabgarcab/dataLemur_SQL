-- Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.
-- Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

WITH tabla_send as (
  select a2.age_bucket, sum(a1.time_spent) as time_send
  from activities as a1 INNER JOIN age_breakdown as a2 ON a2.user_id = a1.user_id
  where activity_type = 'send'
  GROUP BY age_bucket),

tabla_open as (
  select a2.age_bucket, sum(a1.time_spent) as time_open
  from activities as a1 INNER JOIN age_breakdown as a2 ON a2.user_id = a1.user_id
  where activity_type = 'open'
  GROUP BY age_bucket)


SELECT  
  o.age_bucket, 
  round((s.time_send/(s.time_send+o.time_open))*100,2) as send_perc,
  round((o.time_open/(s.time_send+o.time_open))*100,2) as open_perc

FROM  tabla_open as o
INNER JOIN tabla_send as s 
  ON s.age_bucket = o.age_bucket;
