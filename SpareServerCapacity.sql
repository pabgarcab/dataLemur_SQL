-- Microsoft Azure's capacity planning team wants to understand how much data its customers are using, and how much spare capacity is left in each of it's data centers. You’re given three tables: customers, datacenters, and forecasted_demand.
-- Write a query to find the total monthly unused server capacity for each data center. Output the data center id in ascending order and the total spare capacity.

with suma as (
SELECT d.datacenter_id, sum(f.monthly_demand) as demand
FROM forecasted_demand as f
INNER JOIN datacenters as d ON d.datacenter_id = f.datacenter_id
INNER JOIN customers c ON c.customer_id = f.customer_id
GROUP BY d.datacenter_id
ORDER BY d.datacenter_id)

select s.datacenter_id, da.monthly_capacity - s.demand as spare_capacity
from suma as s
JOIN datacenters as da ON da.datacenter_id = s.datacenter_id

ORDER BY s.datacenter_id;
