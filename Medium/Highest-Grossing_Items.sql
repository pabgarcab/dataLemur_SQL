-- Assume you are given the table containing information on Amazon customers and their spending on products in various categories.
-- Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

with tabla1 as(
SELECT category, product, sum(spend) as total_spend

FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product
ORDER BY category, total_spend DESC
),
tabla2 as(
SELECT category, product, total_spend, RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) as orden
from tabla1
ORDER BY category, total_spend DESC) 

SELECT  category, product, total_spend
FROM tabla2
where orden In (1,2)
ORDER BY category, total_spend DESC;
