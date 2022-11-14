-- The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. If someone's LinkedIn page has more followers than the company they work for, we can safely assume that person is a power creator.
-- Write a query to return the IDs of these LinkedIn power creators ordered by the IDs.

SELECT profile_id
FROM personal_profiles as p
JOIN company_pages as c ON p.employer_id = c.company_id 
where p.followers > c.followers
order by p.profile_id;
