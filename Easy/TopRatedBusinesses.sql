-- Assume you are given the table below containing information on user reviews. Write a query to obtain the number and percentage of businesses that are top rated. A top-rated busines is defined as one whose reviews contain only 4 or 5 stars.
-- Output the number of businesses and percentage of top rated businesses rounded to the nearest integer.

SELECT count(business_id) as business_count, 
        ROUND((count(business_id) * 100)/(select count(*) from reviews),0) as top_rated_pct
FROM reviews
where review_stars = 4 OR review_stars = 5;
