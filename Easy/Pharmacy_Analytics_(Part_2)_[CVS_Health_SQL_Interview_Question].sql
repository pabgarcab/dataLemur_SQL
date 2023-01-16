-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.
Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 
-- Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.

with tabla1 as(
  SELECT manufacturer, COUNT(DISTINCT drug) as drug_count, sum(total_sales) as sales , sum(cogs) as gastos
  FROM pharmacy_sales
  WHERE cogs > total_sales
  GROUP BY manufacturer)

SELECT manufacturer, drug_count , (sales - gastos)*-1 as total_loss
FROM tabla1
GROUP BY manufacturer, drug_count, sales, gastos
ORDER BY total_loss DESC;
