-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.
-- Write a query to find the total sales of drugs for each manufacturer. Round your answer to the closest million, and report your results in descending order of total sale

SELECT manufacturer, FORMAT('%s%s %s','$',round(sum(total_sales)/1000000,0), 'million') as sale 
FROM pharmacy_sales
group by manufacturer
ORDER BY round(sum(total_sales)/1000000,0) DESC;
