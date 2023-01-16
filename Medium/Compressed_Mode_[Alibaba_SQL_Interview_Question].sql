-- You are trying to find the most common (aka the mode) number of items bought per order on Alibaba.
-- However, instead of doing analytics on all Alibaba orders, you have access to a summary table, which describes how many items were in an order (item_count), and the number of orders that had that many items (order_occurrences).

select item_count as mode
from items_per_order 
where order_occurrences = (SELECT max(order_occurrences) from items_per_order)
;
