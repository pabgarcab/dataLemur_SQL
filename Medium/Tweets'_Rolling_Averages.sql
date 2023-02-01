-- The table below contains information about tweets over a given period of time.
-- Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted. Output the user id, tweet date, and rolling averages rounded to 2 decimal places.

with tabla1 as (
SELECT 
  user_id, tweet_date, count(tweet_id) as num_tweets

FROM 
  tweets

GROUP BY 
  user_id,tweet_date

ORDER BY 
  user_id, tweet_date
)

SELECT 
  user_id, tweet_date,
ROUND(avg(num_tweets) OVER (PARTITION BY user_id rows between 2 preceding and current row),2) as rolling_avg_3days

FROM 
  tabla1
;
