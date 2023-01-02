-- Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent.
-- Output the results in descending count of the messages.

SELECT sender_id, count(content) 
FROM messages
where EXTRACT(MONTH from sent_date) = 08  AND EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
 
ORDER BY count(message_id) DESC
LIMIT 2;
