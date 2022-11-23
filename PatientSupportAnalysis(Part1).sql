-- UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.
-- Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

with agrupado as (SELECT policy_holder_id, count(case_id) as member_count
FROM callers
group by policy_holder_id
having count(case_id) >= 3)
select count(*)
from agrupado;
