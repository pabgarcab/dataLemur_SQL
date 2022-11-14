-- Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). Define “mobile” as the sum of tablet and phone viewership numbers
-- Write a query to compare the viewership on laptops versus mobile devices.

select sum(CASE 
              WHEN device_type = 'laptop' THEN 1 END) as laptop_views,
        sum(CASE 
              WHEN device_type = 'phone' THEN 1 
              WHEN device_type = 'tablet' THEN 1 END) as mobile_views
from viewership;
