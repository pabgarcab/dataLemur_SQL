-- New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.
-- Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

with tabla1 as(
SELECT user_id, signup_action, CASE signup_action WHEN 'Confirmed' THEN 1.0 ELSE 0 END as confirmados
FROM emails e
LEFT JOIN texts t ON t.email_id = e.email_id
where signup_action IS NOT NULL
ORDER BY user_id)


SELECT round(sum(confirmados)/COUNT(user_id),2) as confirm_rate
from tabla1;
