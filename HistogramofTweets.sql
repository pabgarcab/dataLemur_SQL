-- Assume you are given the table below containing tweet data.
-- Write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.

with tabla1 as(
select user_id, count(msg) as aa
  from tweets
  where tweet_date >= '2022-01-01'
  group by user_id)
select DISTINCT aa as tweet_bucket, count(DISTINCT user_id)
from tabla1
group by tweet_bucket
order by tweet_bucket asc;
