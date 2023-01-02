-- Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data.
-- Write a SQL query that determines which parts have begun the assembly process but are not yet finished.

SELECT part
FROM parts_assembly
group by part
having count(finish_date) != COUNT(assembly_step)
order by part;
