-- You are given the tables below containing information on Robinhood trades and users
-- Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns. Round your answer to 2 decimal places, and order your output by the advertiser_id.

SELECT city, count(city) as total_orders
FROM trades as t
INNER JOIN users as u ON t.user_id = u.user_id
where status = 'Completed'
group by city
order by total_orders desc
LIMIT 3;
