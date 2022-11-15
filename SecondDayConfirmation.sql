-- New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. Assume you are given the below tables about emails and texts.
-- Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

SELECT e.user_id  
FROM emails as e JOIN texts as t ON e.email_id = t.email_id
where EXTRACT(DAY FROM t.action_date) = EXTRACT(DAY FROM e.signup_date) +1; 
