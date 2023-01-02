-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

with ranked as (select user_id, spend, transaction_date, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) as rank
from transactions)

select user_id, spend, transaction_date
from ranked
where rank = 3
;
