-- Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).
-- Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.

SELECT round(sum(CASE WHEN call_category  is null OR call_category LIKE 'n/a' THEN 1.0
        ELSE 0
        END)
        /
        COUNT(policy_holder_id) * 100, 1) as call_percentage
FROM callers
;
